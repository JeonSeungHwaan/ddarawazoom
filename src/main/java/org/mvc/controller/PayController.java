package org.mvc.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mvc.bean.DateFormatChange;
import org.mvc.bean.PaymentDTO;
import org.mvc.service.PaymentService;
import org.mvc.service.ZoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ddarawazoom")
public class PayController {
	
	@Autowired
	private ZoomService serviceZoom;
	
	@Autowired
	private PaymentService servicePayment;
	
	@Autowired
	private PaymentDTO paymentDTO;
	
	@Autowired
	private DateFormatChange dateFormat;
	
	private String impKey = "3390529037918084";
	private String impSecret = "0374ed2bfae3f054f7ff51e2c27c9503a06cb4099a069d85607c8888899772c8883878e2404ec8b7";
	private IamportClient api;
	public PayController() {
    	// REST API 키와 REST API secret
		this.api = new IamportClient(impKey, impSecret);
	}	
		
	
//================= 결제 내역 확인 및 저장 시작 =================//
	
	@RequestMapping("/payPro")
	public @ResponseBody int payPro(@RequestBody PaymentDTO dto) throws IamportResponseException, IOException {
		log.info("	------>payment verify: "+"검증 시작");
		
		// 상품 번호(merchant_Uid)로 DB에서 상품 가격 조회
		int idx = dto.getMerchantUid().indexOf("-");
		String merchant_Uid = dto.getMerchantUid().substring(0, idx);
		int amountToBePaid = serviceZoom.getPrice(merchant_Uid);
		
		// 결제 번호(imp_uid)와 금액(amountToBePaid)으로 결제 검증 후 DB 저장
		int result = 0;
		IamportResponse<Payment> verify = api.paymentByImpUid(dto.getImpUid());		
		if(verify.getResponse().getAmount().compareTo(BigDecimal.valueOf(amountToBePaid)) == 0) {
			log.info("	------>payment verify: " + "검증 성공");
			
			Payment payment = verify.getResponse();	// api로 결제 정보 조회 (iamport 서버)			 
			Date paidAt = payment.getPaidAt();
			String paidAtStr = dateFormat.dateTimeFull(paidAt);
			String status = payment.getStatus();
						
			dto.setPaidAt(paidAtStr);	// 추가 DTO 변수 저장
			dto.setStatus(status);
			
			result = servicePayment.paymentInsert(dto);
			if(result==1) {
				log.info("	------>payment save: "+"저장 성공");
			} else {
				log.info("	------>payment save: "+"저장 실패");
			}
			
		} else {
			log.info("	------>payment verify: " + "검증 실패");
		}
		return result;  
	}
//================= 결제 내역 확인 및 저장 종료 ====================//	
	

//================= 결제 취소 관련 시작 ==========================//
	
	@RequestMapping("/payRefund")
	public @ResponseBody int refund(@RequestBody PaymentDTO dto) throws IamportResponseException, IOException {		
		log.info("	------>cancel start: " + "취소 시작");
		int result = 0;
		
		// 주문번호에 대한 결제 내역 조회 (DB)
		paymentDTO = servicePayment.getMerchantUidInfo(dto.getMerchantUid());		
		String imp_uid = paymentDTO.getImpUid();			// 주문번호
		int amount = paymentDTO.getAmount();				// 결제된 금액
		int cancelAmount = paymentDTO.getCancelAmount();	// 기존에 환불된 총 금액		
		
		// 결제 취소 가능 확인
		int cancelAbleAmount = amount - cancelAmount;
		if(cancelAbleAmount <= 0) {		// 이미 전액 환불 된 경우
			result = -1;
			return result;
		}
		
		// 결제 취소 데이터 생성
		CancelData cancelData = new CancelData(imp_uid, true, BigDecimal.valueOf(dto.getCancelReqAmount()));
		cancelData.setChecksum(BigDecimal.valueOf(cancelAbleAmount));
		cancelData.setReason(dto.getCancelReason());
	
		// 결제 취소 요청
		IamportResponse<Payment> cancel = api.cancelPaymentByImpUid(cancelData);
		int cancelCode = cancel.getCode();	// 성공=0, 실패=1 or -1
		
		// 결제 취소 성공 > 취소 내역 DB 저장
		if(cancelCode == 0) {
			IamportResponse<Payment> verify = api.paymentByImpUid(imp_uid);	// 결제 번호(imp_uid)로 결제 조회				
			
			Payment paymentApi = verify.getResponse();	// api로 결제 정보 조회 (iamport 서버)			
			
			int cancelAmountInt = paymentApi.getCancelAmount().intValue();	
			String status = paymentApi.getStatus();
			String cancelReason = paymentApi.getCancelReason();
			Date cancelledAt = paymentApi.getCancelledAt();
			String cancelledAtStr = dateFormat.dateTimeFull(cancelledAt);
			
			log.info("	------>paymentApi: cancelReason" + cancelReason);
									 
			paymentDTO.setStatus(status);					//취소 관련 DTO 변수 업데이트
			paymentDTO.setCancelAmount(cancelAmountInt);				
			paymentDTO.setCancelReason(cancelReason);
			paymentDTO.setCancelledAt(cancelledAtStr);
			paymentDTO.setCancelpAmount(dto.getCancelpAmount());
						
			int result_tp = servicePayment.paymentCancelUpdateTP(paymentDTO);	// 성공=1, 실패=0
			int result_tc = servicePayment.paymentCancelUpdateTC(paymentDTO);
			
			if(result_tp == 1 && result_tc == 1) {
				result = 1;
				log.info("	------>cancel save: " + "저장 성공");
				return result;
			} else {
				log.info("	------>cancel save: " + "저장 실패");
			}
		}
		
		// 결제 취소 실패 
		if(cancelCode == -1) {
			result = 0;
			return result;
		}
		return result; 
	}
	
	
	@RequestMapping("/cancelReq")
	public @ResponseBody int cancelReq (@RequestBody PaymentDTO dto, HttpSession session) {
		log.info("	-----CT-----> cancelReq");
		int result = 0;
		
		// 주문번호에 대한 결제 내역 조회 (DB)
		paymentDTO = servicePayment.getMerchantUidInfo(dto.getMerchantUid());
		String imp_uid = paymentDTO.getImpUid();
		
		// 필요 번수 업데이트
		dto.setImpUid(imp_uid);
		dto.setStatus("creq");
		
		// 요청 내역 DB 반영
		int result_u = servicePayment.paymentCancelUpdateTP(dto);
		int result_i = servicePayment.paymentCancelInsert(dto);
	
		if(result_u == 1 && result_i == 1) {
			log.info("	-----CT-----> 성공");
			result = 1;
			return result;
		}
		
		return result;
	}
	
		
	@RequestMapping("/cancelDetail")
	public @ResponseBody List<PaymentDTO> cancel(String imp_Uid) {
		
		// 결제 취소 상세 내역 출력
		List<PaymentDTO> cancelList = servicePayment.getCancelList(imp_Uid);

		return cancelList;  
	}
	
	@RequestMapping("/cancelReqInfo")
	public @ResponseBody List<PaymentDTO> cancelReqInfo(String imp_Uid) {
		
		// 취소 요청 상세 내역 출력
		List<PaymentDTO> cancelReqList = servicePayment.getCancelReqInfo(imp_Uid);

		return cancelReqList;  
	}
	
//================= 결제 취소 관련 종료 ==========================//
	
}
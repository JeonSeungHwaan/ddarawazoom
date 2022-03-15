package org.mvc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.PaymentDTO;

public interface PaymentService {
	
	//결제 정보 입력
	public int paymentInsert(PaymentDTO dto);
	
	//주문번호에 대한 결제 정보 조회
	public PaymentDTO getMerchantUidInfo(String merchant_uid);
	
	//전체 주문 건수 조회
	public int getOerderCount();
	public int getOerderCountByStatus(String status);
	public int getSearchOerderCount(
			@Param("category")String category, 
			@Param("input")String input);
	public int getSearchOerderCountByStatus(
			@Param("status")String status, 
			@Param("category")String category, 
			@Param("input")String input);
	
	public int getMyOerderCount(String id);
	public int getMyOerderCountByStatus(String id, String status);
	public int getSearchMyOerderCount(
			@Param("id")String id, 
			@Param("category")String category, 
			@Param("input")String input);
	public int getSearchMyOerderCountByStatus(
			@Param("id")String id, 
			@Param("status")String status, 
			@Param("category")String category, 
			@Param("input")String input);
	
	public int getCoachOerderCount(String c_id);
	public int getCoachOerderCountByStatus(String c_id, String status);
	public int getSearchCoachOerderCount(
			@Param("c_id")String c_id, 
			@Param("category")String category, 
			@Param("input")String input);
	public int getSearchCoachOerderCountByStatus(
			@Param("c_id")String c_id, 
			@Param("status")String status, 
			@Param("category")String category, 
			@Param("input")String input);
	
	
	//결제 내역 전체 조회, 결제 내역 검색
	public List<PaymentDTO> getPaymentList();
	public List<PaymentDTO> getSearchPaymentList(String category, String input);
	
	//내 결제 내역
	public List<PaymentDTO> getPaymentMyList(String id);
	public List<PaymentDTO> getSearchPaymentMyList(
			@Param("id")String id, 
			@Param("category")String category, 
			@Param("input")String input);
	
	//코치별 결제 내역
	public List<PaymentDTO> getPaymentCoachList(String c_id);
	public List<PaymentDTO> getSearchPaymentCoachList(
			@Param("c_id")String c_id, 
			@Param("category")String category,
			@Param("input")String input);	
	
	//강의별 결제 내역
	public List<PaymentDTO> getPaymentClassList(String c_num);

	//결제 취소 상세 내역 출력
	public List<PaymentDTO> getCancelList(String imp_Uid);
	public List<PaymentDTO> getCancelReqInfo(String imp_Uid);
	
	
	//결제 취소 내역 업데이트
	public int paymentCancelUpdateTP(PaymentDTO dto);
	public int paymentCancelUpdateTC(PaymentDTO dto);
	
	//결제 취소 내역 입력
	public int paymentCancelInsert(PaymentDTO dto);
	
	
	// 총 거래 금액
	public int getAmountTotal();
	
	// 총 환불 금액
	public int getCancelAmountTotal();
	
	// 검색된 거래금액
	public int getSearchAmountTotal(String category, String input);
	
	// 검색된 환불 금액
	public int getSearchCancelAmountTotal(String category, String input);
	
	
	//코치별 총 거래 금액
	public int getAmountCoach(String c_id);
	
	//코치별 총 환불 금액
	public int getCancelAmountCoach(String c_id);
	
	//코치별 검색된 거래금액
	public int getSearchAmountCoachTotal(String c_id, String category, String input);
	
	//코치별 검색된 환불 금액
	public int getSearchCancelAmountCoachTotal(String c_id, String category, String input);
	
	
	//나의 총 거래 금액
	public int getAmountMy(String id);
		
	//나의 총 환불 금액
	public int getCancelAmountMy(String id);

}

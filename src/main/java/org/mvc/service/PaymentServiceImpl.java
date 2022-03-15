package org.mvc.service;

import java.util.List;

import org.mvc.bean.PaymentDTO;
import org.mvc.mybatis.PaymentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentMapper mapper;
	
	@Override
	public int paymentInsert(PaymentDTO dto) {
		return mapper.paymentInsert(dto);
	}
	
	@Override
	public PaymentDTO getMerchantUidInfo(String merchant_uid) {
		return mapper.getMerchantUidInfo(merchant_uid);
	}
	
	@Override
	public int getOerderCount() {
		return mapper.getOerderCount();
	}
	
	@Override
	public int getOerderCountByStatus(String status) {
		return mapper.getOerderCountByStatus(status);
	};
	

	@Override
	public int getSearchOerderCount(String category, String input) {
		return mapper.getSearchOerderCount(category, input);
	}	

	@Override
	public int getSearchOerderCountByStatus(String status, String category, String input) {
		return mapper.getSearchOerderCountByStatus(status, category, input);

	}
	
	@Override
	public int getMyOerderCount(String id) {
		return mapper.getMyOerderCount(id);
	}
	
	@Override
	public int getMyOerderCountByStatus(String id, String status) {
		return mapper.getMyOerderCountByStatus(id, status);
	};

	@Override
	public int getSearchMyOerderCount(String id, String category, String input) {
		return mapper.getSearchMyOerderCount(id, category, input);
	}

	@Override
	public int getSearchMyOerderCountByStatus(String id, String status, String category, String input) {
		return mapper.getSearchMyOerderCountByStatus(id, status, category, input);
	}
	
	@Override
	public int getCoachOerderCount(String c_id) {
		return mapper.getCoachOerderCount(c_id);
	}
	
	@Override
	public int getCoachOerderCountByStatus(String c_id, String status) {
		return mapper.getCoachOerderCountByStatus(c_id, status);
	};	

	@Override
	public int getSearchCoachOerderCount(String c_id, String category, String input) {
		return mapper.getSearchCoachOerderCount(c_id, category, input);
	}

	@Override
	public int getSearchCoachOerderCountByStatus(String c_id, String status, String category, String input) {
		return mapper.getSearchCoachOerderCountByStatus(c_id, status, category, input);
	}

	
	@Override
	public List<PaymentDTO> getPaymentList() {
		return mapper.getPaymentList();
	}

	@Override
	public List<PaymentDTO> getSearchPaymentList(String category, String input) {
		return mapper.getSearchPaymentList(category, input);
	}

	@Override
	public List<PaymentDTO> getPaymentMyList(String id) {
		return mapper.getPaymentMyList(id);
	}

	@Override
	public List<PaymentDTO> getSearchPaymentMyList(String id, String category, String input) {
		return mapper.getSearchPaymentMyList(id, category, input);
	}

	@Override
	public List<PaymentDTO> getPaymentCoachList(String c_id) {
		return mapper.getPaymentCoachList(c_id);
	}

	@Override
	public List<PaymentDTO> getSearchPaymentCoachList(String c_id, String category, String input) {
		return mapper.getSearchPaymentMyList(c_id, category, input);
	}
	
	@Override
	public List<PaymentDTO> getPaymentClassList(String c_num) {
		return mapper.getPaymentClassList(c_num);
	}
	
	@Override
	public List<PaymentDTO> getCancelList(String imp_Uid) {
		return mapper.getCancelList(imp_Uid);
	}
	
	@Override
	public List<PaymentDTO> getCancelReqInfo(String imp_Uid){
		return mapper.getCancelReqInfo(imp_Uid);
	}
	
	@Override
	public int paymentCancelUpdateTP(PaymentDTO dto) {
		return mapper.paymentCancelUpdateTP(dto);
	}
	
	@Override
	public int paymentCancelUpdateTC(PaymentDTO dto) {
		return mapper.paymentCancelUpdateTC(dto);
	}

	@Override
	public int paymentCancelInsert(PaymentDTO dto) {
		return mapper.paymentCancelInsert(dto);
	}
	
	
	
	@Override
	public int getAmountTotal() {
		return mapper.getAmountTotal();
	}

	@Override
	public int getCancelAmountTotal() {
		return mapper.getCancelAmountTotal();
	}

	@Override
	public int getSearchAmountTotal(String category, String input) {
		return mapper.getSearchAmountTotal(category, input);
	}

	@Override
	public int getSearchCancelAmountTotal(String category, String input) {
		return mapper.getSearchCancelAmountTotal(category, input);
	}

	
	
	@Override
	public int getAmountCoach(String c_id) {
		return mapper.getAmountCoach(c_id);
	}

	@Override
	public int getCancelAmountCoach(String c_id) {
		return mapper.getCancelAmountCoach(c_id);
	}

	@Override
	public int getSearchAmountCoachTotal(String c_id, String category, String input) {
		return mapper.getSearchAmountCoachTotal(c_id, category, input);

	}

	@Override
	public int getSearchCancelAmountCoachTotal(String c_id, String category, String input) {
		return mapper.getSearchCancelAmountCoachTotal(c_id, category, input);

	}
	
	
	
	@Override
	public int getAmountMy(String id) {
		return mapper.getAmountMy(id);
	}

	@Override
	public int getCancelAmountMy(String id) {
		return mapper.getCancelAmountMy(id);
	}


	
}

package org.mvc.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvc.bean.PaymentDTO;

public interface PaymentMapper {
	
	public int paymentInsert(PaymentDTO dto);	
	
	public PaymentDTO getMerchantUidInfo(String merchant_uid);
	
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
	public int getMyOerderCountByStatus(@Param("id")String id, @Param("status")String status);
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
	public int getCoachOerderCountByStatus(@Param("c_id")String c_id, @Param("status")String status);
	public int getSearchCoachOerderCount(
			@Param("c_id")String c_id, 
			@Param("category")String category, 
			@Param("input")String input);
	public int getSearchCoachOerderCountByStatus(
			@Param("c_id")String c_id, 
			@Param("status")String status, 
			@Param("category")String category, 
			@Param("input")String input);

	
	public List<PaymentDTO> getPaymentList();
	public List<PaymentDTO> getSearchPaymentList(@Param("category")String category, @Param("input")String input);	
	public List<PaymentDTO> getPaymentMyList(String id);
	public List<PaymentDTO> getSearchPaymentMyList(
			@Param("id")String id, 
			@Param("category")String category, 
			@Param("input")String input);	
	public List<PaymentDTO> getPaymentCoachList(String c_id);
	public List<PaymentDTO> getSearchPaymentCoachList(
			@Param("c_id")String c_id, 
			@Param("category")String category,
			@Param("input")String input);	
	public List<PaymentDTO> getPaymentClassList(String c_num);	
	public List<PaymentDTO> getCancelList(String imp_Uid);
	public List<PaymentDTO> getCancelReqInfo(String imp_Uid);


	public int paymentCancelUpdateTP(PaymentDTO dto);	
	public int paymentCancelUpdateTC(PaymentDTO dto);
	public int paymentCancelInsert(PaymentDTO dto);	

	public int getAmountTotal();
	public int getCancelAmountTotal();	
	public int getSearchAmountTotal(@Param("category")String category, @Param("input")String input);	
	public int getSearchCancelAmountTotal(@Param("category")String category, @Param("input")String input);	

	public int getAmountCoach(String c_id);	
	public int getCancelAmountCoach(String c_id);
	public int getSearchAmountCoachTotal(@Param("c_id")String c_id, String category, String input);
	public int getSearchCancelAmountCoachTotal(@Param("c_id")String c_id, @Param("category")String category, @Param("input")String input);

	public int getAmountMy(String id);	
	public int getCancelAmountMy(String id);
	
	

}

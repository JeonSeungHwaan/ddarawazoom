package org.mvc.bean;

import lombok.Data;

@Data
public class PaymentDTO {
	private String impUid;
	private String merchantUid;
	private String name;
	private int amount;
	private String buyerName;
	private String buyerTel;
	private String buyerEmail;
	private String paidAt;
	private String status;
	private String c_id;
	private String c_num;
	
	private int cancelAmount;
	private int cancelpAmount;
	private String cancelReason;
	private String cancelledAt;
	
	private int cancelReqAmount;
}

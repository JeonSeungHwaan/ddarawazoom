<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!-- iamport jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<!-- iamport payment cancel -->
<script 
	src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous">
</script>


<script type="text/javascript">	  
$(document).ready(function(){
   	
   	//01. 결제 준비
	var IMP = window.IMP;
	IMP.init("imp37432029");  //가맹점 식별 코드

	//02. 결제 하기
	$('#payBtn').click(function() {	// 결제하기 버튼 클릭      

		var paymentData = new Object();	// json 데이터 생성
		paymentData.merchantUid = "${zoomContent.merchant_uid}"+"-ORD"+"${cnt}";
		paymentData.c_id = "${zoomContent.c_id}";
		paymentData.c_num = ${zoomContent.num};
		paymentData.name = "${zoomContent.title}";
		paymentData.amount = ${zoomContent.price};
		paymentData.buyerName = "${userInfo.id}";
		paymentData.buyerEmail = "${userInfo.email}";
		paymentData.buyerTel = "${userInfo.tel}";
		console.log(paymentData);
		
		IMP.request_pay({		// iamport 결제 요청
			pg: "nice",						// pg사
	        pay_method: "card",				// 지불 수단
	        merchant_uid: paymentData.merchantUid,	// 제품 주문번호
       		name: paymentData.name,					// 강의명
	        amount: paymentData.amount,				// 강의(제품) 가격
	        buyer_name: paymentData.buyerName,		// 구매자 id
	        buyer_email: paymentData.buyerEmail,	// 구매자 email
	        buyer_tel: paymentData.buyerTel			// 구매자 전화번호
	        },
        
	        function (rsp) {	// 결제 callback
	            if (rsp.success) {	// 결제 성공 시 로직         		       	            		            	
	            	paymentData.impUid = rsp.imp_uid;		            	
	            	var msg = '결제 완료';
	            	$.ajax({
	                    type: "post",
	                    dataType: "json",
	                    contentType : "application/json; charset=UTF-8",
	            		data: JSON.stringify(paymentData),
	                    url: "/ddarawazoom/payPro", // data 보낼 주소		                    	                    	
	                    success: function(result){	// data 전송 성공 했을때                		                    	
	                    	console.log(result);
	                    	if(result == 1){
	                    		console.log("Payment All Success");
	        	            	msg += '(' + rsp.name +')';	        	            	
	                    	} else {
	                    		console.log("Payment Warn");
	                    	}
	                    }
	                });	            	
	            } else {	            	
	                // 결제 실패 시 로직,
	                var msg = '결제 실패';
	                msg += '(' + rsp.error_msg +')';	               
				}
	            alert(msg);
			}
        );
	});
			
});
</script>


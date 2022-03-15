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

	//03. 결제 취소 하기		
	$(".refundBtn").click(function (){	// 취소하기 or 잔여금액 취소하기 버튼 클릭
		$("#refundModal").modal('show');	// 모달창 호출
		
		var tdArr = new Array();			// 클릭한 행(row) 데이터
		var refundBtn = $(this);
		var tr = refundBtn.parent().parent();
		var td = tr.children();
		
		var cancelData = new Object();		// json 데이터 생성
		cancelData.merchantUid = td.eq(1).text();
		cancelData.cancelAmount = td.eq(3).text();		

		$('#refundCheckBtn').click(function () {
			cancelData.cancelReason = $("#refundReason").val();
			cancelData.cancelpAmount = $("#partialAmount").val();
			
			var refund_type = $("input[name=refundType]:checked").val()	// 환불 타입 결정
			console.log(refund_type);			
			if(refund_type == "all"){		// 전액 환불
				cancelData.cancelReqAmount = cancelData.cancelAmount;
			} 
			if(refund_type == "partial") {	// 부분 환불								
				cancelData.cancelReqAmount = cancelData.cancelpAmount;
			}	
		
			$.ajax({
                type: "post",
                dataType: "json",
                contentType : "application/json; charset=UTF-8",
                data: JSON.stringify(cancelData),
                url: "/ddarawazoom/payRefund", // data 보낼 주소                	                    	
                success: function(result){	// data 전송 성공 했을때	                		                    	
                	console.log(result);
                	if(result == 1){
                		console.log("Payment Cancle All Success");
                		var msg = '결제 취소를 완료하였습니다.';	                		        	            	
                	} else if (result == -1) {
                		console.log("Alredy All Canclled");
                		var msg = '이미 전액 최소된 주문입니다.';
                	} else {
                		console.log("Payment Cancle Failed");
                		var msg = '결제 최소에 실패하였습니다. 전화 문의(1661-0808)';
                	}
                	alert(msg);
                	$('#refundModal').modal('hide');
                	location.reload();
                }
            });
		});
	});
	
	
	//04. 결제 취소 요청 하기		
	$(".refundReqBtn").click(function (){	// 취소하기 or 잔여금액 취소하기 버튼 클릭
		$("#refundModal").modal('show');	// 모달창 호출
		
		var tdArr = new Array();			// 클릭한 행(row) 데이터
		var refundReqBtn = $(this);
		var tr = refundReqBtn.parent().parent();
		var td = tr.children();
		
		var cancelReqData = new Object();		// json 데이터 생성
		cancelReqData.merchantUid = td.eq(1).text();
		cancelReqData.cancelReqAmount = td.eq(3).text();

		$('#refundCheckBtn').click(function () {
			cancelReqData.cancelReason = $("#refundReason").val(); 
			cancelReqData.cancelpAmount = $("#partialAmount").val();
			
			var refund_type = $("input[name=refundType]:checked").val();
			if(refund_type == "partial") {	// 부분 환불								
				cancelReqData.cancelReqAmount = cancelReqData.cancelpAmount;
			}	

			$.ajax({
                type: "post",
                dataType: "json",
                contentType : "application/json; charset=UTF-8",
                data: JSON.stringify(cancelReqData),
                url: "/ddarawazoom/cancelReq", // data 보낼 주소                	                    	
                success: function(result){	// data 전송 성공 했을때	                		                    	
                	console.log(result);
                	if(result == 1){
                		var msg = '취소 요청을 전달하였습니다.';	                		        	            	
                	} else {
                		var msg = '다시 한번 시도해주세요';
                	}
                	alert(msg);
                	$('#refundModal').modal('hide');           
                }
            });
			location.reload();
		});
	});
	
	
	//05. 취소 상세 내역 출력
	$(".refundDone").click(function (){
		var tdArr = new Array();			// 클릭한 행(row) 데이터
		var refundDone = $(this);
		var tr = refundDone.parent().parent();
		var td = tr.children();
		var imp_Uid = td.eq(0).text();
		var trIndex = tr.index()+1;
		
		$.ajax({
            type: "post",
    		data: {"imp_Uid":imp_Uid},
            url: "/ddarawazoom/cancelDetail", // data 보낼 주소		                    	                    	
            success: function(cancelList){	// data 전송 성공 했을때                		                    	
            	console.log(cancelList);
            	var detail="";
            	$.each(cancelList, function(index, item) {
            		detail += item.cancelledAt + " ";
            		detail += item.cancelReason + "</br>";
            	});
            	$("tr:eq("+trIndex+") #c-detail").toggle();
            	$("tr:eq("+trIndex+") #c-detail").html(detail);      	           
            }
        });
	});
	
	//06. 취소 요청 내역 출력
	$(".refundReqInfo").click(function (){
		var tdArr = new Array();			// 클릭한 행(row) 데이터
		var refundReqInfo = $(this);
		var tr = refundReqInfo.parent().parent();
		var td = tr.children();
		var imp_Uid = td.eq(0).text();
		var trIndex = tr.index()+1;

		$.ajax({
            type: "post",
    		data: {"imp_Uid":imp_Uid},
            url: "/ddarawazoom/cancelReqInfo", // data 보낼 주소		                    	                    	
            success: function(cancelReqList){	// data 전송 성공 했을때                		                    	
            	console.log(cancelReqList);
            	var detail="";
            	$.each(cancelReqList, function(index, item) {            		
            		detail += "[환불요청:"
            		detail += item.cancelReqAmount + "원]</br>";
            		detail += "이유: " + item.cancelReason + "</br>";
            	});

            	$("tr:eq("+trIndex+") #c-req-detail").toggle();
            	$("tr:eq("+trIndex+") #c-req-detail").html(detail);      	           
            }
        });
	});
			
});
</script>


<!-- Modal -->
<div class="modal fade" id="refundModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content rounded-6 shadow">
      <div class="modal-header border-bottom-0">
        <h5 class="modal-title">결제 취소</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body px-5 py-2">
      	<div class="form-floating mb-2">
	        <input type="text" class="form-control rounded-4" id="refundReason" placeholder="환불 사유가 무엇인가요?">
	        <label for="refundReason" >환불 사유가 무엇인가요?</label>
        </div>
      </div>
      
      <div class="d-flex gap-5 justify-content-center">
  		<div class="list-group mx-0">
  			<label class="list-group-item d-flex gap-2">
      			<input class="form-check-input flex-shrink-0" type="radio" name="refundType" id="refundAll" value="all" checked>     			
      			<span>
       				전액 환물
				</span>
    		</label>
    		<label class="list-group-item d-flex gap-2">
      			<input class="form-check-input flex-shrink-0" type="radio" name="refundType" id="refundPartial" value="partial">
      			<span>
       				일부 환불 <input type="number" name="partailAmount" id="partialAmount" value=""></input>
      			</span>
    		</label> 	
		</div>
      </div>
      
      <div class="modal-footer flex-column border-top-0">
        <button type="button" class="btn btn-lg btn-primary w-100 mx-0 mb-2" id="refundCheckBtn">Save changes</button>
        <button type="button" class="btn btn-lg btn-light w-100 mx-0" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>


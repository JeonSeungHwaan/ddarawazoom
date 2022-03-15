<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../../layout/header.jsp"%>
<%@ include file="../../pay/cancel.jsp"%>

<script src="/resources/coach/custom/js/coach-info.js" type="text/javascript"></script>

<script>
	function valueCheck(){
		if($('#search-input').val() == ''){
			alert('검색어를 입력해주세요.');
			return false;
		}
	}	
</script>

<section class="masthead">
	<h2 style="text-align: center;"> 코치 수입 관리	
		<button class="btn btn-lg btn-outline-dark">
			총: ${orderCount}건 거래
		</button>
		<button class="btn btn-lg btn-success">
			결제완료: ${orderPaidCount}건
		</button>
		<button class="btn btn-lg btn-secondary">
			취요청중: ${orderCreqCount}건
		</button>
		<button class="btn btn-lg btn-outline-danger">
			취소완료: ${orderCanclledCount}건
		</button>
	</h2>	
	<hr class="featurette-divider">
	
	<div class="col-md-9 m-sm-auto col-lg-10 px-md-4 fs-7">
		<p class="text-end m-sm-0">(+) 총 거래액: ${amount}</p>
		<p class="text-end m-sm-0">(-) 총 환불액: ${cancelAmount}</p>
		<p class="text-end m-sm-0">(=) 총 매출액: ${sales}</p>
	</div>
	
	<div class="table-responsive col-md-9 m-sm-auto col-lg-10 px-md-4" >
		<form action="/coachroom/paymentSearch" method="post" onsubmit="return valueCheck()">
		  <div style="width: 50%; text-align: center; margin: auto 0;">
			  <div class="input-group mb-3">
			    <select class="form-select form-select-sm" id="search-category" name="category" style="width: 25%;">
			      <option selected value="">선택하세요</option>
			      <option value="name">강의제목</option>
			      <option value="buyername">구매자</option>
			    </select>			  
			    <input type="text" class="form-control" placeholder="검색어를 입력하세요" style="width: 60%;" id="search-input" name="input">
			    <button class="btn btn-outline-secondary" type="submit" id="search-btn" style="width: 15%;">검색</button>
			  </div>
		  </div>		  
		</form>
		<table id="paymentList" class="table table-striped table-sm table-hover">
			<thead>
	            <tr>
					<th scope="col">결제번호</th>
	              	<th scope="col">주문번호</th>
	              	<th scope="col">강의</th>
	              	<th scope="col">결제금액</th>
	              	<th scope="col">환불금액</th>
	              	<th scope="col">구매자</th>
	              	<th scope="col">결제시각</th>
	              	<th scope="col">상태</th>
	            </tr>
			</thead>
			<tbody>
				<c:forEach items="${payment}" var="paymentDTO">
            		<tr>
		              	<td>${paymentDTO.impUid}</td>
		              	<td>${paymentDTO.merchantUid}</td>
		              	<td>
		              		${paymentDTO.c_num}) ${paymentDTO.name}</br>
		              		${paymentDTO.c_id}</br>		              		
		              	</td>
		              	<td>${paymentDTO.amount}</td>
		              	<td>${paymentDTO.cancelAmount}</td>
		              	<td>
		              		${paymentDTO.buyerName}</br>
		              		${paymentDTO.buyerTel}</br>
		              		${paymentDTO.buyerEmail}</br>
		              	</td>
		              	<td>${paymentDTO.paidAt}</td>
		              	<td>		              		
		              		<c:if test="${paymentDTO.status == 'paid'}">		              				 	 
	               				<button class="btn btn-sm btn-success" disabled>결제완료</button>
              				</c:if>
              				<c:if test="${paymentDTO.status == 'creq'}">		              				 	 
	               				<button class="refundReqInfo btn btn-sm btn-secondary" >취소요청중</button></br>
	               				<div id="c-req-detail" style="display: none;"></div>	              				 	 
		              			<button class="refundBtn btn btn-sm btn-outline-dark" data-toggle="modal" data-target="#refundModal">
	              					취소하기
	              				</button> 
              				</c:if>		              				
		              		<c:if test="${paymentDTO.status == 'cancelled'}">
		              			<button class="refundDone btn btn-sm btn btn-danger" id="">취소완료</button></br>		              				              			
		              			<div id="c-detail" style="display: none;"></div>
		              		</c:if>							
		              		<c:if test="${paymentDTO.status == 'cancelled' && paymentDTO.amount - paymentDTO.cancelAmount > 0}">		              			
		              			<button class="refundBtn btn btn-sm btn-outline-dark" data-toggle="modal" data-target="#refundModal">
		              				잔여금액 취소하기          				
	              				</button>		              			
		              		</c:if>		              			              		
		              	</td>
            		</tr>
				</c:forEach>        
			</tbody>
		</table>
	</div>
</section>


<%@ include file="../../layout/footer.jsp"%>
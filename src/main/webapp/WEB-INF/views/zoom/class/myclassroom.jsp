<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../../layout/header.jsp"%>
	
<section class="masthead">
	<div class="table-responsive col-md-8 m-sm-auto col-lg-8 px-md-4" >    
		<table id="PaymentMyList" class="table table-striped table-sm table-hover">
			<thead>
			<div class="album py-2 bg-light"><br>
		    	<h2 style="text-align: center;"> 따라와 줌 </h2>
		    	<h3 style="text-align: center;"> 온라인PT 내 강의실</h3><br>
		    </div>	
	            <tr>						              
	              	<th scope="col">강의</th>	             
	              	<th scope="col">구매자</th>
	              	<th scope="col">결제시각</th>
	              	<th scope="col">상태</th>
	            </tr>
			</thead>
			<tbody>	 
			<c:forEach items="${payment}" var="paymentDTO">
            		<tr>		             		         
		              	<td>
		              		${paymentDTO.c_num}) ${paymentDTO.name}</br> 
		              		${paymentDTO.c_id}</br>		              		
		              	</td>		              
		              	<td>
		              		${paymentDTO.buyerName}</br>
		              		${paymentDTO.buyerTel}</br>
		              		${paymentDTO.buyerEmail}</br> 
		              	</td>
		              	<td>${paymentDTO.paidAt}</td>
		              	<td>		              		
		              		<c:if test="${paymentDTO.status == 'paid'}">		              				 	 
	               				<button class="btn btn-sm btn-success" disabled>결제완료</button></br>	
	               				<button class="btn btn-sm btn-primary" onclick="document.location.href='/ddarawazoom/zclassroom'">강의실입장</button></br>			              		
              				</c:if>
              				<c:if test="${paymentDTO.status == 'creq'}">		              				 	 
	               				<button class="refundReqInfo btn btn-sm btn-secondary" disabled>취소요청중</button></br>
              				</c:if>		
              				<c:if test="${paymentDTO.status == 'cancelled'}">
		              			<button class="refundDone btn btn-sm btn btn-danger" disabled>취소완료</button></br>		              				              			
		              		</c:if>	              				             								            	              			              		
		              	</td>		              
            		</tr>
            </c:forEach>				      
			</tbody>
		</table>
	</div>
</section>

<%@ include file="../../layout/footer.jsp"%> 
	
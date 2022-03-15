<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
<script src="/resources/manager/custom/js/coach.js" type="text/javascript"></script>
<link href="/resources/coach/custom/css/carousel.css" rel="stylesheet" />

<%@ include file="../../layout/header.jsp"%>   
      
<div class="container marketing">
  <h2 style="text-align: center;"> 코치 관리 </h2>
  <c:if test="${count == 0}">
  	  <hr class="featurette-divider">
		
	  <div class="row featurette">
	    <div class="col-md-12">
	      <h2 class="featurette-heading" style="text-align: center;">아직 등록한 코치가 없습니다.</h2>
	    </div>
	  </div>
  </c:if>
  
  <hr class="featurette-divider">
  
  <c:if test="${count > 0}">
  
	  <div class="row featurette">
	    <div class="col-md-12">
	    
	      <table class="table table-bordered">
  		    <thead>
		      <tr>
		        <th scope="col" style="width: 8%; text-align: center;"></th>
		        <th scope="col" style="width: 30%;">코치 목록</th>
		        <th scope="col" style="width: 30%;">코치 닉네임</th>
		        <th scope="col" style="width: 8%; text-align: center;">코치 상태</th>
		        <th scope="col" style="text-align: center;">코치 관리</th>
		      </tr>
		    </thead>
		    <tbody>
		      <c:forEach var="coachInfo" items="${allCoachInfo}">
		        <tr>
		          <th scope="row">코치 ID</th>
		          <td>${coachInfo.c_id}</td>
		          <td>${coachInfo.c_nick}</td>
		          
		          <c:set var="coachStatus" value="${coachInfo.c_status}" />
		          <td style="text-align: center;">
		          	<c:if test="${coachStatus == '코치'}">
		          		<font color="#00CC66">정상</font>
		          	</c:if>
		          	<c:if test="${coachStatus == '경고'}">
		          		<font color="#CCCC00">경고</font>
		          	</c:if>
		          	<c:if test="${coachStatus == '정지'}">
		          		<font color="#CC0000">정지</font>
		          	</c:if>
		          	<c:if test="${coachStatus == '승인대기'}">
		          		<font color="#990099">승인대기</font>
		          	</c:if>
		          	<c:if test="${coachStatus == '승인거부'}">
		          		<font color="#CC0000">승인거부</font>
		          	</c:if>
		          </td>
		          
		          <td style="text-align: center;">
		          	<c:if test="${coachStatus == '코치'}">
		          		<button type="button" class="btn btn-sm btn-outline-secondary"
		                	onclick="window.location='/manager/coachInfo?c_id=${coachInfo.c_id}'">코치 정보</button>
		                 <button type="button" class="btn btn-sm btn-outline-warning"
		                	onclick="coachStatus('${coachInfo.c_id}', '경고')">경고</button>
		                 <button type="button" class="btn btn-sm btn-outline-danger"
		                	onclick="coachStatus('${coachInfo.c_id}', '정지')">정지</button>
		          	</c:if>
		          	<c:if test="${coachStatus == '경고'}">
		          		<button type="button" class="btn btn-sm btn-outline-secondary"
		                	onclick="window.location='/manager/coachInfo?c_id=${coachInfo.c_id}'">코치 정보</button>
		                 <button type="button" class="btn btn-sm btn-outline-warning"
		                	onclick="coachStatus('${coachInfo.c_id}', '코치')">경고 철회</button>
		                 <button type="button" class="btn btn-sm btn-outline-danger"
		                	onclick="coachStatus('${coachInfo.c_id}', '정지')">정지</button>
		          	</c:if>
		          	<c:if test="${coachStatus == '정지'}">
		          		<button type="button" class="btn btn-sm btn-outline-secondary"
		                	onclick="window.location='/manager/coachInfo?c_id=${coachInfo.c_id}'">코치 정보</button>
		                 <button type="button" class="btn btn-sm btn-outline-danger"
		                	onclick="coachStatus('${coachInfo.c_id}', '코치')">정지 철회</button>
		          	</c:if>
		          	<c:if test="${coachStatus == '승인대기'}">
		          		<button type="button" class="btn btn-sm btn-outline-secondary"
		                	onclick="window.location='/manager/coachInfo?c_id=${coachInfo.c_id}'">코치 정보</button>
		                <button type="button" class="btn btn-sm btn-outline-primary"
		                	onclick="coachStatus('${coachInfo.c_id}', '코치')">코치 승인</button>
		                <button type="button" class="btn btn-sm btn-outline-danger"
		                	onclick="coachStatus('${coachInfo.c_id}', '승인거부')">승인 거부</button>
		          	</c:if> 	
		          </td>
		        </tr>
		      </c:forEach>
  		    </tbody>
		  </table>
	    </div>
	  </div>
	  
  </c:if>
  	     
</div>

<%@ include file="../../layout/footer.jsp"%>
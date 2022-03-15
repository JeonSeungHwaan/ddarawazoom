<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		
<script src="/resources/coach/custom/js/dashboard.js" type="text/javascript"></script>

<div class="container-fluid">

    <main class="col-md-9 m-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">매출 그래프</h1>
      </div>
      
	  <div class="chart-wrap mt-2">
      	<canvas class="my-4 w-100" id="myChart" style="height:40vh; width:50vw; margin: 0 auto;"></canvas>
	  </div>
      
      <h2>최신 리뷰</h2>
      <div class="table-responsive">
      	<c:if test="${reviewList == null}">
      		<hr class="featurette-divider">
		
		   <div class="featurette">
		     <div class="col-md-12">
		       <h2 class="featurette-heading" style="text-align: center;">아직 작성된 리뷰가 없습니다.</h2>
	 	     </div>
		   </div>
      	</c:if>
      	
      	<c:if test="${reviewList != null}"> 
      		
	        <table class="table table-striped table-sm table-bordered">
	          <thead>
	            <tr>
	              <th scope="col" style="width: 30%">강의 제목</th>
	              <th scope="col" style="width: 15%">회원 닉네임</th>
	              <th scope="col">후기</th>
	            </tr>
	          </thead>
	          <tbody>
	          
	          <c:forEach var="list" items="${reviewList}">
	            <tr>
	              <td>${list.title}</td>
	              <td>${list.nick}</td>
	              <td>${list.content}</td>
	            </tr>
	          </c:forEach>
	          
	          </tbody>
	        </table>
        
        </c:if>
        
      </div>
    </main>
    
</div>



<%@ include file="../layout/footer.jsp"%>
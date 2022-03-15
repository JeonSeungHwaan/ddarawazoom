<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/coach/custom/js/review.js" type="text/javascript"></script>

<div class="container-fluid">
  
  <div class="album py-2 bg-light">
    <h1 style="text-align: center;"> 리뷰/회원 관리 </h1>
    <div class="container">

      <div class="row row-cols-2 row-cols-sm-1 row-cols-md-3 g-2">
      <c:if test="${count == 0}">
	      <section class="py-5 text-center container">
		    <div class="row py-lg-5">
		      <div class="col-lg-12 col-md-12 mx-auto">
		        <h1 class="fw-light">아직 등록하신 수업이 없습니다.</h1>
		        <hr class="my-4">
		        <p class="lead text-muted">코치님만의 개성있고 파워풀한 수업을 등록해보세요!</p>
		        <p>
		          <button type="button" class="btn btn-primary my-2"
		          	onclick="window.location='/ddarawazoom/zwriteForm?c_id=${sessionScope.c_id}'">수업 등록하러가기 ☞</button>
		        </p>
		      </div>
		    </div>
		  </section>
      </c:if>	
      
      <c:if test="${count > 0}">
      	 <c:forEach var="list" items="${classList}">
      	 
      	  <div class="col">
	        <div class="card shadow-sm">
	          <img src="/resources/coach/img/${list.img}" class="card-img-top" width="100" height="225">
	          <div class="card-body">
	            <p class="card-text">${list.title}</p>
	            <div class="d-flex justify-content-between align-items-center">
	              <div class="btn-group">
	                <button type="button" class="btn btn-sm btn-outline-secondary"
	                	onclick="window.location='/coachroom/reviewContent?num=${list.num}'">리뷰 보기</button>
	                <button type="button" class="btn btn-sm btn-outline-secondary"
	                	onclick="window.location='/coachroom/member?c_num=${list.num}'">등록한 회원 보기</button>	
	              </div>
	              <small class="text-muted">9 mins</small>
	            </div>
	          </div>
	        </div>
          </div>
          
	    </c:forEach>
       </c:if>
        
      </div>
      
    </div>
  </div>
  
  <c:if test="${pageCount > 1}">
  	<c:if test="${startPage > 10}">
		<a href="/coachroom/class?pageNum=${startPage - 10}">[이전]</a>	
	</c:if>
	
	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
		<a href="/coachroom/class?pageNum=${i}">[${i}]</a>
	</c:forEach>
	
	<c:if test="${endPage < pageCount}">
		<a href="/coachroom/class?pageNum=${startPage + 10}">[다음]</a>
	</c:if>
  </c:if>
    
</div>


    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
    <script src="/resources/coach/custom/js/dashboard.js"></script>


<%@ include file="../layout/footer.jsp"%>
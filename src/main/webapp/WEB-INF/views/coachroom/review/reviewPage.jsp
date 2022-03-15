<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/coach/custom/js/review.js" type="text/javascript"></script>	
<link href="/resources/coach/custom/css/carousel.css" rel="stylesheet" />

<%@ include file="../../layout/header.jsp"%>   
      
<div class="container marketing">

  <!-- 해당 수업 간략하게 표시 -->
  <div class="row-cols-auto">
    <div class="col-lg-12">
      <div class="card shadow-sm">
        <img src="/resources/coach/img/${classContent.img}" style="margin: 0 auto;" width="40%" height="40%">
	  </div>
      <h2 style="text-align: center;">${classContent.title}</h2>
	  <p style="text-align: center;">${classContent.intro}</p>
	</div><!-- /.col-lg-4 -->
  </div><!-- /.row -->
		
  <!-- 리뷰 시작 -->
  <c:if test="${count == 0}">
  	  <hr class="featurette-divider">
		
	  <div class="row featurette">
	    <div class="col-md-12">
	      <h2 class="featurette-heading" style="text-align: center;">아직 작성된 리뷰가 없습니다.</h2>
	    </div>
	  </div>
  </c:if>
  
  <c:if test="${count > 0}">
    <c:forEach var="reviewList" items="${review}">	
	  <hr class="featurette-divider">
			
	  <div class="row featurette">
	    <div class="col-md-12">
	    
	      <table class="table table-bordered">
  		    <thead>
		      <tr>
		        <th scope="col" style="width: 100px;"></th>
		        <th scope="col" style="width: 30%;">닉네임</th>
		        <th scope="col">평점</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
		        <th scope="row"></th>
		        <td>${reviewList.nick}</td>
		        <td>${reviewList.grade}</td>
		      </tr>
		      <tr>
		        <th scope="row"> 후기 </th>
		        <td colspan="2">${reviewList.content}</td>
		      </tr>
  		    </tbody>
		  </table>
		  
	    </div>
	  </div>
	</c:forEach>
  </c:if>
  
  <c:if test="${pageCount > 1}">
  	<c:if test="${startPage > 10}">
		<a href="/coachroom/reviewContent?pageNum=${startPage - 10}&num=${classContent.num}">[이전]</a>	
	</c:if>
	
	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
		<a href="/coachroom/reviewContent?pageNum=${i}&num=${classContent.num}">[${i}]</a>
	</c:forEach>
	
	<c:if test="${endPage < pageCount}">
		<a href="/coachroom/reviewContent?pageNum=${startPage + 10}&num=${classContent.num}">[다음]</a>
	</c:if>
  </c:if>
  	     
</div>

    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
    <script src="/resources/coach/custom/js/dashboard.js"></script>


<%@ include file="../../layout/footer.jsp"%>
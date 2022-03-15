<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>
	<title>관리자 리뷰 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/manager/review.js" type="text/javascript" ></script>

	<link href="../../resources/css/manager/notice.css" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
</head>
<body>
	<!-- 리뷰 리스트 -->
	<div class="container">
    	<div class="row">
	        <div class="col-xl-12">
	            <div class="card">
	                <div class="card-body">
	                    <h5 class="header-title pb-3 mt-0">관리자 리뷰 관리 페이지</h5>
	                    <div class="table-responsive">
	                    	<input type="button" class="btn btn-default" id="review_button" onclick="window.location='/ddarawazoom/zoom'" value="[Zoom강의 페이지 이동]">
	                    	<input type="button" class="btn btn-default" id="review_button" onclick="window.location='/ddarawazoom/vod'" value="[Vod강의 페이지 이동]">
	                    	
                    	<c:if test="${reviewCount == 0}">
                    	<table class="table table-hover mb-0" id="boardtable">
                  				<tr>
                   				<td>
                   					<h5>작성된 리뷰가 없습니다.</h5>
                   				</td>
                  				</tr>
                  			</table>
                   		</c:if>
                    	<c:if test="${reviewCount != 0}">
	                    	<table class="table table-hover mb-0" id="boardtable">
	                    		<thead>
	                    			<tr class="align-self-center">
	                    				<th>평 점</th>
		                    			<th>강의 명</th>
		                    			<th>후 기</th>
		                    			<th>아이디</th>
		                    			<th>버 튼</th>
	                    			</tr>
	                    		</thead>
	                    		<tbody>
	                    			<c:forEach var="reviewList" items="${reviewList}">
		                    			<tr>
		                    				<td>
		                    					<c:if test="${reviewList.grade == 10 }">
		                    						<i class="far fa-thumbs-up" style="font-size:18px; color:hotpink;">10</i>
		                    					</c:if>
		                    					<c:if test="${reviewList.grade != 10 }">
		                    						${reviewList.grade}
		                    					</c:if>
		                    				</td>
			                    			<td>
			                    				<a href="/ddarawazoom/zclasscontent?num=${reviewList.class_num}&pageNum=${pageNum}">
			                    					${reviewList.title}
				                    			</a>
			                    			</td>
			                    			<td>
			                    				<c:if test="${reviewList.deleted ne 'yes'}">
				                    				<a href="/ddarawazoom/zclasscontent?num=${reviewList.class_num}&pageNum=${pageNum}">
				                    					${reviewList.content}
				                    				</a>
				                    			</c:if>
				                    			<c:if test="${reviewList.deleted eq 'yes' and reviewList.deleted ne 'no'}">
				                    				<a href="/ddarawazoom/zclasscontent?num=${reviewList.class_num}&pageNum=${pageNum}">
					                    				<font style="color: red;">
					                    					<i class="fas fa-dizzy"></i>경고받은 리뷰
					                    				</font>
				                    				</a>
				                    			</c:if>
			                    			</td>
			                    			<td>${reviewList.id}</td>
			                    			<td>
			                    				<c:if test="${reviewList.deleted eq 'yes' and reviewList.deleted ne 'no'}">
			                    					<input type="button" class="btn btn-outline-black" onclick="managerChangeCancell(${reviewList.review_num});" style="color:black;" value="경고 취소"/>
			                    				</c:if>
			                    				<c:if test="${reviewList.deleted ne 'yes'}">
			                    		            <input type="button" class="btn btn-outline-black" onclick="managerReviewChange(${reviewList.review_num});" style="color:red;" value="경고 하기"/>
			                    				</c:if>
				                               		<input type="button" class="btn btn-outline-black" onclick="managerReviewDelete(${reviewList.review_num})" value="삭제"/>
			                    			</td>
		                    			</tr>
		                    		</c:forEach>
	                    		</tbody>
	                   		</table>
                   		</c:if>
                   	</div>
                 </div>
                  <div id="page">
					<c:if test="${reviewPageCount > 0}">
						페이지&nbsp;
						<c:if test="${startPage > 10}">
							<a href="/manager/review?pageNum=${startPage - 10}"> [이전] </a>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<a href="/manager/review?pageNum=${i}">${i}</a>
						</c:forEach>
						<c:if test="${endPage < reviewPageCount}">
							<a href="/manager/review?pageNum=${startPage + 10}"> [다음] </a>
						</c:if>
					</c:if>	
				</div>
              </div>
           </div>
       </div>
	</div>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>
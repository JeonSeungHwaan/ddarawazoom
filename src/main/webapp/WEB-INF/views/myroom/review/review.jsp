<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>   
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
<html>
<head>
	<title>멤버 Review 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/myroom/review.js" type="text/javascript"></script>

	<link href="../../resources/css/myroom/myRoom.css" rel="stylesheet" >
</head>
<body>
	<div class="review_title">
		<h3>소중한 리뷰 관리 공간</h3>
	</div>
	<c:if test="${count == 0}">
		<table class="table" id="review_list">
			<tr>
				<th>
					<h3 style="text-align:center">
						아직 작성된 리뷰가 없습니다.
					</h3>
				</th>
			</tr>
		</table>
	</c:if>
	<c:if test="${count != 0}">
		<table class="table" id="review_list">
			<thead>
				<tr>
					<th>강의명</th>
					<th>작성 내용</th>
					<th>평 점</th>
					<th>버 튼</th>
				</tr>
			</thead>
			<c:forEach var="reviewList" items="${reviewList}" >
				<tbody>
					<tr>
						<td>
							<a href="/ddarawazoom/zclasscontent?num=${reviewList.class_num}">${reviewList.title}</a>
						</td>
						<td>
							${reviewList.content}
						</td>
						<td>
							${reviewList.grade}
						</td>
						<td>
							<input type="button"  value="리뷰 수정"  class="btn btn-outline-primary"
								onclick="window.location='/myroom/reviewUpdate?review_num=${reviewList.review_num}'"/>
							&nbsp;&nbsp;
							<input type="button" value="리뷰 삭제" class="btn btn-outline-danger"
								onclick="delete_review(${reviewList.review_num});" />
						</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>
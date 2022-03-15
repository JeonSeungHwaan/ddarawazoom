<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<html>
<head>
	<title>공지사항 댓글 수정</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/manager/notice.js" type="text/javascript" ></script>
	
	<link href="../../resources/css/styles.css" rel="stylesheet">
	<link href="../../resources/css/manager/notice.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<form class="needs-validation" role="form" novalidate id="comment_UpdateForm" name="comment_update" action="/ddarawazoom/noticeContent" method="post">
			<input type="hidden" name="c_num" value="${notice_CDTO.c_num}" />
			<c:if test="${sessionScope.id != null && userInfo != null}">
			   <input type="hidden" name="writer_id" value="${userInfo.nick}" />
			</c:if>
			<c:if test="${sessionScope.c_id != null && coachInfo != null}">
			   <input type="hidden" name="writer_id" value="${coachInfo.c_nick}" />
			</c:if>
			<p class="text-center" style="font-weight: bold; font-size:20px; margin:10px;">
				* 댓글 수정 *
			</p>
			<div class="col-lg-4"> 
				작 성 자 : ${notice_CDTO.writer_id}
			</div>
			<div class="col-lg-4"> 
				작성 내용 :
				<textarea name="content" placeholder="댓글을 기입해 주세요." class="form-control">${notice_CDTO.content}</textarea>
			</div>
			<hr class="my-4">
			<div class="text-center">
				<input type="button" onclick="commentUpdatePro();"class="btn btn-outline-black" value="댓글 수정"/> 
			</div>
		</form>
	</div>
</body>
</html>
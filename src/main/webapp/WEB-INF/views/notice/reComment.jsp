<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>
	<title>대댓글 작성</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/manager/notice.js" type="text/javascript" ></script>
	
	<link href="../../resources/css/styles.css" rel="stylesheet">
	<link href="../../resources/css/manager/notice.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<form class="needs-validation" role="form" novalidate id="recomment_Form" name="recomment" method="post">
			<input type="hidden" id="num" name="num" value="${notice_CDTO.num}" />
			<input type="hidden" id="c_num" name="c_num" value="${notice_CDTO.c_num}" />
			<input type="hidden" id="ref" name="ref" value="${notice_CDTO.ref}"/>
			<input type="hidden" id="re_step" name="re_step" value="${notice_CDTO.re_step}"/>
			<input type="hidden" id="re_level" name="re_level" value="${notice_CDTO.re_level}"/>
			
			<c:if test="${sessionScope.admin != null}">
				<c:set var="writer_id" value="${sessionScope.admin}"></c:set>
				<input type="hidden" id="writer_id" name="writer_id" value="${sessionScope.admin}"/>
			</c:if>
			
			<p class="text-center" style="font-weight: bold; font-size:20px; margin:10px;">
					* 대 댓글 작성 *
			</p>
			<div class="col-lg-4"> 
				작 성 자 : ${sessionScope.admin}
			</div>
			<div class="col-lg-4"> 
				작성 내용 :
				<textarea id="content" name="content" class="form-control" placeholder="댓글을 기입해 주세요."></textarea>
			</div>
			<hr class="my-4">
			<div class="text-center">
				<input type="button" onclick="reCommentPro();" class="btn btn-outline-black" value="대댓글 작성"/> 
			</div>
		</form>
	</div>
</body>
</html>
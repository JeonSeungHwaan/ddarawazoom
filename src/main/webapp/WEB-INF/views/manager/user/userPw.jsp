<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>멤버 Delete 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/manager/user.js" type="text/javascript" ></script>
	
	<link href="../../resources/css/styles.css" rel="stylesheet">
	<link href="../../resources/css/myroom/myRoom.css" rel="stylesheet">
</head>
<body>
	<form class="needs-validation" novalidate id="userPw" name="user_pw" onsubmit="updateUserPw();" method="post" >
		<div class="mb-4">
			<input type="hidden" name="id" value="${userInfo.id}"/>
			<label for="pw" class="form-label">
				* 패스워드 수정 *
			</label>
			<p class="deleteSubTitle">
				멤버님의 요청으로 패스워드를 수정합니다.
			</p>
			<input class="form-control" type="text" id="pw" name="pw" value="${userInfo.pw}"/>
			
			<hr class="my-4">
			
			<div class="userDeleteButton">
				<input type="submit" class="btn btn-outline-black" value="수정하기" />
			</div>
		</div>
	</form>
	
</body>
</html>
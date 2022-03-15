<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
	<title>멤버 Delete 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/myroom/user.js" type="text/javascript"></script>
	
	<link href="../../resources/css/styles.css" rel="stylesheet">
	<link href="../../resources/css/myroom/myRoom.css" rel="stylesheet">
</head>
<body>
	<form class="needs-validation" novalidate id="userDelete" name="user_delete" method="post" >
		<div class="mb-4">
			<label for="pw" class="form-label" id="deleteTitle">
				* 패스워드 확인 *
			</label>
			<p class="deleteSubTitle">
				패스워드 확인이 필요합니다. 아래 칸에 패스워드를 입력해주세요.
			</p>
			<input class="form-control" type="text" id="pw" name="pw" autofocus="autofocus"/>
			
			<hr class="my-4">
			
			<div class="userDeleteButton">
				<input type="button" class="btn btn-outline-black" onclick="userDeletePro();" value="탈퇴하기" />
			</div>
		</div>
	</form>
	<script src="../../resources/js/form-validation.js"></script>
</body>
</html>
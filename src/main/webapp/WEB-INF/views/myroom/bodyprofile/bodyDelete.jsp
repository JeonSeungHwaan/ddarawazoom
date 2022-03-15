<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<html>
<head>
	<title>bodyDelete 페이지</title>
	<link href="../../resources/css/styles.css" rel="stylesheet">
	<link href="../../resources/css/myroom/myRoom.css" rel="stylesheet">
</head>

<body>
	<form action="/myroom/bodyprofile/bodyDeletePro" method="post">
		<input type="hidden" name="b_num" value="${b_num}">
		<div class="mb-4">
	 		<label for="formFile" class="form-label" id="imgTitle">
	 			* 바디 프로필 삭제 *
	 		</label>
	 		<p class="imgSubTitle">
	 			바디프로필을 삭제하게 되시면, 복구가 어렵습니다ㅠ_ㅠ<br/>
	 			본 바디프로필을 정말로 삭제 하시겠습니까?
	 		</p>
	 		
	     	<hr class="my-4">
	     	
	     	<div class="imgUpdateButton">
				<input type="submit" id="deleteButton" class="btn btn-outline-black" value="삭제하기" />
	     	</div>
		</div>
	</form>
</body>
</html>
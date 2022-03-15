<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<title>imgUpdate 페이지</title>
	
	<script src='{% static "js/jquery-1.11.3.min.js" %}'></script>
 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="../../resources/js/myroom/user.js" type="text/javascript"></script>
	
	<link href="../../resources/css/styles.css" rel="stylesheet">
	<link href="../../resources/css/myroom/myRoom.css" rel="stylesheet">
</head>
<body>
	<form class="needs-validation" novalidate id="updateForm" method="post" onsubmit="return imgUpdatePro();" enctype="multipart/form-data">
          <div class="mb-4">
	 		<label for="formFile" class="form-label" id="imgTitle">
	 			* 프로필 사진 변경 *
	 		</label>
	 		<p class="imgSubTitle">
	 			기존의 프로필 사진 변경을 원하신다면 이미지 파일을 첨부해주세요.
	 		</p>
            <img class="img-account-profile rounded-circle mb-2" src="../../resources/image/upload/${userInfo.img}" alt="img">
		 	<input class="form-control" type="file" id="formFile" required>
			<div class="invalid-feedback">
     			사진을 첨부하지 않았습니다.<br/>
     			수정을 원하신다면, 사진을 첨부해 주세요.<br/><br/>
     			
     			 사진 수정을 원하지 않으시다면,<br/>아래 '창 닫기'를 클릭해 주세요.<br/>
     			<input type="button" class="btn btn-outline-black" onclick="window.close()" value="창 닫기"/>
     		</div>
    		
	     	<hr class="my-4">
		     	
	     	<div class="imgUpdateButton">
	     		<input type="submit" id="updateButton" class="btn btn-outline-black" value="사진 업로드"/>
	     	</div>
		</div>
	</form>
	<script src="../../resources/js/myroom/form-validation.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="../../resources/image/Exercise.svg" rel="shortcut icon" type="image/x-icon">
<link href="../../resources/css/styles.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<script src="/resources/coach/custom/js/coach-info.js" type="text/javascript"></script>

<form class="needs-validation" novalidate id="updateForm" action="/coachroom/info" method="post" onsubmit="imgUpdatePro();" enctype="multipart/form-data">
	<div class="mb-3">
		 <label for="formFile" class="form-label">프로필 사진 변경</label>
		 <input class="form-control" type="file" id="formFile" required>
		 <div class="invalid-feedback">
	     	사진을 선택해주세요.
	     </div>
	     
	     <hr class="my-4">
	     
	     <button class="btn btn-primary" type="submit">
	     	업로드
	     </button>
	</div>
</form>
<script src="/resources/coach/custom/js/form-validation.js"></script>
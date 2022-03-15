<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<html>
<head>
	<title>BodyProfile 수정 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/myroom/bodyprofile.js" type="text/javascript"></script>
	
	<link href="../../resources/css/myroom/myRoom.css" rel="stylesheet">
</head>
<body>
	<div class="container">
	  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	    <div class="row g-5">
	      <div class="col-md-7 col-lg-8">
			<h4 class="bodyprofile_title">${bodyProfileDTO.b_id} 님의 바디 프로필 수정</h4>
				 <form action="/myroom/bodyprofile/bodyUpdatePro" id="body_update" name="body_update" method="post" enctype="multipart/form-data">
					<input type="hidden" name="b_num" value="${bodyProfileDTO.b_num}" />
						<div class="row g-3">
							<div class="col-12">
								<label for="b_date" class="form-label">작성 날짜</label>
								<fmt:formatDate var="body_Date" pattern="yyyy-MM-dd" value="${bodyProfileDTO.b_date}" />
								<input  class="form-control" type="date" id="b_date" name="b_date" value="${body_Date}" />
							</div>
							<div class="col-6">
								<label for="b_height" class="form-label">키</label>
								<input type="text" class="form-control"  id="b_height" name="b_height" value="${bodyProfileDTO.b_height}" /> cm
							</div>
							<div class="col-6">
								<label for="b_weight" class="form-label">몸무게</label>
								<input type="text" class="form-control"  id="b_weight" name="b_weight" value="${bodyProfileDTO.b_weight}"  /> cm
							</div>
							<div class="col-6">
								<label for="b_muscle" class="form-label">근육 량</label>
								<input type="text" class="form-control"  id="b_muscle" name="b_muscle" value="${bodyProfileDTO.b_muscle}" /> kg
							</div>
							<div class="col-6">
								<label for="b_bodyfat" class="form-label">체지방 량</label>
								<input type="text" class="form-control"  id="b_bodyfat" name="b_bodyfat" value="${bodyProfileDTO.b_bodyfat}" /> kg
							</div>
							<div class="col-6">
								<label for="b_shape" class="form-label">체 형</label>
								<select class="form-select" id="b_shape" name="b_shape"  aria-label="Default select example">
									<option value="${bodyProfileDTO.b_shape}">${bodyProfileDTO.b_shape}</option>
									<option value="마른비만형">마른비만형</option>
									<option value="하체비만형">하체비만형</option>
									<option value="복부비만형">복부비만형</option>
									<option value="상체비만형">상체비만형</option>
									<option value="전체비만형">전체비만형</option>
									<option value="정상">정상</option>
								</select>
							</div>
							<div class="col-6">
								<label for="b_chest" class="form-label">가슴 둘레</label>
								<input type="text" class="form-control" id="b_chest" name="b_chest" value="${bodyProfileDTO.b_chest}" /> cm
							</div>
							<div class="col-6">
								<label for="b_waist" class="form-label">허리 둘레</label>
								<input type="text" class="form-control" id="b_waist" name="b_waist" value="${bodyProfileDTO.b_waist}" /> cm
							</div>
							<div class="col-6">
								<label for="b_arm" class="form-label">팔뚝 둘레</label>
								<input type="text" class="form-control" id="b_arm" name="b_arm" value="${bodyProfileDTO.b_arm}" /> cm
							</div>
							<div class="col-6">
								<label for="b_thigh" class="form-label">허벅지 둘레</label>
								<input type="text" class="form-control" id="b_thigh" name="b_thigh" value="${bodyProfileDTO.b_thigh}" /> cm
							</div>
							<div class="col-6">
								<label for="b_hip" class="form-label">엉덩이 둘레</label>
								<input type="text" class="form-control" id="b_hip" name="b_hip" value="${bodyProfileDTO.b_hip}" /> cm
							</div>
							<div class="col-12">
								<label for="b_img" class="form-label">바디 사진</label><br/>
								<img id="imge_section" src="/resources/image/upload/${bodyProfileDTO.b_img}" width="70px" height="70px"/>
								<input type="file"  class="form-control" id="save" name="save" multiple="multiple" class="form-control form-control-sm"  />
							</div>
						</div>
						
						<hr class="my-4">
							
						<div style="text-align: center;">
							<input type="button" onclick="return body_Update();" class="btn btn-outline-black" value="수정하기" />
								&nbsp;
							<input type="reset" class="btn btn-outline-black" value="다시작성하기" />
								&nbsp;
							<input type="button" class="btn btn-outline-black" value="바디프로필이동" onClick="javascript:window.location='/myroom/bodyprofile'" />
						</div>
					</form>
				</div>
			</div>
		</main>
	</div>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>
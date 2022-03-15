<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
<html>
<head>
	<title>BodyProfile 작성 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/myroom/bodyprofile.js" type="text/javascript"></script>
	
	<link href="../../resources/css/myroom/myRoom.css" rel="stylesheet" />
</head>
<body>
	<!-- 최근 바디 프로필 출력 -->
	<table class="table" style="height: 130px ; vertical-align: middle;">
		<thead>
			<tr class="table-light">
				<th scope="col">
					바디 사진
				</th>
				<th scope="col">
					측정 날짜
				</th>
				<th scope="col">
					키
				</th>
				<th scope="col">
					몸무게
				</th>
				<th scope="col">
					근육량
				</th>
				<th scope="col">
					체지방량
				</th>
				<th scope="col">
					체 형
				</th>
				<th scope="col">
					가슴 둘레
				</th>
				<th scope="col">
					허리 둘레
				</th>
				<th scope="col">
					팔뚝 둘레
				</th>
				<th scope="col">
					허벅지 둘레
				</th>
				<th scope="col">
					엉덩이 둘레
				</th>
			</tr>
		</thead>
		<tbody id="number${number}">
			<c:forEach var="bodyProfileDTO" items="${bodyProfileDTO}" >	
				<tr>
					<td>
						<img src="../../resources/image/upload/${bodyProfileDTO.b_img}" name="b_img" width="150px" height="150px"/>
					</td>
					<td>
						<fmt:formatDate value="${bodyProfileDTO.b_date}" type="date" dateStyle="medium"/>
					</td>
					<td>
						${bodyProfileDTO.b_height} cm
					</td>
					<td>
						${bodyProfileDTO.b_weight} kg
					</td>
					<td>
						${bodyProfileDTO.b_muscle} kg
					</td>
					<td>
						${bodyProfileDTO.b_bodyfat} kg
					</td>
					<td>
						${bodyProfileDTO.b_shape}
					</td>
					<td>
						${bodyProfileDTO.b_chest} cm
					</td>
					<td>
						${bodyProfileDTO.b_waist} cm
					</td>
					<td>
						${bodyProfileDTO.b_arm} cm
					</td>
					<td>
						${bodyProfileDTO.b_thigh} cm
					</td>
					<td>
						${bodyProfileDTO.b_hip} cm
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="container">
	  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	    <div class="row g-5">
	      <div class="col-md-7 col-lg-8">
			<h4 class="bodyprofile_title">${sessionScope.id} 님의 바디프로필 작성 페이지</h4>
				<form class="needs-validation" method="post" id="body_write"  name="body_write" action="/myroom/bodyprofile/bodyWritePro"  enctype="multipart/form-data">
					<div class="row g-3">
						<div class="col-12">
							<label for="b_id" class="form-label">* 아이디</label><br/>
							<input type="hidden" name="b_id" value="${sessionScope.id}" />
								${sessionScope.id} 님
						</div>	
						<div class="col-12">
							<label for="b_date" class="form-label">* 작성 날짜</label>
							<input type="date" class="form-control" id="b_date" name="b_date"/>
						</div>
						<div class="col-6">
							<label for="b_height" class="form-label">* 키</label>
							<input type="text" class="form-control" id="b_height" name="b_height" /> cm
						</div>	
						<div class="col-6">
							<label for="b_weight" class="form-label">* 몸무게</label>
							<input type="text" class="form-control" id="b_weight" name="b_weight" /> kg
						</div>
						<div class="col-6">
							<label for="b_muscle" class="form-label">근육량</label>
							<input type="text" class="form-control" id="b_muscle" name="b_muscle" /> kg
						</div>
						<div class="col-6">
							<label for="b_bodyfat" class="form-label">체지방량</label>
							<input type="text" class="form-control" id="b_bodyfat" name="b_bodyfat" class="form-control"/> kg
						</div>
						<div class="col-6">
							<label for="b_shape" class="form-label">체 형</label>
							<select class="form-select" id="b_shape" name="b_shape">
								<option value="">체형 선택</option>
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
							<input type="text" class="form-control" id="b_chest" name="b_chest" /> cm
						</div>
						<div class="col-6">
							<label for="b_waist" class="form-label">허리 둘레</label>
							<input type="text" class="form-control" id="b_waist" name="b_waist" /> cm
						</div>
						<div class="col-6">
							<label for="b_arm" class="form-label">팔뚝 둘레</label>
							<input type="text" class="form-control" id="b_arm" name="b_arm" /> cm
						</div>
						<div class="col-6">
							<label for="b_thigh" class="form-label">허벅지 둘레</label>
							<input type="text" class="form-control" id="b_thigh" name="b_thigh" /> cm
						</div>
						<div class="col-6">
							<label for="b_hip" class="form-label">엉덩이 둘레</label>
							<input type="text" class="form-control" id="b_hip" name="b_hip" /> cm
						</div>
						<div class="col-12">
							<label for="save" class="form-label">바디 사진</label><br/>
							<input type="file" class="form-control" id="save" name="save"  multiple="multiple" class="form-control form-control-sm" />
						</div>
					</div>
					
				 	<hr class="my-4">
				
					<div style="text-align: center;">
						<input type="button" onclick="return body_Write();"  class="btn btn-outline-black" value="입력하기" />
							&nbsp;
						<input type="reset" class="btn btn-outline-black"  value="다시작성하기" />
							&nbsp;
						<input type="button" class="btn btn-outline-black"  value="이전 페이지로 이동" onClick="javascript:window.location='/myroom/bodyprofile'" />
					</div>
				</form>
			 </div>
	   	 </div>
	  </main>
	</div> 
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>
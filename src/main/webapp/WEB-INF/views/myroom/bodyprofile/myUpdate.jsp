<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title>MyProfile 수정 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/myroom/bodyprofile.js" type="text/javascript"></script>
	
	<link href="../../resources/css/myroom/myRoom.css" rel="stylesheet" >
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
		    <div class="col-12 col-lg-10 col-xl-8 mx-auto">
		        <h2 class="h3 mb-4 page-title"></h2>
		        <div class="my-4">
		            <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
		                <li class="nav-item">
		                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="false">
		                    	${userInfo.nick} 님의 마이 프로필 수정 페이지
		                    </a>
		                </li>
		            </ul>
					<form class="needs-validation" method="post" id="myroom_form" name="myroom_form" action="/myroom/bodyprofile/myUpdatePro" enctype="multipart/form-data">
		                <div class="row mt-5 align-items-center">
		                    <div class="col-md-3 text-center mb-5">
		                        <div class="avatar avatar-xl">
		                            <img src="../../resources/image/upload/${userInfo.img}" alt="img" class="avatar-img rounded-circle" />
		                        </div>
		                    </div>
		                    <div class="col">
		                        <div class="row align-items-center">
		                            <div class="col-md-7">
		                                <h4 class="mb-1">${userInfo.nick} 님</h4>
		                                <p class="text-muted">
			                                 ${userInfo.nick} 님의 소중한 정보를 수정 할 수 있는<br/>마이 프로필 페이지 입니다.
			                             </p>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <hr class="my-4" />
		                <div class="form-row">
	                   		<div class="form-group">
		                        <label for="nick">* 닉 네 임 : </label><br/>
		                        	${userInfo.nick}<br/>
		                    </div>
		                </div>
		                <div class="form-group">
		                    <label for="inputEmail4">*  이 름 :</label>
		                    <input type="text" class="form-control" id="inputEmail4" id="name" name="name" value="${userInfo.name}" /><br/>
		                </div>
		                <div class="form-group">
		                    <label for="inputEmail4">*  이 메 일 :</label>
		                    <input type="email" class="form-control" id="inputEmail4" id="email" name="email" value="${userInfo.email}" /><br/>
		                </div>
		                <div class="form-group">
		                    <label for="birth">* 생 년 월 일 :</label>
		                    <fmt:formatDate var="birth" pattern="yyyy-MM-dd" value="${userInfo.birth}" />
								<input class="form-control" type="date" id="birth" name="birth" value="${birth}" /><br/>
		                </div>
		                <div class="form-row">
		                    <div class="form-group">
		                        <label for="inputCompany5">* 연 락 처 :</label>
		                        <input type="text" class="form-control" id="inputCompany5" id="tel" name="tel" value="${userInfo.tel}" placeholder="'-'를 포함하여 입력해 주세요." /><br/>
		                    </div>
		                    <div class="form-group">
		                        <label for="inputState5">* 성 별 :</label> ${userInfo.gender}
		                        <select id="inputState5" class="form-control" id="gender" name="gender">
									<option value="">${userInfo.gender}</option>
									<option value="남성">남성</option>
									<option value="여성">여성</option>
								</select><br/>
		                    </div>
		                    <div class="form-group">
		                    
		                        <label for="inputZip5">* 프로필 사진</label><br/>
		                        <img class="img-account-profile rounded-circle mb-2" src="../../resources/image/upload/${userInfo.img}" alt="img">
		                        <input type="file" class="form-control"  id="save" name="save" /><br/>	
		                    </div>
		                </div>
		                <hr class="my-4" >
		                <div class="text-center">
			                <input type="button" onclick="return myroom_update();" class="btn btn-outline-black" value="수정하기" />
			                	&nbsp;
							<input type="reset" class="btn btn-outline-black" value="다시작성하기" />
								&nbsp;
							<input type="button" class="btn btn-outline-black" value="마이룸이동" onClick="javascript:window.location='/myroom'" />
						</div>
		            </form>
		        </div>
		    </div>
		</div>
	</div>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>
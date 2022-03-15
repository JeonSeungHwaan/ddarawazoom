<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<title>멤버 정보 수정 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/myroom/user.js?ver=12" type="text/javascript"></script>
	
	<link href="../../resources/css/myroom/myRoom.css" rel="stylesheet">
	<link href="/resources/coach/custom/css/form-validation.css" rel="stylesheet">
	<link href="/resources/user/custom/css/user.css" rel="stylesheet">
</head>
<body>
	<div class="container-xl px-4 mt-4">
	    <div class="row">
	        <div class="col-xl-4">
	            <!-- Profile picture card-->
	            <div class="card mb-4 mb-xl-0">
	                <div class="card-header">Profile Picture</div>
	                <div class="card-body text-center">
	                    <img class="img-account-profile rounded-circle mb-2" src="../../resources/image/upload/${userInfo.img}" alt="img">
	                    <div class="small font-italic text-muted mb-4">${userInfo.nick}님의 프로필 사진</div>
	                    <input type="button" class="btn btn-outline-black" value="프로필사진 변경" onclick="imgUpdateForm();">
	                </div>
	            </div>
	        </div>
	        <div class="col-xl-8">
	            <div class="card mb-4">
	                <div class="card-header">User Info</div>
	                <div class="card-body">
	                    <form class="needs-validation" novalidate id="updateForm" name="userinfo_update" action="/myroom/userInfo" method="post" onsubmit="infoUpdate_submit(); return false;">
	                        <div class="row gx-3 mb-3">
	                            <div class="col-md-6">
	                                <label class="small mb-1" for="id">* 아 이 디</label><br/>
	                                	${userInfo.id} 님
	                            </div>
															
	                            <div class="col-md-3">
	                                <label class="small mb-1" for="nick">* 닉 네 임</label>
	                                <input class="form-control" id="nick" type="text" name="nick" placeholder="닉네임을 기입해 주세요." value="${userInfo.nick}"/>

	                            </div>
	                           <div class="col-md-3" style="float: right;">
								    <input type="button" style="margin-top: 25px;"
								    	class="btn btn-primary mb-3 form-control" id="nickCheck" onclick="nicknameCheck('${userInfo.nick}');" value="중복확인"/>
							   </div>
							   <div class="col-md-6" style="float: right;">	
							   </div>
							   <div class="col-md-6" style="float: right;">
								    <label id="nickResult" class="font" style="margin-top: 0px;"></label>	
							   </div>
	                        </div>
	                        <div class="row gx-3 mb-3">
	                            <div class="col-md-6">
	                                <label class="small mb-1" for="name">* 이 름</label>
	                                <input class="form-control" id="name" type="text" name="name" placeholder="이름을 기입해 주세요." value="${userInfo.name}"/>
	                            </div>
	                            <div class="col-md-6">
	                                <label class="small mb-1" for="pw">* 패 스 워 드</label>
	                                <input class="form-control" id="pw" type="text" name="pw" placeholder="패스워드를 기입해 주세요." value="${userInfo.pw}"/>
	                            </div>
	                        </div>
	                        <div class="row gx-3 mb-3">
	                            <div class="col-md-6">
	                                <label class="small mb-1" for="email">* 이 메 일</label>
	                                <input class="form-control" id="email" type="email" name="email" placeholder="이메일을 기입해 주세요." value="${userInfo.email}"/>
	                            </div>
	                            <div class="col-md-6">
	                                <label class="small mb-1" for="gender">* 성 별</label>
	                                <select class="form-select" id="gender" name="gender">
										<option value="${userInfo.gender}">${userInfo.gender}</option>
										<option value="남성">남성</option>
										<option value="여성">여성</option>
									</select>
	                            </div>
	                        </div>
	                        <div class="row gx-3 mb-3">
	                            <div class="col-md-6">
	                                <label class="small mb-1" for="tel">* 연 락 처</label>
	                                <input class="form-control" id="tel" type="tel" name="tel" placeholder="'-'를 포함하여 입력해 주세요." value="${userInfo.tel}" />
	                            </div>
	                            <div class="col-md-6">
	                                <label class="small mb-1" for="birth">* 생 년 월 일</label>
	                                <fmt:formatDate var="birth" pattern="yyyy-MM-dd" value="${userInfo.birth}" />
	                                <input class="form-control" type="date"  id="birth" name="birth" value="${birth}"/>
	                            </div>
	                        </div>
	                        	<hr class="my-4">
	                        <div class="update_button">
	                        	<button class="btn btn-outline-black" type="submit">정보 수정하기</button>&nbsp;&nbsp;
								<input type="reset" value="다시 작성" class="btn btn-outline-black" />&nbsp;&nbsp;
		         				<input type="button" value="탈퇴 하러가기" id="deleteButton" class="btn btn-outline-black"
		          					onclick="userDelete()" />&nbsp;&nbsp;
		          				<input type="button" value="이전으로" class="btn btn-outline-black"
		          					onclick="window.location='/myroom/userInfo'" />
	          				</div>	
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>
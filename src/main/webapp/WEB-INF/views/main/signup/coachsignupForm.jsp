<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/user/custom/js/coachSignUp.js?ver=123" type="text/javascript"></script>

<link href="/resources/coach/custom/css/form-validation.css" rel="stylesheet">
<link href="/resources/user/custom/css/user.css" rel="stylesheet">

<div class="container-fluid">
    
    <div class="container">
	  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	    <div class="row g-5">
	      <div class="col-md-7 col-lg-8">
	        <h2 style="text-align: center; margin-bottom: 40px;"> ddarawazoom 코치지원 </h2>
	        <h4 class="mb-3">기본정보 입력</h4>
	        <form class="needs-validation" novalidate action="/ddarawazoom/coachsignupPro" method="post" enctype="multipart/form-data" onsubmit="submit_check">
	          <div class="row g-3">
	            <div class="col-8">
	              <label for="c_id" class="form-label">* 아이디</label>
	              <input type="text" class="form-control" id="c_id" name="c_id" placeholder="아이디를 입력해주세요." required>
	              <div class="invalid-feedback">
	                아이디는 필수항목입니다.
	              </div>
	            </div>
				<div class="col-4" style="float: right;">
				    <input style="margin-top: 31px;" type="button"
				    	class="btn btn-primary mb-3 form-control" id="idCheck" value="중복확인"/>
				</div>
				<label id=result class="font" style="margin-top: 0px;"></label>
				
	            <div class="col-12">
	              <label for="c_pw" class="form-label">* 비밀번호</label>
	              <div class="input-group has-validation">
	                <input type="password" class="form-control" id="c_pw" name="c_pw" placeholder="비밀번호를 입력해주세요." required>
	              <div class="invalid-feedback">
	                  비밀번호는 필수항목입니다.
	                </div>
	              </div>
	            </div>
	
				<div class="col-12">
	              <label for="c_re-pw" class="form-label">* 비밀번호 확인</label>
	              <div class="input-group has-validation">
	                <input type="password" class="form-control" id="c_re-pw" name="c_re-pw" placeholder="비밀번호를 확인해주세요." required>
	              	<div class="invalid-feedback">
	                  비밀번호를 확인해주세요.
	                </div>
	              </div>
	            </div>
				<label id=pwCheck class="font"></label>
				
				<div class="col-12">
	              <label for="c_name" class="form-label">* 이름</label>
	              <input type="text" class="form-control" id="c_name" name="c_name" placeholder="이름을 입력해주세요" required>
	              <div class="invalid-feedback">
	                이름은 필수항목입니다.
	              </div>
	            </div>
				
				<div class="col-8">
	              <label for="c_nick" class="form-label">* 닉네임</label>
	              <input type="text" class="form-control" id="c_nick" name="c_nick" placeholder="닉네임을 입력해주세요" required>
	              <div class="invalid-feedback">
	                닉네임은 필수항목입니다.
	              </div>
	            </div>
				<div class="col-4" style="float: right;">
				    <input style="margin-top: 31px;" type="button"
				    	class="btn btn-primary mb-3 form-control" id="nickCheck" value="중복확인"/>
				</div>
				<label id="nickResult" class="font" style="margin-top: 0px;"></label>
				
	            <div class="col-12">
	              <label for="email" class="form-label">* 이메일</label>
	              <input type="email" class="form-control" id="c_email" name="c_email" placeholder="exapmle@email.com" required>
	              <div class="invalid-feedback">
	                이메일은 필수항목입니다.
	              </div>
	            </div>
	            
	            <div class="col-12">
	              <label for="c_birth" class="form-label">* 생년월일</label>
	              <input type="date" class="form-control" id="c_birth" name="c_birth" required>
	              <div class="invalid-feedback">
	                생년월일은 필수항목입니다.
	              </div>
	            </div>
	            
	            <div class="col-12">
	              <label for="c_birth" class="form-label">* 성별</label>
	              <div class="form-check form-check-inline">
					 <input class="form-check-input" type="radio" name="c_gender" id="male" value="남성" required>
					 <label class="form-check-label" for="male">남성</label>
				  </div>
				  <div class="form-check form-check-inline">
					 <input class="form-check-input" type="radio" name="c_gender" id="female" value="여성" required>
					 <label class="form-check-label" for="female">여성</label>
				  </div>
				  <div class="invalid-feedback">
	                성별은 필수항목입니다.
	              </div>
	            </div>
	            
	            <div class="col-12">
	              <label for="c_tel" class="form-label">* 연락처</label>
	              <input type="text" class="form-control" id="c_tel" name="c_tel" placeholder="010-1234-5678" required>
	              <div class="invalid-feedback">
	                연락처는 필수항목입니다.
	              </div>
	            </div>
	            
	            <div class="col-12">
	              <label for="company" class="form-label">* 소속 회사</label>
	              <input type="text" class="form-control" id="company" name="company" placeholder="소속 회사" required>
	              <div class="invalid-feedback">
	                소속 회사는 필수항목입니다.
	              </div>
	            </div>
	            
	            <div class="col-12">
	              <label for="company" class="form-label">* 수업가능 시간대</label>
	              <input type="time" class="form-control" id="c_time" name="c_time" required>
	              <div class="invalid-feedback">
	                수업 가능한 시간은 필수항목입니다.
	              </div>
	            </div>
	            
	            <div class="col-12">
	              <label for="c_img" class="form-label">프로필 사진</label>
	              <input type="file" class="form-control" id="save" name="save">
	            </div>

			    <div class="form-check">
			      <input type="checkbox" class="form-check-input" id="checkbox1" name="checkbox" required onclick="selectAll(this);">
			      <label class="form-check-label" for="checkbox1">약관 전체동의</label>
			      <div class="invalid-feedback">약관에 동의하셔야합니다.</div>
			    </div>
			    <div class="form-check">
			      <input type="checkbox" class="form-check-input" id="checkbox2" name="checkbox" required>
			      <label class="form-check-label" for="checkbox2">개인정보 수집 이용동의(필수)</label>
			      <div class="invalid-feedback">약관에 동의하셔야합니다.</div>
			    </div>
			    <div class="form-check">
			      <input type="checkbox" class="form-check-input" id="checkbox3" name="checkbox">
			      <label class="form-check-label" for="checkbox3">마케팅 활용 및 광고성 정보 수신 동의(선택)</label>
			    </div>	

	          </div>
	
	          <hr class="my-4">
	          
	          <button class="w-40 btn btn-primary btn-lg" type="submit">
	          	다음
	          </button>
	          
	          <input type="button" class="w-40 btn btn-danger btn-lg" onclick="window.location='/ddarawazoom'" value="메인으로" />
	        </form>
	      </div>
	    </div>
	  </main>
	</div>
    
</div>

<script src="/resources/coach/custom/js/form-validation.js"></script>

<%@ include file="../../layout/footer.jsp"%>
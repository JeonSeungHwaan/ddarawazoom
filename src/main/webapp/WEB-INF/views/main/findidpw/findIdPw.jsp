<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/user/custom/js/user.js?ver=123" type="text/javascript"></script>
   
   
   
<div class="form-sigminbox text-center">
	<main class="form-signin">
		<div id="mainForm">
			<img class="mb-4" width="72" height="57" src="../../resources/image/Exercise.svg"/>
		    <h1 class="h3 mb-3 fw-normal">아이디 / 비밀번호 찾기</h1>
		
			<!-- findidpw의 name이 위아래 둘 다 같아줘야 radio 중복선택이 되지 않는다. -->
			<!-- onclick의 () 안에 id 값을 적어준다. -->
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio" name="findidpw" id="idRadio" checked="checked" onclick="javascript:contentsView('idRadio');">
			  <label class="form-check-label" for="idRadio">아이디 찾기</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio" name="findidpw" id="pwRadio" onclick="javascript:contentsView('pwRadio');">
			  <label class="form-check-label" for="pwRadio">비밀번호 찾기</label>
			</div>
		
			<form id="findIdForm">
			   <div id="findid" style="margin-top: 15px;">   
				  <div class="form-floating">
			    	 <input type="text" class="form-control" id="name" name="name" placeholder="이름">
			    	  <label for="floatingInput">이름</label>
			   	  </div>
			   	  
			      <div class="form-floating">
			    	  <input type="text" class="form-control" id="tel" name="tel" placeholder="-를 제외한 전화번호">
			    	  <label for="floatingPassword">-를 제외한 전화번호</label>
			      </div>
			      
			      <input type="button" class="w-100 btn btn-lg btn-secondary mb-3" 
			     		value="아이디 찾기" style="margin-top: 20px;" onclick="findId();"/>
			     		
			      <label id="result"></label>
		      </div>
		   </form>
		
			<form id="findPwForm">	
			   <div id="findpw">
			      <div class="form-floating">
			    	 <input type="text" class="form-control" id="id" name="id" placeholder="아이디">
			    	  <label for="floatingInput">아이디</label>
			   	  </div>
			   	  
			      <div class="form-floating">
			    	  <input type="text" class="form-control" id="email" name="email" placeholder="이메일 주소">
			    	  <label for="floatingPassword">이메일 주소</label>
			      </div>
			      
			      <input type="button" class="w-100 btn btn-lg btn-secondary mb-3" value="인증번호 발송" style="margin-top: 20px;" onclick="emailSend();"/>
			     
			      <label id="mail_send" style="margin-bottom: 10px;"></label>
			      		
			      <div class="form-floating" id="emailForm" style="display: none;">
			    	  <input type="text" class="form-control" id="temp_pw" name="temp_pw" placeholder="인증번호">
			    	  <label for="floatingPassword">인증번호</label>
			      
			      	  <input type="button" class="w-100 btn btn-lg btn-secondary mb-3" value="인증 확인" style="margin-top: 20px;" onclick="emailCheck();"/>
			      </div>
			      
			   </div>
		   </form>
		</div>
		
			<form id="pwChange">
		      	<div id="changePw" style="display: none;">
		      	  <img class="mb-4" width="72" height="57" src="../../resources/image/Exercise.svg"/>
		   		  <h1 class="h3 mb-3 fw-normal">비밀번호 변경</h1>
		   		  
		   		  <div class="form-floating">
			    	  <input type="password" class="form-control" id="pw1" name="pw1" placeholder="비밀번호">
			    	  <label for="floatingPassword">비밀번호</label>
			      </div>
		   		  
		   		  <div class="form-floating">
			    	  <input type="password" class="form-control" id="pw2" name="pw2" placeholder="비밀번호 확인">
			    	  <label for="floatingPassword">비밀번호 확인</label>
			      </div>
			      
			      <input type="button" class="w-100 btn btn-lg btn-secondary mb-3" value="비밀번호 변경" style="margin-top: 20px;" onclick="changePw();"/>
			   </div>
		   </form>

	</main>
</div>

<%@ include file="../../layout/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 카카오 스크립트 (카카오 로그인 관련 스크립트 함수가 실행되는 파일 경로) -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="/resources/user/custom/js/kakao.js" type="text/javascript"></script>

<!-- 네이버 스크립트 (네이버 로그인 관련 스크립트 함수가 실행되는 파일 경로) -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<div class="form-sigminbox text-center">
	<main class="form-signin">
	
		<form name="loginForm" action="/ddarawazoom/loginPro" method="post">
			<img class="mb-4" width="72" height="57" src="../../resources/image/Exercise.svg"/>
		    <h1 class="h3 mb-3 fw-normal">따라와Zoom과 운동해요</h1>
		
		    <div class="form-floating">
		    	<input type="text" class="form-control" 
		    	id="floatingInput" placeholder="name@example.com"
		    	name="id">
		    	<label for="floatingInput">ID</label>
		   
		     
		    </div>
		    <div class="form-floating">
		    	<input type="password" class="form-control" 
		    	id="floatingPassword" placeholder="Password"
		    	name="pw">
		    	<label for="floatingPassword">Password</label>
		    </div>
		
		    <div class="checkbox mb-3">
		    	<label>
		        	<input type="checkbox" value="remember-me"> Remember me
		    	</label>
		    </div>
		    
		    <div class="findidpw">
		   		<label>
		   			<input type="button" class="w-100 btn btn-lg btn-Dark mb-3" value="아이디/비밀번호 찾기" onclick="window.location='/ddarawazoom/findIdPw'"/>
		   		</label>
		    </div>
		   
		    <!-- 보라색 로그인 버튼 -->
		    <input type="submit"
		    class="w-100 btn btn-lg btn-secondary mb-3"
		    value="Login"/>
		    
		    <!-- 카카오톡 로그인 버튼 -->
		    <img src="/resources/user/custom/img/kakao_login_large_narrow.png" width="320px" onclick="kakaoLogin();" />
            <!-- onclick="document.location.href='/ddarawazoom/kakaologin'" -->
            <!-- name="kakaoLogin()" -->
            
            <!-- 네이버 로그인 버튼 -->
		    <div id="naverIdLogin" style="margin-top: 20px;"></div>

	</form>

	</main>
</div>

<script type="text/javascript">

  	var naverLogin = new naver.LoginWithNaverId(
  		{
  			clientId: 'BR6xUTS1rtRM8T8xgE0D', // 개발자센터에 등록한 ClientId
  			callbackUrl: 'http://192.168.0.13:8080/ddarawazoom/naverLogin', // 개발자센터에 등록한 callback Url 
  			isPopup: false,
  			loginButton: { color: 'green', type: 3, height: 70 }
  		}
  	);
  	
  	// 네이버 로그인 초기화
  	naverLogin.init();
  	
  </script>

<%@ include file="../../layout/footer.jsp"%>

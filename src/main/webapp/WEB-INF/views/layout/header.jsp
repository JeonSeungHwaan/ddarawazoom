<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- session의 문자열을 비교하기 위한 tablib -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- favicon -->	
<link href="../../resources/image/Exercise.svg" rel="shortcut icon" type="image/x-icon">

<!-- bootstrap -->
<link href="../../resources/css/styles.css?after" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- JQurey -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!--  -->
<script src="../../resources/js/header.js" type="text/javascript"></script>

<!-- 카카오 로그아웃 관련 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="/resources/user/custom/js/kakao.js" type="text/javascript"></script>

<title>DDarawaZoom</title>

<!-- navigation -->
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light mb-3">
	
	<!-- Side Menubar -->
	<div class="collapse navbar-collapse" id="navbar">
		<ul class="navbar-nav me-auto mb-2 mb-lg-0 position-absolute top-50 translate-middle-y">
			<li class="nav-item dropdown">	
				<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">
					<i class="bisbi-list"></i>
				</a> 
				<ul class="dropdown-menu" aria-labelledby="navbarDropdownLink">
					<li><a class="dropdown-item" href="/ddarawazoom/zoom">Zoom 강의</a></li>
						<c:if test="${sessionScope.id != null}">
							<li><a class="dropdown-item" href="/ddarawazoom/myclassroom">내 강의실</a></li>
						</c:if>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="/ddarawazoom/vod">Vod 강의</a></li>
					
					<c:if test="${sessionScope.admin != null}">
						<li><hr class="dropdown-divider"></li>
						<li class="dropdown-submenu">
							<a class="dropdown-item dropdown-toggle" href="#" >관리자 전용공간<span class="caret"></span></a>
	              			<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/manager/user">멤버 관리</a>						
								<li><a class="dropdown-item" href="/manager/coach">코치 관리</a>						
								<li><a class="dropdown-item" href="/manager/visitor">방문자 관리</a>						
								<li><a class="dropdown-item" href="/manager/sales">수입 관리</a></li>					
								<li><a class="dropdown-item" href="/manager/zoom">Zoom강의 관리</a>						
								<li><a class="dropdown-item" href="/manager/vod">Vod강의 관리</a>						
								<li><a class="dropdown-item" href="/manager/review">리뷰 관리</a></li>
								<li><a class="dropdown-item" href="/manager/notice">공지사항 관리</a></li>
							</ul>
						</li>
					</c:if>
					
					<c:if test="${sessionScope.id != null}">
						<li><hr class="dropdown-divider"></li>
						<li class="dropdown-submenu">
							<a class="dropdown-item dropdown-toggle" href="#" >멤버 전용공간<span class="caret"></span></a>
	              			<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/myroom">마 이 룸</a>						
								<li><a class="dropdown-item" href="/myroom/bodyprofile">바디 프로필</a></li>						
								<li><a class="dropdown-item" href="/myroom/userInfo">회원 정보</a></li>					
								<li><a class="dropdown-item" href="/myroom/class">강의관리</a></li>
								<li class="dropdown-submenu">
									<a  class="dropdown-item dropdown-toggle">락커룸</a>
										<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="/myroom/likeZoom">관심Zoom</a>
									</ul>
								</li>
								<li><a class="dropdown-item" href="/myroom/payment">결재내역</a></li>
								<li><a class="dropdown-item" href="/myroom/review">리뷰관리</a></li>
							</ul>
						</li>
					</c:if>
					
					<c:if test="${sessionScope.c_id != null}">
						<li><hr class="dropdown-divider"></li>
						<li class="dropdown-submenu">
							<a class="dropdown-item dropdown-toggle" href="#">코치 전용공간<span class="caret"></span></a>
	              			<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="/coachroom">코 치 룸</a></li>					
								<li><a class="dropdown-item" href="/coachroom/schedule">스케줄관리</a></li>
								<li><a class="dropdown-item" href="/coachroom/class">강의관리</a></li>
								<li><a class="dropdown-item" href="/coachroom/payment">수입관리</a></li>
								<li><a class="dropdown-item" href="/coachroom/info">정보관리</a></li>
							</ul>
						</li>
					</c:if>
					
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="/chatRoom">따라와줌 파티룸</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="/ddarawazoom/notice">공지사항</a></li>
					<li><a class="dropdown-item" href="/ddarawazoom/intro">DDarawaZoom소개</a></li>
					<li><a class="dropdown-item" href="/ddarawazoom/coachIntro">DDarawaZoom코치소개</a></li>
				</ul>
			</li>
		</ul>
	</div>
	
	
	
	<div class="container-fluid mx-5" > 
	    <a class="navbar-brand" href="/ddarawazoom">
	    	<img class="bi me-2" width="40" height="32" src="../../resources/image/Exercise.svg"/>
	    	DDarawaZoom!
    	</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      	<span class="navbar-toggler-icon"></span>
	    </button>
    
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 position-absolute top-50 start-50 translate-middle">
				<li class="nav-item px-4">
					<a class="nav-link active" aria-current="page" href="/ddarawazoom/zoom">Zoom 강의</a>
		        </li>
		        
		        <li class="nav-item px-4">
					<a class="nav-link active" href="/ddarawazoom/vod">Vod 강의</a>
		        </li>
		        
		        <c:if test="${not empty sessionScope.id}">
					<li class="nav-item px-4">
						<a class="nav-link active" href="/myroom">마이룸</a>
		        	</li>
				</c:if>
		        
		     </ul>
		        
	        <ul class="navbar-nav me-auto mb-2 mb-lg-0 position-absolute top-50 translate-middle-y">
	        	<li class="nav-item">
				
					<c:if test="${empty sessionScope.id && empty sessionScope.c_id && empty sessionScope.admin}">
						<a class="nav-link" href="/ddarawazoom/login">로그인</a>
					</c:if>
					
					<c:if test="${not empty sessionScope.id || not empty sessionScope.c_id || not empty sessionScope.admin}">
					
						<c:set var="session" value="${sessionScope.id}" />
						
						<!-- 문자열 안에 kakaoLogin이 포함되어있는지 확인 -->
						<c:if test="${fn:contains(session, 'kakaoLogin')}">
							<a class="nav-link" href="#" onclick="kakaoLogout();">로그아웃</a>
						</c:if>
						
						<c:if test="${!fn:contains(session, 'kakaoLogin')}">
							<a class="nav-link" href="/ddarawazoom/logout">로그아웃</a>
						</c:if>
						
					</c:if>
					
		        </li>
		        
		        <c:if test="${empty sessionScope.id && empty sessionScope.c_id && empty sessionScope.admin}">
			        <li class="nav-item dropdown ">
			          	<a class="nav-link dropdown-toggle" href="#" 
			          	id="navbarDropdown" role="button" 
			          	data-bs-toggle="dropdown" aria-expanded="false">
			            회원 가입
			          	</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				            <li><a class="dropdown-item" href="#" onclick="window.location='/ddarawazoom/signup'">멤버 가입</a></li>
				            <li><a class="dropdown-item" href="#" onclick="window.location='/ddarawazoom/coachsignup'">코치 가입</a></li>
			          	</ul>
			        </li>
		        </c:if>     
		           
		   	</ul>

    	</div>
    
	</div>
</nav>

<!-- Channel Plugin Scripts -->
<!-- 1:1 문의 채팅 -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "69f689a1-6573-44cf-a860-c97af8f3f6e3"
  });
</script>
<!-- End Channel Plugin -->
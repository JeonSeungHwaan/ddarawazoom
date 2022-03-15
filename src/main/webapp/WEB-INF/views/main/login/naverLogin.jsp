<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: 'BR6xUTS1rtRM8T8xgE0D', // 개발자센터에 등록한 ClientId
  			callbackUrl: 'http://localhost:8080/ddarawazoom/naverLogin', // 개발자센터에 등록한 callback Url
  			isPopup: false,
  			callbackHandle: true // callback 페이지가 분리되어 있을 경우엔 callback처리를 할 수 있도록 설정함
		}
	);
	
	// 네이버 로그인 초기화
	naverLogin.init();
	
	// callback 처리
	window.addEventListener('load', function(){
		naverLogin.getLoginStatus(function (status){
			if(status){
				
				// 필수로 받아야하는 항목 체크
				var email = naverLogin.user.getEmail(); // 사용자 이메일 정보
				var name = naverLogin.user.getName(); // 사용자 이름
				var img = naverLogin.user.profile_image; // 사용자 프로필 사진
				console.log(naverLogin.user); // 사용자 정보
				
				console.log(naverLogin.accessToken);
				
				if(email == undefined || email == null){
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
					// 사용자정보 재동의를 위해 동의 페이지로 다시 이동
					naverLogin.reprompt();
					return;
				} else if(name == undefined || name == null){
					alert("사용자 이름은 필수정보입니다. 정보제공을 동의해주세요.");
					// 사용자정보 재동의를 위해 동의 페이지로 다시 이동
					naverLogin.reprompt();
				} else if(img == undefined || img == null){
					alert("프로필 사진은 필수정보입니다. 정보제공을 동의해주세요.");
					// 사용자정보 재동의를 위해 동의 페이지로 다시 이동
					naverLogin.reprompt();
				}
				
				var id = naverLogin.user.getId() + "naverLogin"; // 사용자 고유 ID
				
				var naverData = JSON.stringify({
					'id' : id,
					'nick' : name,
					'email' : email,
					'img' : img
				})
				
				$.ajax({
					data : naverData,
					url : "/ddarawazoom/naverLoginPro",
					type : "POST",
					contentType : "application/json; charset=UTF-8",
					async: false
				});
				
				window.location.replace('http://'
						+ window.location.hostname
						+ (location.port == '' || location.port == undefined ? '' : ':' + location.port)
						+ '/ddarawazoom');
			}
		});
	});
	
</script>
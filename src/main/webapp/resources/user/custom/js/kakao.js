// 카카오 로그인 API 관련 스크립트 파일

// 키를 발급받고 받은 키로 sdk 초기화 진행
Kakao.init('fe7344bb892ab9d3081040d3d8b90568'); 
console.log(Kakao.isInitialized());

//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      scope: 'profile_nickname, profile_image, account_email',
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
			console.log(response)
			
			var id = response.id+"kakaoLogin"; // 카카오 회원 번호
			var nick = response.properties.nickname; // 카카오 닉네임
			var email = response.kakao_account.email; // 카카오 이메일
			var kakaoImg = response.properties.profile_image; // 카카오 프로필 사진
			
		  	// 사용자의 카카오 회원 정보에 이메일 정보가 없을 때 이메일 정보 대신 문구를 DB에 저장하기 위함
			if(email == undefined || email == null){
				email = '이메일을 등록해주세요';
			}
			
		  	// controller로 보낼 사용자 정보
			var kakaoData = JSON.stringify({
					'id' : id,
					'nick' : nick,
					'email' : email,
					'img' : kakaoImg
				})
			
			// 사용자의 정보를 controller로 보냄 
        		$.ajax({
				data : kakaoData,
				url : "/ddarawazoom/kakaoLogin",
				type : "POST",
				dataType : "json",
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					if(data == 1){
						window.location="/ddarawazoom";
					}
				}
			});
			
          },
          fail: function (error) { 
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
  
  
  
//카카오로그아웃  
function kakaoLogout(){
	if (!Kakao.Auth.getAccessToken()) {
	  console.log('Not logged in.');
	  window.location="/ddarawazoom";
	}

	Kakao.Auth.logout(function() {
	  console.log(Kakao.Auth.getAccessToken());
	  window.location="/ddarawazoom/logout";
	});
}

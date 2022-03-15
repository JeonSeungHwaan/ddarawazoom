// ajax로 view -> controller로 여러개의 값 전송할 때 필요한 코드
$.fn.serializeObject = function(){
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		var name = $.trim(this.name),
			value = $.trim(this.value);
		
		if (o[name]) {
			if (!o[name].push) {
				o[name] = [o[name]];
			}
			o[name].push(value || '');
		} else {
			o[name] = value || '';
		}
	});
	return o;
};


// 회원 정보 수정
function infoUpdate_submit(){

	if(document.userinfo_update.nick.value==""){
		alert('작성된 닉네임이 없습니다.\n닉네임을 기입해 주세요.');
		document.userinfo_update.nick.focus();
		return false;
	}else if(document.userinfo_update.name.value==""){
		alert('작성된 이름이 없습니다.\n이름을 기입해 주세요.');
		document.userinfo_update.name.focus();
		return false;
	}else if(document.userinfo_update.pw.value==""){
		alert('작성된 패스워드가 없습니다.\n패스워드를 기입해 주세요.');
		document.userinfo_update.pw.focus();
		return false;
	}else if(document.userinfo_update.email.value==""){
		alert('작성된 이메일이 없습니다.\n이메일을 기입해 주세요.');
		document.userinfo_update.email.focus();
		return false;
	}else if(document.userinfo_update.gender.value==""){
		alert('선택한 성별이 없습니다.\n성별을 선택해 주세요.');
		document.userinfo_update.gender.focus();
		return false;
	}else if(document.userinfo_update.tel.value==""){
		alert('작성된 연락처가 없습니다.\n연락처를 기입해 주세요.');
		document.userinfo_update.tel.focus();
		return false;
	}else if(document.userinfo_update.birth.value==""){
		alert('작성된 생년월일이 없습니다.\n생년월일을 기입해 주세요.');
		document.userinfo_update.birth.focus();
		return false;
	}else if($('#nickResult').text() == '이미 사용중인 닉네임입니다. 다른 닉네임을 사용해주세요.' ||
			 $('#nickResult').text() == '닉네임을 입력해주세요.') {
		document.userinfo_update.nick.focus();
		return false;
	}else{
		var updateInfo = JSON.stringify($('form#updateForm').serializeObject());
	}
	
	$.ajax({
		data : updateInfo,
		url : "/myroom/infoUpdateData",
		type : "POST",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(data == 1){
				alert('정보 수정이 완료되었습니다!');
				window.location="/myroom/userInfo";
			}
		}
	});
}


// 프로필 수정 팝업창
function imgUpdateForm(){
	var url = "/myroom/imgUpdate";
	var name = "img_update";
	var option = "width=500, height=550";
	
	window.open(url, name, option);
}

// 프로필 사진 변경
function imgUpdatePro(){

	var form = new FormData();
    form.append( "save", $("#formFile")[0].files[0] );
        
    if($('#formFile').val() == ''){
    			alert('첨부된 사진이 없습니다. 수정을 원하신다면, 사진을 첨부해 주세요.');
                return false;
            }    
        
	$.ajax({
		url : "/myroom/imgUpdatePro",
		type : "POST",
		processData : false,
		contentType : false,
		data : form,
		async: false,
		success : function(data){
			var result = parseInt(data);
			
			if(window.confirm('등록한 프로필 사진으로 변경하시겠습니까?') == true){
				alert("프로필 사진 업로드가 완료되었습니다.\n수정화면으로 돌아갑니다.");
				opener.document.location.reload();
				window.close();
			}
		}
	});
}


// 멤버 탈퇴 확인 페이지
function userDelete(){
	if(window.confirm('정말로 탈퇴를 원하십니까?') == true){
	
		var url = "/myroom/userDelete";
		var name = "user_delete";
		var option = "width=500, height=300, left=100, top=50";
		
		window.open(url, name, option);
	}
}

// 멤버 탈퇴 후, 상태 변경
function userDeletePro(){
		
	$.ajax({
		data : $("#pw").serializeArray(),
		url : "/myroom/userDeletePro",
		type : "POST",
		dataType : "json",
		success : function(data){
			var result = parseInt(data);
			
			if(result == 0){
				alert("패스워드가 일치하지 않습니다.\n다시 입력 부탁드립니다.");
				return false;
			}else{
				opener.document.location.reload();
				window.close();
			}
		}
	});
}

function nicknameCheck(nick){
	console.log($('#nick').val())
	console.log(nick)
	if($('#nick').val() != nick) {
		// ajax 호출
		$.ajax({
			// 값을 보내는 방식
			type : "post",
			// 호출할 링크(컨트롤과 연결)
			url : "/ddarawazoom/nickCheck",
			// 보낼 파라미터
			data : { nick : $("#nick").val() } ,
			// 값을 성공적으로 가져왔을 때 data에 값을 대입
			success : function(data){
				console.log(data);
				a = parseInt(data);
				if(a == 1){
					$("#nickResult").html("<font color='red'>이미 사용중인 닉네임입니다. 다른 닉네임을 사용해주세요.</font>");
					$("#nick").attr('class', 'custom-form-control custom-is-invalid');
				} else if(a == 0) {
					$("#nickResult").html("<font color='green'>사용가능한 닉네임입니다.</font>");
				} else if(a == -1){
					$("#nickResult").html("<font color='red'>닉네임을 입력해주세요.</font>");
					$("#nick").attr('class', 'custom-form-control custom-is-invalid');
				}
			}
		});
	} else {
		$("#nickResult").html("");
		$("#nick").attr('class', 'custom-form-control');
	}
}
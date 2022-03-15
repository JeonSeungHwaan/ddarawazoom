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

// 멤버 패스워드 변경 창
function userPw(id){
	
	if(window.confirm('멤버님의 패스워드를 변경하시겠습니까?') == true){
	
		var url = "/manager/userPw?id="+id;
		var name = "pwChange";
		var option = "width=500, height=350, left=650, top=380";
		
		window.open(url, name, option);
	}
}

// 멤버 패스워드 변경
function updateUserPw(){
	if(document.user_pw.pw.value == ""){
		alert('패스워드가 입력되지 않았습니다.\n패스워드를 반드시 기입해 주세요.');
		document.user_pw.pw.focus();
		return false;
	}else{
		var data = JSON.stringify($('form#userPw').serializeObject());
	}
	
	$.ajax({
		data : data,
		url : "/manager/updateUserPw",
		type : "POST",
		contentType : "application/json; charset=UTF-8", 
		success : function(data){
			var result = parseInt(data);
			
			if(result == 0){
				alert('패스워드 입력이 잘못 되었습니다.\n다시 입력 부탁드립니다.');
				return false;
			}else{
				alert('멤버님의 패스워드 수정이 완료되었습니다.');
				opener.parent.location.reload();
				$('#userPw').submit();
				window.close();
			}
		}
	});
}


// 멤버 탈퇴
function userDelete(id){
	if(window.confirm('멤버님의 탈퇴를 진행하시겠습니까?') == true){
		
		$.ajax({
			data: { id : id },
			url : "/manager/userDelete",
			success : function(data){
				if(data == 1){
					alert('멤버님의 탈퇴 진행을 완료하였습니다.');
					window.location.reload();
				}
			}
		});
	}
}

// 멤버 검색 버튼
function valueCheck(){
	if($('#search-category').val() == ''){
		alert('카테고리를 선택해 주세요.');
		document.searchForm.category.focus();
		return false;
	}
	
	if($('#search-input').val() == ''){
		alert('검색어를 작성해 주세요.');
		document.searchForm.input.focus();
		return false;
	}
}
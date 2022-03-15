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

// 코치 정보 수정
function infoUpdate_submit(){
	if($("#c_name").val() == "" || $("#c_nick").val() == "" || $("#c_email").val() == "" || $("#c_birth").val() == "" || $("#c_gender").val() == ""){
		return false;
	}
	
	var updateInfo = JSON.stringify($('form#updateForm').serializeObject());

	$.ajax({
		data : updateInfo,
		url : "/coachroom/infoUpdateData",
		type : "POST",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(data == 1){
				alert("수정 되었습니다.");
			}
		}
	});
}

// 경력 추가
function insert_submit(){
	if($("#specialty").val() == "" || $("#career").val() == ""){
		return false;
	}

	var insertCareer = JSON.stringify($('form#insertForm').serializeObject());

	$.ajax({
		data : insertCareer,
		url : "/coachroom/careerInsertPro",
		type : "POST",
		contentType : "application/json; charset=UTF-8",
		async: false,
		success : function(data){
			if(data == 1){
				alert("수정 되었습니다.");
			}
		}
	});
}

// 경력 수정
function update_submit(){
	if($("#specialty").val() == "" || $("#career").val() == ""){
		return false;
	}

	var updateCareer = JSON.stringify($('form#updateForm').serializeObject());

	$.ajax({
		data : updateCareer,
		url : "/coachroom/careerUpdatePro",
		type : "POST",
		contentType : "application/json; charset=UTF-8",
		async: false,
		success : function(data){
			if(data == 1){
				alert("수정 되었습니다.");
			}
		}
	});
}

// 프로필 사진 변경 팝업 생성
function imgUpdateForm(){
	var url = "/coachroom/imgUpdate";
	var name = "img_update";
	var option = "width=500, height=200 left=100, top=50, location=no";
	
	window.open(url, name, option);
}

// 프로필 사진 변경
function imgUpdatePro(){

	if($("#formFile") == "") {
		return false;
	}
	
	var form = new FormData();
    form.append( "save", $("#formFile")[0].files[0] );
	
	$.ajax({
		url : "/coachroom/imgUpdatePro",
		type : "POST",
		processData : false,
		contentType : false,
		data : form,
		async: false,
		success : function(data){
			var result = parseInt(data);
			if(result == 1){
				alert("업로드 완료되었습니다.");
				opener.parent.location.reload();
				window.close();
			} else {
				alert("이미지만 업로드 가능합니다.");
			}
		}
	});
}

// 코치소개 수정
function itdUpdate_submit(){
	if($("#introduce").val() == ""){
		return false;
	}

	var updateItroduce = JSON.stringify($('form#itdUpdateForm').serializeObject());

	$.ajax({
		data : updateItroduce,
		url : "/coachroom/introduceUpdatePro",
		type : "POST",
		contentType : "application/json; charset=UTF-8",
		async: false,
		success : function(data){
			if(data == 1){
				alert("수정 되었습니다.");
			}
		}
	});
}

function delete_alert(number){
	console.log(number);

	if (window.confirm('경력을 삭제하시겠습니까?')){

		console.log(number);
	
		$.ajax({
			data : JSON.stringify({ num : number }),
			url : "/coachroom/careerDelete",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			async: false,
			success : function(data){
				if(data == 1){
					alert("삭제 되었습니다.");
					window.location.reload();
				}
			}
		});
	}
	else{
		// They clicked no
	}
}
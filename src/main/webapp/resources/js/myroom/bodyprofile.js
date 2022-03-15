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

//바디 프로필 작성 유효성 검사
function body_Write(){
	
	var bW = document.body_write;
	var fileCheck = document.getElementById("save").value;
	
	if(bW.b_date.value==''){
		alert('작성 날짜가 없습니다.\n작성 날짜를 확인 후, 기입해 주세요.');
		bW.b_date.focus();
		return false;
	}else if(bW.b_height.value==''){
		alert('키에 대한 내용이 없습니다.\n현재 멤버님의 키를  측정하여 기입해 주세요.');
		bW.b_height.focus();
		return false;
	}else if(bW.b_weight.value==''){
		alert('몸무게에 대한 내용이 없습니다.\n현재 멤버님의 몸무게를 측정하여 기입해 주세요.');
		bW.b_weight.focus();
		return false;
	}else if(bW.b_muscle.value==''){
		alert('근육량에 대한 내용이 없습니다.\n현재 멤버님의 근육량을 측정하여 기입해 주세요.');
		bW.b_muscle.focus();
		return false;
	}else if(bW.b_bodyfat.value==''){
		alert('체지방량에 대한 내용이 없습니다.\n현재 멤버님의 체지방량을 측정하여 기입해 주세요.');
		bW.b_bodyfat.focus();
		return false;
	}else if(bW.b_shape.value==''){
		alert('체형에 대한 내용이 없습니다.\n현재 멤버님의 체형을 선택해 주세요.');
		bW.b_shape.focus();
		return false;
	}else if(bW.b_chest.value==''){
		alert('가슴 둘레에 대한 내용이 없습니다.\n현재 멤버님의 가슴 둘레를 측정하여 기입하여 주세요.');
		bW.b_chest.focus();
		return false;
	}else if(bW.b_waist.value==''){
		alert('허리 둘레에 대한 내용이 없습니다.\n현재 멤버님의 허리 둘레를 측정하여 기입하여 주세요.');
		bW.b_waist.focus();
		return false;
	}else if(bW.b_arm.value==''){
		alert('팔뚝 둘레에 대한 내용이 없습니다.\n현재 멤버님의 팔뚝 둘레를 측정하여 기입하여 주세요.');
		bW.b_arm.focus();
		return false;
	}else if(bW.b_thigh.value==''){
		alert('허벅지 둘레에 대한 내용이 없습니다.\n현재 멤버님의 허벅지 둘레를 측정하여 기입하여 주세요.');
		bW.b_thigh.focus();
		return false;
	}else if(bW.b_hip.value==''){
		alert('엉덩이 둘레에 대한 내용이 없습니다.\n현재 멤버님의 엉덩이 둘레를 측정하여 기입하여 주세요.');
		bW.b_hip.focus();
		return false;
	}else if(!fileCheck){
		alert('첨부된 바디 사진이 없습니다.\n오늘 하루의 바디 프로필 사진을 찍어서 기록을 남겨보세요~');
		bW.save.focus();
		return false;
	}else{
		alert('모든 바디프로필 정보가 기입되었습니다!\n등록 도와드리겠습니다.\n오늘도 화이팅하세요~!\n감사합니다^_^');
		bW.submit();
	}
}


// 바디 프로필 수정 유효성 검사
function body_Update(){
	
	var bU = document.body_update;
	var fileCheck = document.getElementById("save").value;
	
	if(bU.b_date.value==''){
		alert('작성 날짜가 없습니다.\n작성 날짜를 확인 후, 기입해 주세요.');
		bU.b_date.focus();
		return false;
	}else if(bU.b_height.value==''){
		alert('키에 대한 내용이 없습니다.\n현재 멤버님의 키를  측정하여 기입해 주세요.');
		bU.b_height.focus();
		return false;
	}else if(bU.b_weight.value==''){
		alert('몸무게에 대한 내용이 없습니다.\n현재 멤버님의 몸무게를 측정하여 기입해 주세요.');
		bU.b_weight.focus();
		return false;
	}else if(bU.b_muscle.value==''){
		alert('근육량에 대한 내용이 없습니다.\n현재 멤버님의 근육량을 측정하여 기입해 주세요.');
		bU.b_muscle.focus();
		return false;
	}else if(bU.b_bodyfat.value==''){
		alert('체지방량에 대한 내용이 없습니다.\n현재 멤버님의 체지방량을 측정하여 기입해 주세요.');
		bU.b_bodyfat.focus();
		return false;
	}else if(bU.b_shape.value==''){
		alert('체형에 대한 내용이 없습니다.\n현재 멤버님의 체형을 선택해 주세요.');
		bU.b_shape.focus();
		return false;
	}else if(bU.b_chest.value==''){
		alert('가슴 둘레에 대한 내용이 없습니다.\n현재 멤버님의 가슴 둘레를 측정하여 기입하여 주세요.');
		bU.b_chest.focus();
		return false;
	}else if(bU.b_waist.value==''){
		alert('허리 둘레에 대한 내용이 없습니다.\n현재 멤버님의 허리 둘레를 측정하여 기입하여 주세요.');
		bU.b_waist.focus();
		return false;
	}else if(bU.b_arm.value==''){
		alert('팔뚝 둘레에 대한 내용이 없습니다.\n현재 멤버님의 팔뚝 둘레를 측정하여 기입하여 주세요.');
		bU.b_arm.focus();
		return false;
	}else if(bU.b_thigh.value==''){
		alert('허벅지 둘레에 대한 내용이 없습니다.\n현재 멤버님의 허벅지 둘레를 측정하여 기입하여 주세요.');
		bU.b_thigh.focus();
		return false;
	}else if(bU.b_hip.value==''){
		alert('엉덩이 둘레에 대한 내용이 없습니다.\n현재 멤버님의 엉덩이 둘레를 측정하여 기입하여 주세요.');
		bU.b_hip.focus();
		return false;
	}else if(!fileCheck){
		alert('첨부된 바디 사진이 없습니다.\n오늘 하루의 바디 프로필 사진을 찍어서 기록을 남겨보세요~');
		bU.save.focus();
		return false;
	}else{
		alert('모든 바디프로필 정보가 기입되었습니다!\n수정 도와드리겠습니다.\n오늘도 화이팅하세요~!\n감사합니다^_^');
		bU.submit();
	}
}

// 마이 프로필 수정 유효성 검사
function myroom_update(){

	var mW = document.myroom_form;
	var fileCheck = document.getElementById("save").value;
	
	
	if(mW.name.value==''){
		alert('이름이 없습니다.\n멤버님의 이름을 기입해 주세요.');
		mW.name.focus();
		return false;
	}else if(mW.birth.value==''){
		alert('생년월일이 없습니다.\n멤버님의 특별한 생년월일을 기입해 주세요.');
		mW.birth.focus();
		return false;
	}else if(mW.gender.value==''){
		alert('선택된 성별이 없습니다.\n성별을 선택해 주세요.');
		mW.gender.focus();
		return false;
	}else if(mW.tel.value==''){
		alert('연락처가 없습니다.\n코치와 연락이 가능한 연락처를 기입해 주세요.');
		mW.tel.focus();
		return false;
	}else if(mW.email.value==''){
		alert('이메일이 없습니다.\n멤버님의 이메일을 기입해 주세요.');
		mW.email.focus();
		return false;
	}else if(!fileCheck){
		alert('첨부 파일이 없습니다\n코치님이 멤버님을 한 눈에 알아볼 수 있도록\n프로필을 등록해 주세요.');
		mW.save.focus();
		return false;
	}else{
		alert('마이프로필에 필요한 정보들이 모두 기입되었습니다!');
		mW.submit();
	}
}



function button_test(){
	document.getElementById("body_button").style.visibility="visible"; //show
	document.getElementById("body_button").style.visibility="hidden"; //show
}
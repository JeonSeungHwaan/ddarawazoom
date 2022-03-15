$(document).ready(function(){
	// 아이디 중복체크
	$("#idCheck").click(function(){
		// ajax 호출
		$.ajax({
			// 값을 보내는 방식
			type : "post",
			// 호출할 링크(컨트롤과 연결)
			url : "/ddarawazoom/idCheck",
			// 보낼 파라미터
			data : { id : $("#c_id").val() } ,
			// 값을 성공적으로 가져왔을 때 data에 값을 대입
			success : function(data){
				console.log(data);
				a = parseInt(data);
				if(a == 1){
					$("#result").html("<font color='red'>이미 사용중인 아이디입니다. 다른 아이디를 사용해주세요.</font>");
					$("#c_id").attr('class', 'custom-form-control custom-is-invalid');
				} else if(a == 0) {
					$("#result").html("<font color='green'>사용가능한 아이디입니다.</font>");
				} else if(a == -1){
					$("#result").html("<font color='red'>아이디를 입력해주세요.</font>");
					$("#c_id").attr('class', 'custom-form-control custom-is-invalid');
				}
			}
		});
	});
	
	$("#nickCheck").click(function(){
		// ajax 호출
		$.ajax({
			// 값을 보내는 방식
			type : "post",
			// 호출할 링크(컨트롤과 연결)
			url : "/ddarawazoom/nickCheck",
			// 보낼 파라미터
			data : { nick : $("#c_nick").val() } ,
			// 값을 성공적으로 가져왔을 때 data에 값을 대입
			success : function(data){
				console.log(data);
				a = parseInt(data);
				if(a == 1){
					$("#nickResult").html("<font color='red'>이미 사용중인 닉네임입니다. 다른 닉네임을 사용해주세요.</font>");
					$("#c_nick").attr('class', 'custom-form-control custom-is-invalid');
				} else if(a == 0) {
					$("#nickResult").html("<font color='green'>사용가능한 닉네임입니다.</font>");
				} else if(a == -1){
					$("#nickResult").html("<font color='red'>닉네임을 입력해주세요.</font>");
					$("#c_nick").attr('class', 'custom-form-control custom-is-invalid');
				}
			}
		});
	});
	
	$("form").submit(function(){
		if($("#c_pw").val() != $("#c_re-pw").val()){
			$("#pwCheck").html("<font color='red'>비밀번호가 다릅니다.</font>");
			$("#c_pw").attr('class', 'custom-form-control custom-is-invalid');
			$("#c_re-pw").attr('class', 'custom-form-control custom-is-invalid');
			document.getElementById('c_pw').focus();
			return false;
		}
		
		if($("#result").text() == '아이디를 입력해주세요.' || $("#result").text() == '이미 사용중인 아이디입니다. 다른 아이디를 사용해주세요.'){
			document.getElementById('c_id').focus();
			return false;
		}
		
		if($("#nickResult").text() == '닉네임을 입력해주세요.' || $("#nickResult").text() == '이미 사용중인 닉네임입니다. 다른 닉네임을 사용해주세요.'){
			document.getElementById('c_nick').focus();
			return false;
		}
	});
	
});

function submit_check(){
	
	console.log("script run");
	
	if($("#c_id").val() == "" ||
		$("#c_pw").val() == "" ||
		$("#c_re-pw").val() == "" ||
		$("#c_name").val() == ""||
		$("#c_nick").val() == "" ||
		$("#checkbox2").val() == "" ||
		$("#c_email").val() == '' ||
		$("#c_birth").val() == "" ||
		$("#c_gender").val() == '' ||
		$("#c_tel").val() == '' ||
		$("#company").val() == ''){
		return false;
	}
	
}

function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('checkbox');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
}

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

function careerInsert(){
	if($('#specialty').val() == '' || $('#career').val() == ''){
		return false;
	}

	var data = JSON.stringify($('form#coachCareerForm').serializeObject());

            $.ajax({
               data : data,
               url : "/ddarawazoom/coachCareerInsert",
               type : "POST",
               contentType : "application/json; charset=UTF-8",
               success : function(data){
				  console.log(data);
                  if(data == 1){
                     alert("코치신청이 완료되었습니다. \n빠른 시일 내에 메일로 답장드리겠습니다.");
                     window.location="/ddarawazoom";
                  } else {
					 alert("잘못된 입력이 있습니다. 다시 입력해주세요.");
                  }
                  
               }
             });
}
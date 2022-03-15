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
			data : { id : $("#id").val() } ,
			// 값을 성공적으로 가져왔을 때 data에 값을 대입
			success : function(data){
				console.log(data);
				a = parseInt(data);
				if(a == 1){
					$("#result").html("<font color='red'>이미 사용중인 아이디입니다. 다른 아이디를 사용해주세요.</font>");
					$("#id").attr('class', 'custom-form-control custom-is-invalid');
				} else if(a == 0) {
					$("#result").html("<font color='green'>사용가능한 아이디입니다.</font>");
				} else if(a == -1){
					$("#result").html("<font color='red'>아이디를 입력해주세요.</font>");
					$("#id").attr('class', 'custom-form-control custom-is-invalid');
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
	});
	
	$("form").submit(function(){
		if($("#pw").val() != $("#re-pw").val()){
			$("#pwCheck").html("<font color='red'>비밀번호가 다릅니다.</font>");
			$("#pw").attr('class', 'custom-form-control custom-is-invalid');
			$("#re-pw").attr('class', 'custom-form-control custom-is-invalid');
			document.getElementById('pw').focus();
			return false;
		}
		
		if($("#result").text() == '아이디를 입력해주세요.' || $("#result").text() == '이미 사용중인 아이디입니다. 다른 아이디를 사용해주세요.'){
			document.getElementById('id').focus();
			return false;
		}
		
		if($("#nickResult").text() == '닉네임을 입력해주세요.' || $("#nickResult").text() == '이미 사용중인 닉네임입니다. 다른 닉네임을 사용해주세요.'){
			document.getElementById('nick').focus();
			return false;
		}
	});
	
});

function submit_check(){
	
	console.log("script run");
	
	if($("#id").val() == "" || $("#pw").val() == "" || $("#re-pw").val() == "" || $("#email").val() == "" || $("#nick").val() == "" || $("#checkbox2").val() == ""){
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
	
// 아이디 / 비밀번호 찾기
$(document).ready(function(){
		contentsView('idRadio');
});

         function contentsView(objValue) {
             if (objValue == 'idRadio') {
                 $('#findid').css('display', 'block');
                 $('#findpw').css('display', 'none'); 
                 //display 'none'은= div가 보이지않는!
                 return false;
             }
             if (objValue == 'pwRadio') {
                 $('#findid').css('display', 'none');
                 $('#findpw').css('display', 'block');
                 return false;
             }
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
	
         function findId(){
			if($("#name").val() == ''){
				alert("이름을 입력해주세요.");
				return false;
			} else if($("#tel").val() == ''){
				alert("전화번호를 입력해주세요.");
				return false;
			}
	
            var data = JSON.stringify($('form#findIdForm').serializeObject());
            $.ajax({
               data : data,
               url : "/ddarawazoom/findIdPro",
               type : "POST",
               contentType : "application/json; charset=UTF-8",
               success : function(data){
                  if(data != ''){
                     $("#result").html("고객님의 아이디는 <font color='green'>"+data+"</font>입니다.");
                  } else {
                     $("#result").html("<font color='red'>아이디가 존재하지 않습니다.</font>");
                  }
                  
               }
             });
         }
     
        // 인증 이메일 발송
        function emailSend(){
        	if($("#id").val() == ''){
        		alert("아이디를 입력해주세요.");
        		return false;
        	}
        	
        	if($("#email").val() == ''){
        		alert("이메일을 입력해주세요.");
        		return false;
			}
			
			$("#mail_send").html("<font color='green'>인증번호가 메일로 전송되었습니다.</font>");
        	$('#emailForm').css('display', 'block');
			
			$.ajax({
                data : { id : $("#id").val(), email : $("#email").val() },
                url : "/ddarawazoom/emailSend",
                type : "POST"
		   });
		   
        } 
         
        // 인증번호 체크
        function emailCheck(){
        	var data = JSON.stringify($('form#findPwForm').serializeObject());
        	$.ajax({
                data : data,
                url : "/ddarawazoom/emailCheck",
                type : "POST",
                contentType : "application/json; charset=UTF-8",
                success : function(data){
                   if(data == 1){
                 	  alert("인증되었습니다.");
                 	  $('#mainForm').css('display', 'none'); 
                 	  $('#findpw').css('display', 'none'); 
                 	  $('#changePw').css('display', 'block');
                   } else {
                	   alert("인증번호가 틀립니다.");
                   }
                }
              });
        } 
         
        // 비밀번호 변경
        function changePw(){
            $.ajax({
               data : {
            	   pw1 : $("#pw1").val(),
            	   pw2 : $("#pw2").val(),
            	   id : $("#id").val(),
            	   email : $("#email").val()
               },
               url : "/ddarawazoom/updatePw",
               type : "POST",
               success : function(data){
                  if(data == 1){
                	  alert("비밀번호가 변경되었습니다.");
                	  window.location="/ddarawazoom/login";
                  } else {
                	  alert("비밀번호를 확인해주세요.");
                  }
               }
             });
         }	
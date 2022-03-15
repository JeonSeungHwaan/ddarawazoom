var ws;

function wsOpen(){
	//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
	ws = new WebSocket("ws://" + location.host + "/chating/"+$("#roomNumber").val());
	wsEvt();
}

function wsEvt() {
	ws.onopen = function(data){
		//소켓이 열리면 동작
	alert("환영합니다~!!\n파티룸에 입장했습니다.!\n즐거운 대화 나누세요~");
	}
	
	ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					} 
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#partyRoom").append("&nbsp;<p class='me'>" + d.userName + " :" + d.msg + "</p>");	
					}else{
						$("#partyRoom").append("&nbsp;<p class='others'>" + d.userName + " :" + d.msg + "</p>");
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

function chatName(){
	var userName = $("#userName").val();
	if(userName == null || userName.trim() == ""){
		alert("이름이 등록되지 않았습니다.\n파티룸에서 사용할 이름을 입력해주세요.~!");
		$("#userName").focus();
	}else{
		wsOpen();
		$("#yourName").hide();
		$("#yourMsg").show();
	}
}

function send() {
	var option ={
		type: "message",
		roomNumber: $("#roomNumber").val(),
		sessionId : $("#sessionId").val(),
		userName : $("#userName").val(),
		msg : $("#chatting").val()
	}
	ws.send(JSON.stringify(option))
	$('#chatting').val("");
}
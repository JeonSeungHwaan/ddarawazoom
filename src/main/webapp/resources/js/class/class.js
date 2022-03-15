function getEvent(){
	var event;
		$.ajax({
			type: "get",
			url: "/myroom/getClass", 
			dataType: "json",
			async: false, // ajax는 비동기식이기 때문에 return을 하기 못함 / 따라서 해당 코드를 추가함으로서 동기식으로 변경 후 리턴
			success: function(result){
				event = result;
			}
		});
		return event;
	}
	

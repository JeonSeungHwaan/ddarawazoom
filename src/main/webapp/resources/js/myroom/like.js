// Zoom 관심 등록
function zoomLikeWrite(number){
			
	if(window.confirm('소중한 내 관심Zoom에 담으시겠습니까?') == true){
				
		$.ajax({
			data : JSON.stringify({ zoom_num : number }),
			url : "/myroom/likeZoom_in",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			esync : false,
			success : function(data){
				if(data == 1){
					alert('소중한 내 관심Zoom에 담겼습니다.');
					if(window.confirm('관심Zoom 페이지로 이동 하시겠습니까?') == true){
						window.location='/myroom/likeZoom'
					}else{
						window.location.reload();
					}
				}
			}
		});
	}
	else{
		// They clicked no
	}
}


// Zoom 관심 해제
function zoomLikeDelete(number){
	if(window.confirm('관심 등록을 해제 하시겠습니까?') == true){
		
		$.ajax({
			data : JSON.stringify({ zoom_num : number }),
			url : "/myroom/likeZoom_out",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			esync : false,
			success : function(data){
				if(data == 1){
					alert('본 강의는 관심Zoom에서 등록 해제 되었습니다.');
					if(window.confirm('관심Zoom 페이지로 이동 하시겠습니까?') == true){
						window.location='/myroom/likeZoom'
					}else{
						window.location.reload();
					}
				}
			}
		});
	}
	else{
		// They clicked no
	}
}

// 관심Zoom 페이지에서 등록 해제 진행
function deleteLikeZoom(number){
	if(window.confirm('관심 등록을 해제 하시겠습니까?') == true){
		
		console.log(number);
		
		$.ajax({
			data : JSON.stringify({ zoom_num : number }),
			url : "/myroom/likeZoom_out",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			esync : false,
			success : function(data){
				if(data == 1){
					alert('본 강의는 관심Zoom에서 등록 해제 되었습니다.');
						window.location.reload();
				}
			}
		});
	}
	else{
		// They clicked no
	}
}

// 관리자 zoom강의 삭제
function zoomClassDelete(number){
	if(window.confirm('해당강의를 삭제 하시겠습니까?') == true){
		$.ajax({
			data : JSON.stringify({ num : number }),
			url : "/manager/zoomClassDelete",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			async : false,
			success : function(data){
				if(data == 1){
					alert('해당강의는 삭제 되었습니다.');
					window.location.reload();
				}
			}
		});
	}
}

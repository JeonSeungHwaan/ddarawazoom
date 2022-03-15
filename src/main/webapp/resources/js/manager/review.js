// 리뷰 경고
function managerReviewChange(number){
	if(window.confirm('본 리뷰가 좋지 않은 리뷰라고 판단되신다면,\n확인을 클릭하세요!') == true){
	
		$.ajax({
			data : JSON.stringify({ review_num : number }),
			url : "/manager/managerReviewChange",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			async : false,
			success : function(data){
				if(data == 1){
					alert('이 리뷰는 경고를 받았습니다.');
					window.location.reload();
				}
			}
		});
	}
}

// 리뷰 경고 취소
function managerChangeCancell(number){
	if(window.confirm('본 리뷰의 경고를 취소하시겠습니까?') == true){
		
		$.ajax({
			data : JSON.stringify({ review_num : number }),
			url : "/manager/managerChangeCancell",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			async : false,
			success : function(data){
				if(data == 1){
					alert('본 리뷰는 경고 취소를 하여 리뷰 내용 확인이 가능합니다.');
					window.location.reload();
				}
			}
		});
	}
}

// 관리자 리뷰 삭제
function managerReviewDelete(number){
	if(window.confirm('본 리뷰를 삭제 하시겠습니까?') == true){
		
		$.ajax({
			data : JSON.stringify({ review_num : number }),
			url : "/manager/managerReviewDelete",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			async : false,
			success : function(data){
				if(data == 1){
					alert('본 리뷰는 삭제 되었습니다.');
					window.location.reload();
				}
			}
		});
	}
}
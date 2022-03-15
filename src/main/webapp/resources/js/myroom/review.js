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


// 리뷰 수정
function reviewUpdate_submit(){
	if(document.review_update.grade.value==""){
		alert('작성된 평점이 없습니다.\n평점을 기입해 주세요.');
		document.review_update.grade.focus();
		return false;
	}else if(document.review_update.grade.value > 10){
		alert('작성된 리뷰가 최대 평점을 초과하였습니다.\n다시 기입 부탁드립니다.');
		document.review_update.grade.focus();
		return false;
	}else if(document.review_update.content.value==""){
		alert('작성된 리뷰가 없습니다.\n리뷰를 기입해 주세요.');
		document.review_update.content.focus();
		return false;
	}else{
		alert('리뷰 수정에 필요한 모든 정보가 기입되었습니다!');
		var updateReview = JSON.stringify($('form#updateForm').serializeObject());
	}
	
	
		$.ajax({
			data : updateReview,
			url : "/myroom/reviewUpdateData",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				var result = parseInt(data);
				
				if(result == 0){
					alert("정보가 잘못 입력되었습니다. 다시 입력해 주세요.");
					return false;
				}else{
					alert("작성하신 리뷰로 수정되었습니다!");
					window.location="/myroom/review";
				}
			}
	});
}

	
// 리뷰 삭제	
function delete_review(number){
	if(window.confirm('댓글 삭제를 원하십니까?\n댓글을 삭제하면, 복구가 되지 않습니다.') == true){
		
		$.ajax({
			data : JSON.stringify({ review_num : number }),
			url : "/myroom/reviewDelete",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			async: false,
			success : function(data){
				if(data == 1){
					alert("본 댓글은 삭제 되었습니다.");
					window.location.reload();
				}
			}
		});
	}
	else{
		//Tyey clicked no
	}
}
	
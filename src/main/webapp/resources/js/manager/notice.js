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


// 공지사항 댓글 작성
function commentWrite(){

	if(document.comment.content.value==""){
		alert('입력된 내용이 없습니다.\n댓글을 기입해 주세요.');
		document.comment.content.focus();
		return false;
	}else{
		var commentWrite = JSON.stringify($('form#commentForm').serializeObject());
	}
	
	$.ajax({
		data : commentWrite,
		url : "/ddarawazoom/commentWrite",
		type : "POST",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(data == 1){
				alert("댓글이 작성되었습니다.");
				location.reload();
			}
		}
	});
}

// 대댓글 창
function reComment(c_num){
	console.log(c_num);
	var url = "/ddarawazoom/reComment?c_num=" + c_num;
	var name = "recomment";
	var option = "width=500, height=350, left=650, top=380";
	
	window.open(url, name, option);
}

// 대댓글 작성
function reCommentPro(){
	
	if(document.recomment.content.value==""){
		alert('작성된 내용이 없습니다.\n수정하실 댓글을 기입해 주세요.');
		document.recomment.content.focus();
		return false;
	}else{
		var data = JSON.stringify($('form#recomment_Form').serializeObject());
	}
	
	$.ajax({
		data : data,
		url : "/ddarawazoom/reCommentPro",
		type : "POST",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			var result = parseInt(data);
			
			if(result == 0){
				alert("정보가 잘못 입력되었습니다. 다시 기입해 주세요.");
				return false;
			}else{
				alert("대댓글이 작성되었습니다~!");
					$('#recomment_Form').submit();
					opener.document.location.reload();
					window.close();
			}
		}
	});
}


// 공지사항 댓글 삭제
function commentDelete(c_num){
	if(window.confirm('정말로 댓글을 삭제를 원하십니까?') == true){
	
		$.ajax({
			data : { c_num : c_num },
			url : "/ddarawazoom/commentDeletePro",
			type : "POST",
			success : function(data){
				var result = parseInt(data);
				
				if(result == 1){
					alert('댓글이 삭제되었습니다.')
					window.location.reload();
					window.close();
				}
			}
		});
	} 
}	

// 공지사항 댓글 수정 페이지
function commentUpdate(c_num){
	var url = "/ddarawazoom/commentUpdate?c_num="+c_num;
	var name = "comment_update";
	var option = "width=500, height=350, left=650, top=380";
	
	window.open(url,name,option);
}

// 공지사항 댓글 수정
function commentUpdatePro(){
	
	if(document.comment_update.content.value==""){
		alert('작성된 내용이 없습니다.\n수정하실 댓글을 기입해 주세요.');
		document.comment_update.content.focus();
		return false;
	}else{
		var data = JSON.stringify($('form#comment_UpdateForm').serializeObject());
	}
	
	$.ajax({
		data : data,
		url : "/ddarawazoom/commentUpdatePro",
		type : "POST",
		contentType :  "application/json; charset=UTF-8",
		success : function(data){
			var result = parseInt(data);
			
			if(result == 0){
				alert("정보가 잘못 입력되었습니다. 다시 입력해 주세요.");
				return false;
			}else{
				alert("댓글이 수정되었습니다.");
					opener.parent.location.reload();
					window.close();
					$('#comment_UpdateForm').submit();
			}
		}
	});
}

// 공지사항 작성 페이지 유효성 검사
function notice_write(){

	var fileCheck = document.getElementById("save").value;
			
	if(document.notice_form.target_id.value==""){
		alert('공지 확인 대상이 선택되지 않았습니다.\n공지확인 대상을 선택해 주세요.');
		document.notice_form.target_id.focus();
		return false;
	}else if(document.notice_form.pin.value==""){
		alert('상단 고정 여부가 정해지지 않았습니다.\n상단고정 여부를 선택해 주세요.');
		document.notice_form.pin.focus();
		return false;
	}else if(document.notice_form.title.value==""){
		alert('제목이 작성되지 않습니다.\n제목을 작성해 주세요.');
		document.notice_form.title.focus();
		return false;
	}else if(document.notice_form.content.value==""){
		alert('작성된 내용이 없습니다.\n내용을 작성해 주세요.');
		document.notice_form.content.focus();
		return false;
	}else if(!fileCheck){
		alert('첨부된 파일이 없습니다.\n파일을 첨부해 주세요.');
		document.notice_form.save.focus();
		return false;
	}else{
		alert('모든 정보가 기입되었습니다.\n수정 작업을 진행하겠습니다.');
		notice_form.submit();
	}
}

// 공지사항 수정 페이지 유효성 검사
function notice_update(){
	var fileCheck = document.getElementById("save").value;
	
	if(document.notice_form.target_id.value==""){
		alert('공지 확인 대상이 선택되지 않았습니다.\n공지확인 대상을 선택해 주세요.');
		document.notice_form.target_id.focus();
		return false;
	}else if(document.notice_form.pin.value==""){
		alert('상단 고정 여부가 정해지지 않았습니다.\n상단고정 여부를 선택해 주세요.');
		document.notice_form.pin.focus();
		return false;
	}else if(document.notice_form.title.value==""){
		alert('제목이 작성되지 않습니다.\n제목을 작성해 주세요.');
		document.notice_form.title.focus();
		return false;
	}else if(document.notice_form.content.value==""){
		alert('작성된 내용이 없습니다.\n내용을 작성해 주세요.');
		document.notice_form.content.focus();
		return false;
	}else if(!fileCheck){
		alert('첨부한 파일이 없습니다.\n파일을 첨부해 주세요.');
		document.notice_form.save.focus();
		return false;
	}else{
		alert('모든 정보가 기입되었습니다.\n등록 작업을 진행하겠습니다.');
		notice_form.submit();
	}
}


// 관리자 댓글 경고
function commentDeletedChange(number){
	if(window.confirm('본 댓글이 해당 글과 관련이 없거나,\n좋지 않은 댓글이라고 판단되신다면,\n확인을 클릭하세요!') == true){
	
			$.ajax({
			data : JSON.stringify({ c_num : number }),
			url : "/manager/commentDeletedChange",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			async : false,
			success : function(data){
				if(data == 1){
					alert("본 댓글에 경고를 주었습니다.\n댓글에 내용을 확인하실 수 없습니다.");
					window.location.reload();
				}
			}
		});
	}
}


// 관리자 댓글 경고 취소
function commentDeletedCancell(number){
	if(window.confirm('경고를 취소 하시겠습니까?') == true){
	
			$.ajax({
			data : JSON.stringify({ c_num : number }),
			url : "/manager/commentDeletedCancell",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			async : false,
			success : function(data){
				if(data == 1){
					alert("본 댓글은 경고가 취소되었습니다.\n댓글의 내용을 확인하실 수 있습니다.");
					window.location.reload();
				}
			}
		});
	}
}

// 공지사항 리스트에서 관리자가 공지글 삭제
function noticeDelete(number){
	if(window.confirm('공지글을 삭제하시면, 복구가 되지 않습니다.\n본 공지글을 정말로 삭제 하시겠습니까?') == true){	
		
		$.ajax({
			data : JSON.stringify({num : number}),
			url : "/ddarawazoom/noticeDelete",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			async : false,
			success : function(data){
				if(data == 1){
					alert("본 공지글은 삭제되었습니다.");
					window.location.reload();
					window.location="/ddarawazoom/notice";
				}
			} 
		});
		
		}else{
		//Tyey clicked no
	}
}

// 관리자 공지사항 삭제
function managerNoticeDelete(number){
	if(window.confirm('공지글을 삭제하시면, 복구가 되지 않습니다.\n본 공지글을 정말로 삭제 하시겠습니까?') == true){
		
		$.ajax({
			data : JSON.stringify({num : number}),
			url : "/ddarawazoom/noticeDelete",
			type : "POST",
			contentType : "application/json; charset=UTF-8",
			async : false,
			success : function(data){
				if(data == 1){
					alert("본 공지글은 삭제되었습니다.");
					window.location.reload();
					window.location="/manager/notice";
				}
			} 
		});
		
		}else{
		//Tyey clicked no
	}
}

// 공지사항 검색
function valueCheck(){
	if($('#search-category').val() == ''){
		alert('카테고리를 선택해 주세요.');
		document.searchForm.category.focus();
		return false;
	}
	
	if($('#search-input').val() == ''){
		alert('검색어를 작성해 주세요.');
		document.searchForm.input.focus();
		return false;
	}
}


// 공지사항 댓글 검색
function comment_valueCheck(){
	if($('#search-commentcategory').val() == ''){
		alert('카테고리를 선택해 주세요.');
		document.searchCommentForm.category.focus();
		return false;
	}
	
	if($('#search-commentInput').val() == ''){
		alert('검색어를 작성해 주세요.');
		document.searchCommentForm.input.focus();
		return false;
	}
}

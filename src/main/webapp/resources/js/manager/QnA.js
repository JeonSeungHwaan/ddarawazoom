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

function QnAsubmit(q_num){
	if($('#title').val() == ''){
		document.getElementById('title').focus();
		return false;
	} else if($('#content').val() == ''){
		document.getElementById('content').focus();
		return false;
	}

	var QnA_form = JSON.stringify($('form#QnA_form').serializeObject());

	console.log(QnA_form)

	$.ajax({
		data : QnA_form,
		url : "/ddarawazoom/QnAWritePro",
		type : "POST",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(data == 1){
				alert("질문이 작성되었습니다.");
				window.location='/ddarawazoom/QnAContent?q_num='+q_num
			}
		}
	});
}

function qnaDelete(q_num){

	if(window.confirm('해당 질문글을 삭제하시겠습니까?')){
			$.ajax({
				data : { q_num : q_num },
				url : '/manager/deleteQnA',
				type : 'POST',
				success : function (data){
					if(data == 1){
						alert('삭제되었습니다.');
						window.location='/ddarawazoom/QnA';
					}
				}
			});
		} else {
			return false;
		}
}

function pinUpdate(q_num, pin){
	if(pin == 'yes'){
		if(window.confirm('해당 질문글을 고정하시겠습니까?')){
			$.ajax({
				data : {
					q_num : q_num,
					pin : pin
				},
				url : '/manager/pinUpdate',
				type : 'POST',
				success : function (data){
					if(data == 1){
						alert('상단에 고정되었습니다.');
						window.location='/ddarawazoom/QnA';
					}
				}
			});
		} else {
			return false;
		}
	}
	
	if(pin == 'no'){
		if(window.confirm('해당 질문글을 고정 해제하시겠습니까?')){
			$.ajax({
				data : {
					q_num : q_num,
					pin : pin
				},
				url : '/manager/pinUpdate',
				type : 'POST',
				success : function (data){
					if(data == 1){
						alert('상단에 고정되었습니다.');
						window.location='/ddarawazoom/QnA';
					}
				}
			});
		} else {
			return false;
		}
	}

}

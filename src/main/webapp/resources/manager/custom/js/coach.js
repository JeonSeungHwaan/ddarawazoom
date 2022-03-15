function coachStatus(c_id, status){
	$.ajax({
		type : 'POST',
		url : '/manager/coachStatusChange',
		data : { c_id : c_id, c_status : status},
		success : function(data){
			if(data == 1){
				alert("코치의 상태가 변경되었습니다.");
				window.location.reload();
			}
		}
	});
}

function classWarning(num){
	$.ajax({
		type : 'POST',
		url : '/manager/classWarning',
		data : { num : num },
		success : function(data){
			
		}
	});
}

function classDelete(num){
	$.ajax({
		type : 'POST',
		url : '/manager/classDelete',
		data : { num : num },
		success : function(data){
			if(data == 1){
				alert("강의가 삭제되었습니다.");
				window.location.reload();
			}
		}
	});
}

function classRestore(num){
	$.ajax({
		type : 'POST',
		url : '/manager/classRestore',
		data : { num : num },
		success : function(data){
			if(data == 1){
				alert("강의가 복구되었습니다.");
				window.location.reload();
			}
		}
	});
}


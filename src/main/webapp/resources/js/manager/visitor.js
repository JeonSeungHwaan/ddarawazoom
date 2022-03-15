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

// 날짜 검색을 통한 로그인한 회원 리스트
$(document).ready(function(){
	$('#btn').click(function(){
		
		if($('#visitDate').val() == ''){
			alert('날짜를 입력해 주세요.');
			document.visitorDate.visitDate.focus();
			return false;
		}
		
		$.ajax({
			data : { visitDate : $('#visitDate').val()},
			type : 'POST',
			dataType : 'json',
			url : '/manager/visitDate',
			success : function(data){
				console.log(data)
				if(data == ''){
					$('#visiterNull').css('display', 'block')
					$('#visitDateDiv').css('display', 'none')
				}else{
					$('#visiterNull').css('display', 'none')
					$('#visitDateDiv').css('display', 'block')
				
					var element = document.getElementById('targetArea');
					var id;
					var userType;
					var url;
					var number = 1;
					
					while( element.hasChildNodes() ) {
						element.removeChild( element.firstChild );
					}

					for(var key in data){
						if(data[key].id == null){
							id = data[key].c_id;
							userType = '<font style="color:blue;">COACH</font>';
							url = '"/manager/coachInfo?c_id='+id+'"';
						} else if(data[key].c_id == null){
							id = data[key].id
							userType = '<font style="color:red;">MEMBER</font>';
							url = '"/manager/userInfo?id='+id+'"';
						}
						
						element.innerHTML += "<tr onmouseover='this.style.background='#E6E6FA'' onmouseout='this.style.background='none'' onclick='window.location="+url+"'> <td>"+ number + "</td> <td>"+ id + "</td> <td>"+ userType + "</td> <td>" + data[key].v_date + "</td> </tr>";
						number++;
						
						console.log(element)
					}
				}
			}
		});
		
	});
});
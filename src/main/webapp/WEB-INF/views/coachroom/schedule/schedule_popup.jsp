<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="/resources/coach/custom/css/schedulePopup.css" rel="stylesheet" />
<script src="/resources/coach/custom/js/schedule.js" type="text/javascript"></script>

<script>
	function updatePopup_open(){
		window.resizeTo(650, 720);
		window.location="/coachroom/update_schedule?id=${dto.id}";
	} 
</script>

<body>
	<div class="parent-box">
		<div class="left-box">
			<h3 class="zTree-h3">일정 수정</h3>
			<button class = "custom-ok-button" type= "button" onclick="updatePopup_open();">수정</button>
		</div>
		<div class="right-box">	
			<h3 class="zTree-h3">일정 삭제</h3>
			<button class = "custom-ok-button" type= "button" onclick="deleteEvent();">삭제</button>
		</div>
	</div>
	
	<div style="text-align: center;">
		<button class = "custom-ok-button" type= "button" onclick="window.close();">취소</button>
	</div>
	
	<input type="hidden" value="${dto.id}" id="id" />
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 수정</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	$(document).ready(function(){
		//input 태그에 기본값 value를 지우지 못하게 하기위한 ajax 구문
		$("input#m_id").keydown(function(e) {
		    var oldvalue=$(this).val();
		    var field=this;
		    setTimeout(function () {
		        if(field.value.indexOf('${schedule.m_id}') !== 0) {
		            $(field).val(oldvalue);
		        } 
		    }, 1);
		});
	});
</script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link href="/resources/coach/custom/css/schedule.css" rel="stylesheet" />
<script src="/resources/coach/custom/js/schedule.js" type="text/javascript"></script>	

</head>
<body>
	
	<div class="group" id="popupGroup">
	
		<div class="group-head">
			<h1 class="zTree-h1"> 일정 수정 </h1>
		</div>
		
		<div class="group-body">
			<form id="scheduleUpdateData">
			
				<input type="hidden" value="${schedule.id}" name="id" />
				<input type="hidden" value="${schedule.c_id}" name="c_id" />
				
				<fmt:formatDate var="parseStartDate" pattern='yyyy-MM-dd' value='${schedule.start}' />
				<fmt:formatDate var="parseStartTime" pattern='hh:mm' value='${schedule.start}' />
				
				<fmt:formatDate var="parseEndDate" pattern='yyyy-MM-dd' value='${schedule.end}' />
				<fmt:formatDate var="parseEndTime" pattern='hh:mm' value='${schedule.end}' />
			
				<div class = "top">
					<input class = "subject" type="text" name="title" value="${schedule.title}" placeholder="강의 제목을 입력해주세요." />
				</div>
				
				<div class="domain">
					<h3 class = "zTree-h3"> 수강생 ID </h3>
				</div>
				<div class="domain">
					<input class="date" type="text" name="m_id" id="m_id" value="${schedule.m_id}" placeholder="수강생의 ID를 입력해주세요." />
				</div>
				
				<div class="domain">
					<h3 class = "zTree-h3"> 코치 닉네임 </h3>
				</div>
				<div class="domain">
					<input class="date" type="text" name="c_nick" value="${schedule.c_nick}" placeholder="코치님의 닉네임을 입력해주세요." />
				</div>
				
				<div class="domain">
					<h3 class = "zTree-h3"> 색상선택 </h3>
				</div>
				
				<div class="domain">
					<input type="color" class="form-control form-control-color" name="color" value="${schedule.color}">
				</div>
				
				<div class="domain">
					<h3 class = "zTree-h3">시작 날짜 / 시간</h3>
				</div>
				<div class="domain">
					<input class="date" type="date" name="start_date" value="${parseStartDate}" />
					<input class="date" type="time" name="start_time" value="${parseStartTime}" />
				</div>
				
				<div class="domain">
					<h3 class = "zTree-h3">종료 날짜 / 시간</h3>
				</div>
				<div class="domain">
					<input class="date" type="date" name="end_date" value="${parseEndDate}" />
					<input class="date" type="time" name="end_time" value="${parseEndTime}" />
				</div>
				
			</form>
			
			<button class = "ok-button" type= "button" onclick="update_ok();">확인</button>
			
		</div>
	</div>
	
</body>
</html>
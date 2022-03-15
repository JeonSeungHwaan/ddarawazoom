<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>
	<title>Chatting Room</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="../../resources/js/chat/chat_room.js" type="text/javascript"></script>
	
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
	<link href="../../resources/css/chat/chat_room.css" rel="stylesheet">
</head>
<body>
	<c:if test="${sessionScope.id == null && sessionScope.c_id == null}" >
		<script>
			alert("따라와줌 파티룸은 로그인 이후, 이용이 가능합니다.\n로그인 페이지로 이동합니다.");
			window.location="/ddarawazoom/login";
		</script>
	</c:if>
		<div id="container">
			<h1>따라와줌 파티룸</h1>
			<div id="roomContainer" class="roomContainer">
				<table id="roomList" class="roomList"></table>
			</div>
			<div class="chat-message clearfix">
				<div class="input-group">
					<input type="text" name="roomName" id="roomName" class="form-control"
					placeholder="파티룸 제목을 입력해주세요.">
					<button id="createRoom" class="btn btn-light" >방 만들기</button>
				</div>
			</div>
		</div>
</body>
</html>

<%@ include file="../layout/footer.jsp"%>
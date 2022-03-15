<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<html>
<head>
	<title>파티룸</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="../../resources/js/chat/chat.js" type="text/javascript"></script>
	
	<link href="../../resources/css/chat/chat.css" rel="stylesheet">
</head>
<body>
	<div id="container" class="container">
		<h1>${roomName} 파티룸</h1>
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" id="roomNumber" value="${roomNumber}">
		
		<div id="partyRoom" class="partyRoom">
		</div>
		
		<div id="yourName">
			<div class="chat-message clearfix">
				<div class="input-group">
					<input type="text" name="userName" class="form-control" id="userName">
					<button onclick="chatName()"  class="btn btn-light" id="startBtn">이름 등록</button>
				</div>
			</div>	
		</div>
		
		<div id="yourMsg">
			<div class="chat-message clearfix">
				<div class="input-group">
					<input id="chatting" class="form-control" placeholder="보내실 메시지를 입력하세요.">
					<button onclick="send()"  class="btn btn-light" id="sendBtn">보내기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<%@ include file="../layout/footer.jsp"%>
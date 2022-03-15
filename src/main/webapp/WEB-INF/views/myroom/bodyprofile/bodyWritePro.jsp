<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:if test="${result ==1}">
	<script>
		alert("멤버님의 바디프로필 등록이 완료되었습니다.\nDDarawaZoom만의 실시간 화면으로 확인해 보세요~\n감사합니다^_^");
		window.location="/myroom/bodyprofile";
	</script>
</c:if>

<c:if test="${result != 1}">
	<script>
		alert("입력이 잘못 되었습니다. 다시 확인해주세요.");
		history.go(-1);
	</script>
</c:if>
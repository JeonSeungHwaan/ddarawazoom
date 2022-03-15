<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:if test="${result == 1}">
	<script>
		alert("마이프로필 수정작업이 완료되었습니다.");
		window.location="/myroom/bodyprofile";
	</script>
</c:if>

<c:if test="${result != 1}">
	<script>
		alert("입력이 잘못 되었습니다. 다시 확인해주세요.");
		history.go(-1);
	</script>
</c:if>
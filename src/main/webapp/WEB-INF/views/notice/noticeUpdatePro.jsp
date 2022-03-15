<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:if test="${result == 1}">
	<script>
		alert("공지사항이 수정되었습니다.");
		window.location="/ddarawazoom/noticeContent?num=${num}";
	</script>
</c:if>

<c:if test="${result != 1}">
	<script>s
		alert("입력이 잘못 되었습니다. 다시 확인해주세요.");
		history.go(-1);
	</script>
</c:if>
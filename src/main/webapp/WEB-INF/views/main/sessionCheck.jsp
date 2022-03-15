<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="coach" value="${sessionScope.c_id}" />
<c:set var="member" value="${sessionScope.id}" />

<c:if test="${member != null && coach == null}">
	<script>
		alert("코치 회원만 이용가능합니다.");
		window.location="/ddarawazoom";
	</script>
</c:if>

<c:if test="${member == null && coach != null}">
	<script>
		alert("일반 회원만 이용가능합니다.");
		window.location="/ddarawazoom";
	</script>
</c:if>

<c:if test="${member == null && coach == null}">
	<script>
		alert("로그인 후 이용가능합니다.");
		window.location="/ddarawazoom";
	</script>
</c:if>
	
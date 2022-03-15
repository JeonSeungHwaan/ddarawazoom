<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="admin" value="${sessionScope.admin}" />

<c:if test="${admin == null}">
	<script>
		alert("관리자만 접근 가능합니다.");
		window.location="/ddarawazoom";
	</script>
</c:if>	
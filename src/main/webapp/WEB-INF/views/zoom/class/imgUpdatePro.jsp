<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<c:if test="${result == 1}">
	<script>
	   	alert("이미지 수정 완료");
	   	window.location="/ddarawazoom/zclasscontent?num=${num}";
	</script>
</c:if>
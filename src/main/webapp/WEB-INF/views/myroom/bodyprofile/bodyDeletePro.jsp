<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!-- 팝업창 닫히고, 새로고침 -->
<c:if test="${result == 1}">
	<script>
		alert("본 바디 프로필이 삭제되었습니다.\n새로운 바디프로필을 등록하고 싶으시면,\n오늘하루 바디 기록하기를 클릭해주세요.");
		opener.parent.location.reload();
		window.close();
	</script>
</c:if>

<c:if test="${result != 1}">
	<script>
		alert("입력이 잘못 되었습니다. 다시 확인해주세요.");
		history.go(-1);
	</script>
</c:if>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 회원가입을 눌렀을 경우 db에 값이 저장된다 --%>
<c:if test="${result == 1 }">
	<script>
		alert('로그인 성공')
		window.location="/ddarawazoom"
	</script>
</c:if>


<c:if test="${result != 1 }">
	<script>
		alert('로그인 실패')
		window.location="/ddarawazoom/login"
	</script>
</c:if>



<script>
	function findid();
	window.location="/main/findidpw/findid"
	
	
</script>


<script>
	function findpw();
	window.location="/main/findidpw/findpw"
</script>





세션을 가지고 있는 jsp 페이지를 만든다...??
   
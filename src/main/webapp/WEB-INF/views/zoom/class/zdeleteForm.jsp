<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>   

<h4 align="center"><font color="red">No.${num}</font>의 강의&nbsp;<font color="red">${zoom.title}</font>을/를 정말 삭제하시겠습니까?</h4><br />

<form name="zdeleteForm" action="/ddarawazoom/zdeletePro" method="post" align="center">
	<input type="hidden" name="num" value="${num}" />
	<input type="submit" value="삭제하기">&nbsp;&nbsp;
	<input type="button" value="뒤로가기" onclick="document.location.href='/ddarawazoom/zclasscontent?num=${num}'">
	<br />
	<br />
</form>

<%@ include file="../../layout/footer.jsp"%> 
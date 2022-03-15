<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

$(document).ready(function(){
	if('${sessionScope.id}' == '' && '${sessionScope.c_id}' == '' && '${sessionScope.admin}' == ''){
		alert("Q&A 작성은 로그인 후 가능합니다.")
		window.location='/ddarawazoom/login'
	}
	
	// input 태그에 기본값 value를 지우지 못하게 하기위한 ajax 구문
	$("input").keydown(function(e) {
	    var oldvalue=$(this).val();
	    var field=this;
	    setTimeout(function () {
	        if(field.value.indexOf('[답변] ') !== 0) {
	            $(field).val(oldvalue);
	        } 
	    }, 1);
	});
	
});

</script>

<html>
<head>
	<title>Q&A 작성 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/manager/QnA.js" type="text/javascript"></script>
	
	<link href="../../resources/css/manager/notice.css" rel="stylesheet">
	<link href="/resources/coach/custom/css/form-validation.css" rel="stylesheet">
</head>
<body>
	<div class="container">
	    <div class="row">
	        <div class="col-lg-12">
	            <h3 class="text-dark">Q&A 작성 페이지&nbsp;<img src="../../resources/image/Exercise.svg" class="notice_img" ></h3>
	        </div>
	    </div>
	    <%-- 페이지 이동을 막기위한 iframe 선언 --%>
	    <iframe name="iframe1" style="display: none;"></iframe>
	    <div class="row">
	        <div class="col-lg-12">
	            <div class="job-detail mt-2 p-4">
	                <div class="custom-form">
	                	<form class="needs-validation" id="QnA_form" novalidate target="iframe1">
	                        <div class="row">
	                            <div class="col-md-4">
	                                <div class="form-group app-label">
	                                    <label for="writer_id" class="text-muted">작 성 자</label><br/>
	                                    <c:if test="${sessionScope.id != null}">
	                                    	<input type="hidden" name="writer" value="${userInfo.nick}" />
	                                    	${userInfo.nick} 님
	                                    </c:if>
	                                    <c:if test="${sessionScope.c_id != null}">
	                                    	<input type="hidden" name="writer" value="${coachInfo.c_nick}" />
	                                    	${coachInfo.c_nick} 님
	                                    </c:if>
	                                    <c:if test="${sessionScope.admin != null}">
	                                    	<input type="hidden" name="writer" value="${sessionScope.admin}" />
	                                    	${sessionScope.admin} 님
	                                    </c:if>
	                                </div>
	                            </div>
	                            <div class="col-md-12">
	                                <div class="form-group app-label">
	                                    <c:if test="${sessionScope.admin == null}">
	                                    	<input id="university/college" type="text" id="title" name="title" class="form-control resume" placeholder="제목을 기입해 주세요." required />
	                                    </c:if>
	                                    <c:if test="${sessionScope.admin != null}">
	                                    	<input id="university/college" type="text" id="title" name="title" class="form-control resume" value="[답변] " required />
	                                    </c:if>
	                                </div>
	                                <div class="invalid-feedback">
					                  제목은 필수항목입니다.
					                </div>
	                            </div>
	                             <div class="col-lg-12">
	                                <div class="form-group app-label">
	                                    <textarea rows="15" id="content" name="content" class="form-control resume" style="resize: none;" placeholder="작성 내용을 기입해 주세요." required></textarea>
	                                </div>
	                                <div class="invalid-feedback">
					                  내용은 필수항목입니다.
					                </div>
	                            </div>
	                        </div>
	                         <div class="col-lg-12">
	                          	<div class="text-center">
	                          		<c:if test="${q_num != null}">
	                          			<input type="hidden" value="${q_num}" name="q_num" />
	                          		</c:if>
	                          		<c:if test="${q_num == null}">
	                          			<input type="hidden" value="0" name="q_num" />
	                          		</c:if>
	                          		<input type="submit" class="btn btn-outline-primary" value="작성 하기" onclick="QnAsubmit('${content.q_num}');" />
	                          			&nbsp;
	                          		<input type="reset" class="btn btn-outline-primary" value="다시 작성하기" />
										&nbsp;
									<input type="button" class="btn btn-outline-secondary" value="Q&A 페이지로 이동하기" onClick="javascript:window.location='/ddarawazoom/QnA'" />
	                        	</div>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
</body>
</html>

<script src="/resources/coach/custom/js/form-validation.js"></script>

<%@ include file="../../layout/footer.jsp"%>
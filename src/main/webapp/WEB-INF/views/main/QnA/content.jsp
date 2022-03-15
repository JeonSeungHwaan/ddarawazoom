<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title>Q&A 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/manager/QnA.js?ver=12" type="text/javascript"></script>
	
	<link href="../../resources/css/manager/notice.css" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
</head>
<body>
	
	<div class="container">
	    <div class="row">
	        <div class="col-lg-12">
	            <h3 class="text-dark">Q&A 페이지&nbsp;<img src="../../resources/image/Exercise.svg" class="notis_img" ></h3>
	        </div>
	    </div>
	    <c:forEach items="#{content}" var="content">
	    <div class="row">
	        <div class="col-lg-12">
	            <div class="job-detail mt-2 p-4">
	                <div class="custom-form">
	                	<form class="needs-validation" method="post" action="/ddarawazoom/noticeWritePro" enctype="multipart/form-data">
	                        <div class="row">
	                            <div class="col-md-4">
	                                <div class="form-group app-label">
	                                	<c:if test="${content.writer != 'admin'}">
	                                   		
	                                   		${content.writer} 님
	                                   	</c:if>
	                                   	<c:if test="${content.writer == 'admin'}">
	                                   		[ 답변 ]
	                                   		<label for="writer_id" class="text-muted">작 성 자 : </label>
	                                   		${content.writer} 님
	                                   	</c:if>
	                                </div>
	                            </div>
	                            
	                            <div class="col-md-4">
	                                <div class="form-group app-label">
	                                   	<b>제목 :</b> ${content.title}
	                                </div>
	                            </div>
	                            
	                            <div class="col-md-4">
	                                <div class="form-group app-label" style="float: right;">
	                                    <label for="taget_id" class="text-muted">조 회 수 : </label>
	                                    ${content.readcount}
	                                </div>
	                            </div>
	                            	                            
	                            <hr class="my-4">
	                            
	                             <div class="col-lg-12">
	                                <div class="form-group app-label">
	                                	<div style="white-space:pre; margin-top:30px;"><c:out value="${content.content}" /></div>
	                                </div>
	                            </div>
	                            
	                         </div>
	                         
	                         <c:if test ="${sessionScope.admin != null && content.status == '답변 대기' && content.writer != admin}">
	                         <hr class="my-4">
	                         
	                         <div class="col-lg-12">
	                          	<div class="text-center">
		                          	<input type="button" class="btn btn-outline-primary" onclick="window.location='/ddarawazoom/QnAWrite?q_num=${content.q_num}'" value="[답변하기]" />
		                          		&nbsp;
		                          	<input type="button" class="btn btn-outline-primary" onclick="qnaDelete(${content.q_num})" value="[삭제하기]" /><br/>
	                        	</div>
	                        </div>
	                        </c:if>
	                        
	                        <c:if test="${sessionScope.admin != null}">
		                        <c:if test="${content.status != '답변 대기' && content.pin == 'no'}">
		                        	<input type="button" class="btn btn-outline-secondary" onclick="pinUpdate(${content.q_num}, 'yes')" value="답변 상단 고정"/>
		                        </c:if>
		                        
		                        <c:if test="${content.status != '답변 대기' && content.pin == 'yes'}">
		                        	<input type="button" class="btn btn-outline-secondary" onclick="pinUpdate(${content.q_num}, 'no')" value="답변 상단 고정 해제"/>
		                        </c:if>
	                        </c:if>
	                        
	                        <c:if test="${content.status == '답변 대기'}">
	                        <div class="col-lg-12">
	                          	<div class="text-center">
	                          		<input type="button" class="btn btn-outline-secondary" onclick="javascript:window.location='/ddarawazoom/QnA'" value="- Q&A 페이지로 돌아가기 -"/>
	                        	</div>
	                        </div>
	                        </c:if>
	                        
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
	    </c:forEach>
    </div>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>
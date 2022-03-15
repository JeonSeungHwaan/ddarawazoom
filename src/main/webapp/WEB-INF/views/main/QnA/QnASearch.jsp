<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title>Q&A 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/manager/QnA.js" type="text/javascript" ></script>
	
	<link href="../../resources/css/manager/notice.css" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
</head>
<body>
	<div class="container">
    	<div class="row">
	        <div class="col-xl-12">
	            <div class="card">
	                <div class="card-body">
	                    <h5 class="header-title pb-3 mt-0">Q&A</h5>
	                    <div class="table-responsive">
	                    	<c:if test="${sessionScope.admin != null}">
	                    		<input type="button" class="btn btn-outline-secondary" id="notice_button" onclick="window.location='/manager/QnA'" value="[Q&A 관리자 페이지 이동]">
	                    	</c:if>
	                    	<c:if test="${sessionScope.id != null || sessionScope.c_id != null}">
	                    		<input type="button" class="btn btn-outline-secondary" id="notice_button" onclick="window.location='/ddarawazoom/QnAWrite?q_num=0'" value="[Q&A 질문하기]">
	                    	</c:if>
	                    	<c:if test="${count == 0}">
	                    		<table class="table table-hover mb-0" id="boardtable">
	                            <thead>
	                                <tr class="align-self-center">
	                                    <th></th>
	                                </tr>
	                            </thead>
		                            <tbody>
		                                <tr>
		                                    <td>
		                                    	작성된 Q&A가 없습니다.
		                                    </td>
		                                </tr>
		                            </tbody>
	                        	</table>
	                    	</c:if>
	                    	
	                    <c:if test="${count > 0}">
	                        <table class="table table-hover mb-0" id="boardtable">
	                            <thead>
	                                <tr class="align-self-center">
	                                    <th>글 번호</th>
	                                    <th>제 목</th>
	                                    <th>작 성 자</th>
	                                    <th>작 성 일</th>
	                                    <th>조 회 수</th>
	                                    <th>답변 여부</th>
	                                </tr>
	                            </thead>
	                            <c:forEach var="qnaList" items="${qnaList}">
		                            <tbody onclick="window.location='/ddarawazoom/qnaRcUp?q_num=${qnaList.q_num}'">
		                                <tr>
		                                    <td>
		                                    	<c:if test="${qnaList.pin == 'yes'}">
		                                    		<i class="fas fa-grin-stars" style="font-size:20px; color:red;">★</i>
		                                    	</c:if>
		                                    	<c:if test="${qnaList.pin == 'no'}">
		                                    		<c:set var="number" value="${number + 1}"/>
		                                    		${number}
		                                    	</c:if>
		                                    </td>
		                                    <td>${qnaList.title}</td>
		                                    <td>${qnaList.writer}</td>
		                                    <td>
												<fmt:formatDate var="qnaList_regdate" pattern="yyyy-MM-dd HH:mm" value="${qnaList.regdate}" />
												 ${qnaList_regdate}
											</td>
		                                    <td>${qnaList.readcount}</td>
		                                    <td>
		                                    	<c:if test="${qnaList.status == '답변 대기'}">
		                                    		<font color="red">${qnaList.status}</font>
		                                    	</c:if>
		                                    	<c:if test="${qnaList.status == '답변 완료'}">
		                                    		<font color="green">${qnaList.status}</font>
		                                    	</c:if>
		                                    </td>
		                                </tr>
		                            </tbody>
	                              </c:forEach>
	                        	</table>
	                        </c:if>
	                        
	                        </div>
		                </div>
		            </div>
 						<div style="width: 50%; text-align:center; margin: 0 auto;">
		                  <form action="/ddarawazoom/QnASearch" method="post" name="searchForm" onsubmit="return valueCheck()">
							  <div class="input-group mb-3">
							    <select class="form-select form-select-sm" id="search-category" name="category" style="width: 25%;">
							      <option selected value="">선 택</option>
							      <option value="title">제 목</option>
							      <option value="content">내 용</option>
							      <option value="writer">작성자</option>
							    </select>
						    <input type="text" class="form-control" placeholder="검색어를 입력하세요" style="width: 60%;" id="search-input" name="input">
						    <button class="btn btn-outline-secondary" type="submit" id="search-btn" style="width: 15%;">검색</button>
						  </div>
						</form>
					 </div>
				</div>
		    </div>
		</div>
	 <div id="page">
		<c:if test="${pageCount > 0}">
			페이지&nbsp;
			<c:if test="${startPage > 10}">
				<a href="/ddarawazoom/QnASearch?pageNum=${startPage - 10}&category=${category}&input=${input}"> [이전] </a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="/ddarawazoom/QnASearch?pageNum=${i}&category=${category}&input=${input}">${i}</a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a href="/ddarawazoom/QnASearch?pageNum=${startPage + 10}&category=${category}&input=${input}"> [다음] </a>
			</c:if>
		</c:if>	
	 </div>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>
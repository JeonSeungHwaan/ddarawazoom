<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<html>
<head>
	<title>공지사항 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/manager/notice.js" type="text/javascript" ></script>
	
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
	                    <h5 class="header-title pb-3 mt-0">NOTICE</h5>
	                    <div class="table-responsive">
	                    	<c:if test="${sessionScope.admin != null}">
	                    		<input type="button" class="btn btn-default" id="notice_button" onclick="window.location='/manager/notice'" value="[공지사항 관리자 페이지 이동]">
	                    	</c:if>
	                    	<c:if test="${noticeList == null}">
	                    		
	                    	</c:if>
	                    	
	                        <table class="table table-hover mb-0" id="boardtable">
	                            <thead>
	                                <tr class="align-self-center">
	                                    <th>글 번호</th>
	                                    <th>제 목</th>
	                                    <th>작 성 자</th>
	                                    <th>대 상</th>
	                                    <th>작 성 일</th>
	                                    <th>조 회 수</th>
	                                    <th>첨부 파일</th>
	                                    <c:if test="${sessionScope.admin != null}">
	                                    	<th>버 튼</th>
	                                    </c:if>
	                                </tr>
	                            </thead>
	                            <c:forEach var="noticeList" items="${noticeList}">
		                            <tbody>
		                                <tr>
		                                    <td>
		                                    	<c:if test="${noticeList.pin eq 'yes' }">
		                                    		<i class="fas fa-grin-stars" style="font-size:20px; color:red;">★</i>
		                                    	</c:if>
		                                    	<c:if test="${noticeList.pin eq 'no' }">
		                                    		<c:set var="number" value="${number + 1}"/>
		                                    		${number}
		                                    	</c:if>
		                                    </td>
		                                    <td>
		                                    	<c:if test="${sessionScope.id eq 'admin'}">
		                                    		<a href="/ddarawazoom/noticeViewCount?num=${noticeList.num}&pageNum=${pageNum}">
		                                    			${noticeList.title}
		                                    		</a>
		                                    	</c:if>
		                  						<c:if test="${sessionScope.id ne 'admin' && noticeList.target_id eq 'All'}">
		                                    		<a href="/ddarawazoom/noticeViewCount?num=${noticeList.num}&pageNum=${pageNum}">
		                                    			${noticeList.title}
		                                    		</a>
	                                    		</c:if>
	                                    		<c:if test="${not empty sessionScope.c_id && noticeList.target_id eq 'Coach' && sessionScope.id ne 'admin'}">
		                                    		<a href="/ddarawazoom/noticeViewCount?num=${noticeList.num}&pageNum=${pageNum}">
		                                    			${noticeList.title}
		                                    		</a>
	                                    		</c:if>
	                                    		<c:if test="${not empty sessionScope.id && noticeList.target_id eq 'Member' && sessionScope.id ne 'admin'}">
		                                    		<a href="/ddarawazoom/noticeViewCount?num=${noticeList.num}&pageNum=${pageNum}">
		                                    			${noticeList.title}
		                                    		</a>
	                                    		</c:if>
		                                    </td>
		                                    <td>${noticeList.writer_id}</td>
		                                    <td>
	                                    		<c:if test="${noticeList.target_id eq 'All'}">
	                                    			<i class="fa fa-users icon2"></i>&nbsp;${noticeList.target_id}
	                                    		</c:if>
	                                    		<c:if test="${noticeList.target_id eq 'Coach'}">
	                                    			<i class="fa fa-user icon3" style="color: skyblue;"></i>&nbsp;${noticeList.target_id}
	                                    		</c:if>
	                                    		<c:if test="${noticeList.target_id eq 'Member'}">
	                                    			<i class="fa fa-user icon3" style="color: pink;"></i>&nbsp;${noticeList.target_id}
	                                    		</c:if>
		                                    </td>
		                                    <td>
												<fmt:formatDate var="notice_regdate" pattern="yyyy-MM-dd HH:mm" value="${noticeList.regdate}" />
												 ${notice_regdate}
											</td>
		                                    <td>${noticeList.viewcnt}</td>
		                                    <td>
		                                    	<c:if test="${noticeList.img != null}">	
		                                    		<i class="fa fa-picture-o icon5"></i>
		                                    	</c:if>
		                                    </td>
		                                    <c:if test="${sessionScope.admin != null}">
			                                    <td>
			                                    	<input type="button" class="btn btn-outline-black" onclick="window.location='/ddarawazoom/noticeUpdate?num=${noticeList.num}'" value="수정"/>
			                                    	<input type="button" class="btn btn-outline-black" onclick="noticeDelete(${noticeList.num});" value="삭 제"/>
			                                    </td>
		                                    </c:if>
		                                </tr>
		                            </tbody>
	                              </c:forEach>
	                        	</table>
	                        </div>
		                </div>
		            </div>
 						<div style="width: 50%; text-align:center; margin: 0 auto;">
		                  <form action="/ddarawazoom/searchNoticeList" method="post" onsubmit="return valueCheck()">
							  <div class="input-group mb-3">
							    <select class="form-select form-select-sm" id="search-category" name="category" style="width: 25%;">
							      <option selected value="">선 택</option>
							      <option value="title">제 목</option>
							      <option value="content">내 용</option>
							      <option value="target_id">대 상</option>
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
					<a href="/manager/searchNoticeList?category=${category}&input=${input}&pageNum=${startPage - 10}"> [이전] </a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="/manager/searchNoticeList?category=${category}&input=${input}&pageNum=${i}">${i}</a>
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					<a href="/manager/searchNoticeList?category=${category}&input=${input}&pageNum=${startPage + 10}"> [다음] </a>
				</c:if>
			</c:if>	
		</div>
</body>
</html>

<%@ include file="../layout/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title>공지사항 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/manager/notice.js" type="text/javascript"></script>
	
	<link href="../../resources/css/manager/notice.css" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
</head>
<body>
	<div class="container">
	    <div class="row">
	        <div class="col-lg-12">
	            <h3 class="text-dark">Notice Content 페이지&nbsp;<img src="../../resources/image/Exercise.svg" class="notis_img" ></h3>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-lg-12">
	            <div class="job-detail mt-2 p-4">
	                <div class="row">
	                    <div class="col-lg-12">
	                    </div>
	                </div>
	                <div class="custom-form">
	                	<form class="needs-validation" method="post" action="/ddarawazoom/noticeWritePro" enctype="multipart/form-data">
	                        <div class="row">
	                            <div class="col-md-4">
	                                <div class="form-group app-label">
	                                    <label for="writer_id" class="text-muted">작 성 자 : </label>
	                                   	${noticeDTO.writer_id} 님
	                                </div>
	                            </div>
	                            <div class="col-md-4">
	                                <div class="form-group app-label">
	                                    <label for="taget_id" class="text-muted">공지 확인 대상 : </label>
	                                    ${noticeDTO.target_id}
	                                </div>
	                            </div>
	                            <div class="col-md-4">
	                                <div class="form-group app-label">
	                                    <label for="taget_id" class="text-muted">조 회 수 : </label>
	                                    ${noticeDTO.viewcnt}
	                                </div>
	                            </div>
	                            <div class="col-md-12">
	                                <div class="form-group app-label">
	                                   	<b>제목 :</b> ${noticeDTO.title}
	                                </div>
	                            </div>
	                             <div class="col-lg-12">
	                                <div class="form-group app-label">
	                                	<div style="white-space:pre; margin-top:30px;"><c:out value="${noticeDTO.content}" /></div>
	                                </div>
	                            </div>
	                            <div class="col-md-12">
	                             	<img src="../../resources/image/upload/${noticeDTO.img}" alt="img">
	                            </div>
	                        </div>
	                         <div class="col-lg-12">
	                          	<div class="text-center">
	                          		<c:if test ="${sessionScope.admin != null}">
		                          		<input type="button" class="btn btn-outline-black" onclick="window.location='/ddarawazoom/noticeUpdate?num=${noticeDTO.num}'" value="[수정 페이지 이동]"/>
		                          			&nbsp;
		                          		<input type="button" class="btn btn-outline-black" onclick="noticeDelete(${noticeDTO.num})" value="[삭제하기]"/>
		                          			&nbsp;
		                          		<input type="button" class="btn btn-outline-black" onclick="window.location='/manager/notice'" value="[관리자 페이지로 이동]"/><br/>
	                          		</c:if>
									<input type="button" class="btn btn-outline-black"  onclick="javascript:window.location='/ddarawazoom/notice'" value="- 공지사항 페이지로 돌아가기 -"/>
	                        	</div>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
		<div class="container">
			<c:if test="${notice_CList == null}" >
	    		<div class="text-center m-3"><h5>[ 작성된 댓글이 없습니다. ] </h5></div>
	    	</c:if>
			<div class="be-comment-block">
				<c:if test="${notice_CList  != null}" >
					<h1 class="comments-title">Comments</h1>
					<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">작성자</th>
					      <th scope="col">내용</th>
					      <th scope="col" style="width: 40%;">작성 날짜</th>
					    </tr>
					  </thead>
					  <tbody>
					   <c:forEach var="notice_CList" items="${notice_CList}">
					    <tr>
					      <td>
					      	<c:if test="${notice_CList.re_level > 0}">
					      		<c:forEach var="i" begin="0" end="${notice_CList.re_level}" step="1">
					      			&nbsp;&nbsp;&nbsp;&nbsp;
								</c:forEach>
								<img src="../../resources/image/upload/re.gif" alt="recomment" width="30px" height="15px">
					      	</c:if>
					      	${notice_CList.writer_id}
					      </td>
					      <td class="comment_content">
					        <c:if test="${notice_CList.deleted eq  'all'}">
								<font style="color: red;">
									<b>[<i class="fas fa-dizzy"></i> 경고!]</b> ${notice_CList.writer_id}님께서 작성하신 댓글은<b><br/>
									"댓글 관리 기준"</b>을 위반하여 관리자에 의해 삭제되었습니다.
								</font>
							</c:if>
							<c:if test="${notice_CList.deleted eq  'yes'}">
								<font style="color: blue; ">${notice_CList.writer_id}님께서 직접 삭제한 댓글 입니다.</font>
							</c:if>
							<c:if test="${notice_CList.deleted ne  'yes' && notice_CList.deleted ne  'all' }">
								${notice_CList.content}
							</c:if>
						  </td>
					      <td><span class="be-comment-time">
								<i class="fa fa-clock-o">작성 날짜 : </i>
								<fmt:formatDate var="notice_regdate" pattern="yyyy-MM-dd HH:mm" value="${notice_CList.regdate}" />
									${notice_regdate}
									&nbsp;	
									<c:if test="${notice_CList.writer_id == userInfo.nick && notice_CList.deleted eq 'no'}">
										<input type="button" class="btn btn-outline-black" onclick="commentUpdate(${notice_CList.c_num});" value="수정"/>
										<input type="button" class="btn btn-outline-black" onclick="commentDelete(${notice_CList.c_num});" value="삭제"/>
									</c:if>
									<c:if test="${notice_CList.writer_id == coachInfo.c_nick && notice_CList.deleted eq 'no'}">
										<input type="button" class="btn btn-outline-black" onclick="commentUpdate(${notice_CList.c_num});" value="수정"/>
										<input type="button" class="btn btn-outline-black" onclick="commentDelete(${notice_CList.c_num});" value="삭제"/>
									</c:if>
									<c:if test ="${sessionScope.admin != null && notice_CList.deleted eq 'no'}">
										<input type="button" class="btn btn-outline-black" onclick="reComment(${notice_CList.c_num});" value="답글"/>
										<input type="button" class="btn btn-outline-black" onclick="commentDeletedChange(${notice_CList.c_num});" value="경고"/>
										<input type="button" class="btn btn-outline-black" onclick="commentDelete(${notice_CList.c_num});" value="삭제"/>
									</c:if>
									<c:if test ="${sessionScope.admin != null && notice_CList.deleted eq 'all'}">
										<input type="button" class="btn btn-outline-black" onclick="commentDeletedCancell(${commentList.c_num});" value="경고취소"/>
										<input type="button" class="btn btn-outline-black" onclick="commentDelete(${notice_CList.c_num});" value="삭제"/>
									</c:if>
								</span>
							</td>
					    </tr>
					  </c:forEach>
					  </tbody>
					</table>
				</c:if>
				<c:if test="${sessionScope.id != null || sessionScope.c_id != null || sessionScope.admin != null}">
					<form class="form-block" id="commentForm"  name="comment" action="/ddarawazoom/noticeContent" onsubmit="commentWrite(); return false;" method="post">
						<input type="hidden" name="num" value="${noticeDTO.num}" />
						<div class="row">
							<div class="col-xs-12 col-sm-6">
								<div class="form-group fl_icon">
									<c:set var="writer_id" />
									<c:if test="${sessionScope.id != null && userInfo != null}">
										<c:set var="writer_id" value="${userInfo.nick}" />
										${writer_id}
									</c:if>
									<c:if test="${sessionScope.c_id != null && coachInfo != null}">
										<c:set var="writer_id" value="${coachInfo.c_nick}" />
										${writer_id}
									</c:if>
									<c:if test="${sessionScope.admin != null}">
										<c:set var="writer_id" value="${sessionScope.admin}" />
										${writer_id}
									</c:if>
									<input type="hidden" value="${writer_id}" name="writer_id" />
								</div>
							</div>
							<div class="col-xs-12">									
								<div class="form-group">
									<textarea class="form-control" id="content" name="content" placeholder="댓글을 기입해 주세요." ></textarea>
								</div>
							</div>
							<input type="submit" class="btn btn-black" value="댓글 작성" />
						</div>
					</form>
				</c:if>
			</div>
		</div>
		<div id="page">
			<c:if test="${pageCount > 0}">
				페이지&nbsp;
				<c:if test="${startPage > 10}">
					<a href="/ddarawazoom/noticeContent?num =${noticeDTO.num}&pageNum=${startPage - 10}"> [이전] </a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="/ddarawazoom/noticeContent?num =${noticeDTO.num}&pageNum=${i}">${i}</a>
				</c:forEach>
				<c:if test="${endPage < pageCount}">
					<a href="/ddarawazoom/noticeContent?num =${noticeDTO.num}&pageNum=${startPage + 10}"> [다음] </a>
				</c:if>
			</c:if>	
		</div>
</body>
</html>

<%@ include file="../layout/footer.jsp"%>
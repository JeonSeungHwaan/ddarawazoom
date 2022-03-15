<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<html>
<head>
	<title>공지사항 작성 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/manager/notice.js" type="text/javascript"></script>
	
	<link href="../../resources/css/manager/notice.css" rel="stylesheet">
</head>
<body>
	<div class="container">
	    <div class="row">
	        <div class="col-lg-12">
	            <h3 class="text-dark">Notice Write 페이지&nbsp;<img src="../../resources/image/Exercise.svg" class="notice_img" ></h3>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-lg-12">
	            <div class="job-detail mt-2 p-4">
	                <div class="custom-form">
	                	<form class="needs-validation" method="post" name="notice_form" action="/ddarawazoom/noticeWritePro" onsubmit="return notice_write();" enctype="multipart/form-data">
	                        <div class="row">
	                            <div class="col-md-4">
	                                <div class="form-group app-label">
	                                    <label for="writer_id" class="text-muted">작 성 자</label><br/>
	                                    <input type="hidden" name="writer_id" value="${sessionScope.admin}" />
	                                     ${sessionScope.admin}
	                                </div>
	                            </div>
	                            <div class="col-md-4">
	                                <div class="form-group app-label">
	                                    <label for="taget_id" class="text-muted">공지 확인 대상</label>
	                                    <div class="form-button">
	                                        <select class="nice-select" name="target_id" id="target_id">
	                                            <option value="All">All</option>
	                                            <option value="Coach">Coach</option>
	                                            <option value="Member">Member</option>
	                                        </select>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-md-4">
	                                <div class="form-group app-label">
	                                    <label for="marital-status" class="text-muted">상단고정 여부</label>
	                                    <div class="form-button">
	                                        <select class="nice-select" name="pin" id="pin" >
	                                        	<option value="no">no</option>
	                                            <option value="yes">yes</option>
	                                        </select>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-md-12">
	                                <div class="form-group app-label">
	                                    <input id="university/college" type="text" id="title" name="title" class="form-control resume" placeholder="제목을 기입해 주세요." />
	                                </div>
	                            </div>
	                             <div class="col-lg-12">
	                                <div class="form-group app-label">
	                                    <textarea rows="15" id="content" name="content" class="form-control resume" style="resize: none;" placeholder="작성 내용을 기입해 주세요." ></textarea>
	                                </div>
	                            </div>
	                            <div class="col-md-12">
	                             	<label for="img" class="text-muted">파일 첨부</label>
	  								<input class="form-control" type="file" id="save" name="save" />
	                            </div>
	                        </div>
	                         <div class="col-lg-12">
	                          	<div class="text-center">
	                          		<input type="submit" class="btn btn-outline-black" value="작성 하기" />
	                          			&nbsp;
	                          		<input type="reset" class="btn btn-outline-black" value="다시 작성하기" />
										&nbsp;
									<input type="button" class="btn btn-outline-black" value="공지사항 페이지로 이동하기" onClick="javascript:window.location='/ddarawazoom/notice'" />
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
<%@ include file="../layout/footer.jsp"%>
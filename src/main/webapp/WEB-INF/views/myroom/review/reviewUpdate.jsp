<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
    
<html>
<head>
	<title>Review 수정 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/myroom/review.js" type="text/javascript"></script>
	
	<link href="../../resources/css/myroom/myRoom.css" rel="stylesheet">
</head>
<body>
	<div class="container">
	  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	    <div class="row g-5">
	      <div class="col-md-7 col-lg-8">
	      	<div class="review_title">
	        	<h4>작성한 리뷰를 수정 할 수 있는 공간</h4>
	        </div>
	        <form class="needs-validation"  id="updateForm" name="review_update" action="/myroom/review" method="post">
	        	<input type="hidden" name="review_num" value="${review.review_num}" /> 
	          <div class="row g-3">
					<div class="col-12">
						<label for="grade" class="form-label">
							<b>강의 명</b>
						</label>
						<div class="input-group has validation">
							${review.title}
						</div>
					</div>
					<div class="col-12">
						<label for="grade" class="form-label">
							<b>평 점</b> [최대 평점: 10점 <font style="color:red;">(초과 불가)</font>]
						</label>
						<div class="input-group has validation">
							<input type="text" id="grade" name="grade" class="form-control" value="${review.grade}" autofocus="autofocus"/>
						</div>
					</div>
		            <div class="col-12">
						<label for="content" class="form-label">
							<b>작성 내용</b>
						</label>
						<div class="input-group has validation">
							<textarea rows="5" cols="20" name="content" class="form-control" >${review.content}</textarea>
						</div>
					</div>
	          </div>
	          
	          <hr class="my-4">
	          
	          <div class="reviewButton">
		          <input type="button" value="정보 수정" onclick="reviewUpdate_submit(); return false;" class="btn btn-outline-black" />
		          	&nbsp;&nbsp;
		          <input type="reset" value="다시 작성" class="btn btn-outline-black" />
		          	&nbsp;&nbsp;
		         <input type="button" value="다시 돌아가기" class="btn btn-outline-black"
		          	onclick="window.location='/myroom/review'"/>
		       </div>
	        </form>
	      </div>
	    </div>
	  </main>
	</div>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>
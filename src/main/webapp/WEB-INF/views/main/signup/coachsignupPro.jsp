<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/user/custom/js/coachSignUp.js?ver=123" type="text/javascript"></script>

<link href="/resources/coach/custom/css/form-validation.css" rel="stylesheet">
<link href="/resources/user/custom/css/user.css" rel="stylesheet">

<c:if test="${result == 0}">
	<script>
		alert('잘못된 입력이 있습니다. 다시 작성해주세요.')
		history.go(-1);
	</script>
</c:if>

<c:if test="${result == 1}">

<div class="container-fluid">
    
    <iframe id="iframe1" name="iframe1" style="display: none;"></iframe>
    
    <div class="container">
	  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	    <div class="row g-5">
	      <div class="col-md-7 col-lg-8">
	        <h2 style="text-align: center; margin-bottom: 40px;"> ddarawazoom 코치지원 </h2>
	        <h4 class="mb-3">경력정보 입력</h4>
	        <form class="needs-validation" novalidate method="post" action="/ddarawazoom" target="iframe1" id="coachCareerForm" onsubmit="careerInsert();">
	          <div class="row g-3">
	            <div class="col-8">
	              <label for="specialty" class="form-label">* 전문분야</label>
	              <input type="text" class="form-control" id="specialty" name="specialty" placeholder="전문분야를 입력해주세요." required>
	              <div class="invalid-feedback">
	                전문분야는 필수항목입니다.
	              </div>
	            </div>
				<label id=result class="font" style="margin-top: 0px;"></label>
				
				<div class="col-12">
	              <label for="c_name" class="form-label">* 코칭경력</label>
	              <input type="text" class="form-control" id="career" name="career" placeholder="코칭경력을 입력해주세요" required>
	              <div class="invalid-feedback">
	                코칭경력은 필수항목입니다.
	              </div>
	            </div>
				
				<div class="col-12">
	              <label for="c_nick" class="form-label">자격증 및 수료증(발급기관)</label>
	              <input type="text" class="form-control" id="certificate" name="certificate" placeholder="자격증 및 수료증(발급기관)을 입력해주세요">
	            </div>	

	          </div>
	
	          <hr class="my-4">
	          
	          <button class="w-40 btn btn-primary btn-lg" type="submit">
	          	코치 지원
	          </button>
	          
	          <input type="hidden" value="${c_id}" name="c_id" />
	          <input type="button" class="w-40 btn btn-danger btn-lg" onclick="window.location='/ddarawazoom'" value="메인으로" />
	        </form>
	      </div>
	    </div>
	  </main>
	</div>
    
</div>

</c:if>

<script src="/resources/coach/custom/js/form-validation.js"></script>

<%@ include file="../../layout/footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../layout/header.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="/resources/coach/custom/css/form-validation.css" rel="stylesheet">
<script src="/resources/coach/custom/js/coach-info.js" type="text/javascript"></script>

<div class="container-fluid">
    
    <div class="container">
	  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
	    <div class="row g-5">
	      <div class="col-md-7 col-lg-8">
	        <h4 class="mb-3">코치 정보 수정</h4>
	        <form class="needs-validation" novalidate id="updateForm" action="/coachroom/info" method="post" onsubmit="infoUpdate_submit();">
	          <div class="row g-3">
	            <div class="col-sm-6">
	              <label for="firstName" class="form-label">이름</label>
	              <input type="text" class="form-control" id="c_name" name="c_name" placeholder="" value="${coachInfo.c_name}" required>
	              <div class="invalid-feedback">
	                이름은 필수항목입니다.
	              </div>
	            </div>
	
	            <div class="col-6">
	              <label for="username" class="form-label">닉네임</label>
	              <div class="input-group has-validation">
	                <input type="text" class="form-control" id="c_nick" name="c_nick" value="${coachInfo.c_nick}" required>
	              <div class="invalid-feedback">
	                  닉네임은 필수항목입니다.
	                </div>
	              </div>
	            </div>
	
	            <div class="col-12">
	              <label for="email" class="form-label">이메일</label>
	              <input type="email" class="form-control" id="c_email" name="c_email" value="${coachInfo.c_email}" required>
	              <div class="invalid-feedback">
	                이메일은 필수항목입니다.
	              </div>
	            </div>
				<fmt:formatDate var="birth" pattern="yyyy-MM-dd" value="${coachInfo.c_birth}" />
	            <div class="col-12">
	              <label for="address" class="form-label">생년월일</label>
	              <input type="date" class="form-control" id="c_birth" name="c_birth" value="${birth}" required>
	              <div class="invalid-feedback">
	                생년월일은 필수항목입니다.
	              </div>
	            </div>
	
	            <div class="col-12">
	              <label for="address2" class="form-label">소속 회사 <span class="text-muted">(선택사항)</span></label>
	              <input type="text" class="form-control" id="company" name="company" placeholder="소속 회사를 입력하세요." value="${coachInfo.company}">
	            </div>
	
	            <div class="col-md-5">
	              <label for="country" class="form-label">성별</label>
	              <select class="form-select" id="c_gender" name="c_gender" required>
	               	<option value="">선택하세요</option>
	                <option value="0">남성</option>
	                <option value="1">여성</option>
	              </select>
	              <div class="invalid-feedback">
	                성별은 필수항목입니다.
	              </div>
	            </div>
	          </div>
	
	          <hr class="my-4">
	          
	          <button class="w-40 btn btn-primary btn-lg" type="submit">
	          	정보 수정
	          </button>
	          
	          <button class="w-40 btn btn-danger btn-lg" onclick="window.location='/coachroom/info'">
	          	취소
	          </button>
	        </form>
	      </div>
	    </div>
	  </main>
	</div>
    
</div>
	
    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
    <script src="/resources/coach/custom/js/dashboard.js"></script>

	<script src="/resources/coach/custom/js/form-validation.js"></script>

<%@ include file="../../layout/footer.jsp"%>
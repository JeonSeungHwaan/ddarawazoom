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
	        <h4 class="mb-3">경력 수정</h4>
	        <form class="needs-validation" novalidate id="updateForm" action="/coachroom/info" method="post" onsubmit="update_submit();">
	          <input type="hidden" name="num" value="${coachCareer.num}" />
	          <div class="row g-3">
	            <div class="col-12">
	              <label for="text" class="form-label">전문 분야</label>
	              <input type="text" class="form-control" id="specialty" name="specialty" value="${coachCareer.specialty}" required>
	              <div class="invalid-feedback">
	                전문 분야는 필수항목입니다.
	              </div>
	            </div>
	
	            <div class="col-12">
	              <label for="text" class="form-label">경력</label>
	              <div class="input-group has-validation">
	                <input type="text" class="form-control" id="career" name="career" value="${coachCareer.career}" required>
	              <div class="invalid-feedback">
	                  경력은 필수항목입니다.
	                </div>
	              </div>
	            </div>
	
	            <div class="col-12">
	              <label for="text" class="form-label">자격증</label>
	              <input type="text" class="form-control" id="certificate" name="certificate" value="${coachCareer.certificate}">
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
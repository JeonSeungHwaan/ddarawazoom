<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/manager/custom/js/coach.js" type="text/javascript"></script>

<style>
	.coachInfo {
		margin-bottom: 20px;
	}
	
	.center {
		text-align: center;
		margin: 0 auto;
		margin-bottom: 20px;
	}
</style>

<body>
<div class="container-fluid">
    <main class="col-md-9 m-sm-auto col-lg-10 px-md-4">	
	    
	    	<div class="container">
			    <div class="center">
					<img src="/resources/image/upload/${coachInfo.c_img}" width="100" height="100" />
				</div>
			
				<div class="coachInfo">
					<h2>
						기본 정보
					</h2>
				    <div class="table-responsive">
				      <table class="table table-striped table-sm table-bordered">
				        <thead>
				          <tr>
				            <th scope="col">이름</th>
				            <th scope="col">닉네임</th>
				            <th scope="col">성별</th>
				            <th scope="col">생년월일</th>
				            <th scope="col">연락처</th>
				            <th scope="col">이메일</th>
				            <th scope="col">소속</th>
				          </tr>
				       </thead>
				        <tbody>
				          <tr>
				            <td>${coachInfo.c_name}</td>
				            <td>${coachInfo.c_nick}</td>
				            <td>${coachInfo.c_gender}</td>
				            <td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${coachInfo.c_birth}" /></td>
				            <td>${coachInfo.c_tel}</td>
				            <td>${coachInfo.c_email}</td>
				            <td>${coachInfo.company}</td>
				          </tr>
				        </tbody>
				      </table>
				    </div>
				</div>
				
				<div class="coachInfo">
				  <h2>경력 정보</h2>
				    <div class="table-responsive">
				        <table class="table table-striped table-sm table-bordered">
				          <thead>
				            <tr>
				              <th scope="col"></th>
				              <th scope="col">전문 분야</th>
				              <th scope="col">경력</th>
				              <th scope="col">자격증</th>
				            </tr>
				          </thead>
				           <tbody>
				           
				     		 <c:forEach var="coachCareer" items="${coachCareer}">
					             <tr>
					               <th scope="row">
					               	 ${number}
					               	 <c:set var="number" value="${number + 1}"/>
					               </th>
					               <td>${coachCareer.specialty}</td>
					               <td>${coachCareer.career}</td>
					               <td>${coachCareer.certificate}</td>
					             </tr>
				      		 </c:forEach>
				      		 
				           </tbody>
				         </table>
					 </div>
				 </div>
				
				<div class="coachInfo">
				  <h2>
				  	코치 소개
				  </h2>
				    <div class="table-responsive">
				      <table class="table">
				        <thead>
				          <tr>
				            <th scope="col"></th>
				          </tr>
				       </thead>
				        <tbody>
				          <tr>
				            <td>
				              <figure class="text-center">
							    <blockquote class="blockquote">
							    
							      <c:if test="${coachInfo.introduce != null}">
							      	<p>${coachInfo.introduce}</p>
							      </c:if>
								  
								  <c:if test="${coachInfo.introduce == null}">
							      	<p>아직 소개를 작성하지 않으셨습니다.</p>
							      	<p>코치님만의 장점을 작성해주세요!</p>
							      </c:if>
							      
								</blockquote>
							  </figure>
				            </td>
				          </tr>
				        </tbody>
				      </table>
					</div>
				</div>
				
				<div class="coachInfo">
				  <h2>
				  	등록한 수업 목록
				  </h2>
				    <div class="table-responsive">
				        <table class="table table-striped table-sm table-bordered">
				          <thead>
				            <tr>
				              <th scope="col"></th>
				              <th scope="col">강의 명</th>
				              <th scope="col" style="text-align: center;">조회수</th>
				              <th scope="col" style="text-align: center;">강의 관리</th>
				              <th scope="col" style="text-align: center;">강의 상태</th>
				            </tr>
				          </thead>
				          <tbody>
				     	  	<c:forEach var="coachClass" items="${coachClass}">
				     		  <c:set var="status" value="${coachClass.status}" />
					             <tr onmouseover="this.style.background='#E6E6FA'" onmouseout="this.style.background='none'"
					             		onclick="window.location='/ddarawazoom/zclasscontent?num=${coachClass.num}'">
					               <th scope="row">
					              	 ${classNumber}
					               	 <c:set var="classNumber" value="${classNumber + 1}"/>
					               </th>
					               <td>${coachClass.title}</td>
					               <td style="text-align: center;">${coachClass.count}</td>
					               <td style="text-align: center;">
					               	 <c:if test="${status == '등록'}">
					               	 	<button type="button" class="btn btn-sm btn-outline-danger"
					                		onclick="classDelete('${coachClass.num}')">강의 삭제</button>
					               	 </c:if>
					                 <c:if test="${status == '삭제'}">
					               	 	<button type="button" class="btn btn-sm btn-outline-primary"
					                		onclick="classRestore('${coachClass.num}')">강의 복구</button>
					               	 </c:if>
						          </td>
						          <td style="text-align: center;">
						          	<c:if test="${status == '삭제'}"><font color="red">${status}</font></c:if>
						          	<c:if test="${status == '등록'}"><font color="green">${status}</font></c:if>
						          </td>
					             </tr>
				      	 	 </c:forEach>
				           </tbody>
				         </table>
					 </div>
				</div>
				
			</div>
    </main>
</div>

    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
    <script src="/resources/coach/custom/js/dashboard.js"></script>

</body>
</html>

<%@ include file="../../layout/footer.jsp"%>
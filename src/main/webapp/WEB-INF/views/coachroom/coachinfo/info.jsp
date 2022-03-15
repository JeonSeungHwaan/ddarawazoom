<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/coach/custom/js/coach-info.js" type="text/javascript"></script>

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
						<button style="float: right;" type="button" class="btn btn-sm btn-outline-secondary"
							onclick="window.location='/coachroom/infoUpdate'">정보 수정</button>
						<button style="float: right;" type="button" class="btn btn-sm btn-outline-secondary"
							onclick="imgUpdateForm();">프로필 사진 변경</button>
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
				              <th scope="col" style="text-align: right;">
				              	<button type="button" class="btn btn-sm btn-secondary" onclick="window.location='/coachroom/careerInsert'">경력 추가</button>
				              </th>
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
					               <td style="text-align: right;">
								     <button type="button" class="btn btn-sm btn-outline-secondary"
								     	onclick="window.location='/coachroom/careerUpdate?num=${coachCareer.num}'">경력 수정</button>
								     <button type="button" class="btn btn-sm btn-outline-danger"
								     	onclick="delete_alert(${coachCareer.num});">경력 삭제</button>
								   </td>
					             </tr>
				      		 </c:forEach>
				      		 
				           </tbody>
				         </table>
					 </div>
				 </div>
				
				<div class="coachInfo">
				  <h2>
				  	코치 소개
				  	<c:if test="${coachInfo.introduce != null}">
					  <button style="float: right;" type="button" class="btn btn-sm btn-outline-secondary"
				  		onclick="window.location='/coachroom/introduceUpdate'">코치소개 수정</button>
					</c:if>
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
							      	<button type="button" class="btn btn-sm btn-outline-secondary"
				  						onclick="window.location='/coachroom/introduceUpdate'">코치소개 작성하기</button>
							      </c:if>
							      
								</blockquote>
							  </figure>
				            </td>
				          </tr>
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
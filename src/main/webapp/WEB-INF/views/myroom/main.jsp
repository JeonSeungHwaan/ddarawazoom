<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<%@ include file="../pay/cancel.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title>Myroom Main 페이지</title>

	<!-- 디데이 JS -->
	<script src="../../resources/js/myroom/dday.js" type="text/javascript"></script>
	
	<!-- 캘린더 css -->
	<link href='../../resources/css/class/main.css' rel='stylesheet' />
	<link href="../../resources/css/class/class.css" rel="stylesheet" />
	
	<!-- 페이지 css -->
	<link href="../../resources/css/myroom/main.css" rel="stylesheet" />
	<link href="../../resources/css/myroom/dday.css" rel="stylesheet" />
	
	<style>
	  #calendar {
	    max-width: 900px;
	    margin: 0 auto;
	  }
	</style>
</head>
<body>
	<c:if test="${sessionScope.id == null }">
		<script>
			alert('마이룸 페이지를 이용하기 위해서는 로그인이 필요합니다.\n로그인 페이지로 이동합니다.');
			location.href="/ddarawazoom/login"
		</script>
	</c:if>
	
	<c:if test="${sessionScope.id != null}">
	    <div class="container">
	        <div class="row">
	            <div class="col-xl-4">
	                <div class="card-box">
	                    <h4 class="header-title mt-0">${userInfo.nick} 님의 마이룸 페이지</h4>
	                    <div class="panel-body">
	                        <hr>
	                        <div class="text-left">
	                            <p class="text-muted font-13"><strong>I D :</strong> <span class="m-l-15">${userInfo.id}</span></p>
	                            <p class="text-muted font-13"><strong>NICK :</strong><span class="m-l-15">${userInfo.nick}</span></p>
	                            <p class="text-muted font-13"><strong>NAME :</strong> <span class="m-l-15">${userInfo.name}</span></p>
	                            <p class="text-muted font-13"><strong>GENDER :</strong> <span class="m-l-15">${userInfo.gender}</span></p>
	                            <p class="text-muted font-13"><strong>EMAIL :</strong> <span class="m-l-15">${userInfo.email}</span></p>
	                            <p class="text-muted font-13"><strong>TEL :</strong> <span class="m-l-15">${userInfo.tel}</span></p>
	                            <p class="text-muted font-13"><strong>BIRTH :</strong> <span class="m-l-15"><fmt:formatDate pattern="yyyy-MM-dd" value="${userInfo.birth}" type="date" dateStyle="long"/></span></p>
	                        </div>
	                         <button type="button" onclick="window.location='/myroom/userInfo'" class="btn btn-light">회원정보 페이지 이동</button>
	                    </div>
	                </div>
	            </div>
	            <div class="col-xl-8">
                	<div class="row">
                    <div class="col-sm-4">
                        <div class="card-box tilebox-one">
                            <h6 class="text-muted text-uppercase mt-0">관심 Zoom 페이지</h6>
	                            <div class="inbox-item-img">
	                            	<a href="/myroom/likeZoom">
	                            		<img src="../../resources/image/upload/zoom.png" class="rounded-circle" alt="zoom">
	                            	</a>
	                            </div>
	                    </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card-box tilebox-one">
                            <h6 class="text-muted text-uppercase mt-0">관심 Vod</h6>
                            	<div class="inbox-item-img">
                            		<a href="/myroom/likeVod">
                            			<img src="../../resources/image/upload/vod.jpg" class="rounded-circle" alt="vod">
                            		</a>
                            	</div>
                         </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="card-box tilebox-one">
                            <h6 class="text-muted text-uppercase mt-0">결제 내역 관리</h6>
                            	<div class="inbox-item-img">
                            		<a href="/myroom/payment">
                            			<img src="../../resources/image/upload/coin.png" class="rounded-circle" alt="coin">
                            		</a>
                            	</div>
                        </div>
                    </div>
                </div>
	                  	<!--디데이-->
	                   <div class="rgy-dday">
	                   	<h3>${userInfo.nick} 님의 특별한 날</h3>
	                   	<ul id="dDay">
	                   		<li class="dday1">
	                   			<button onclick="ddarawazoom_dday();" id="dday_button" class="btn btn-warning">
	                  		 			${userInfo.nick} 님과 DDarawaZoom이 함께 한지는?
	                  		 		</button>
	                   			<span class="ddayWord" id="dday_start"></span>
	                   			<span class="ddayColor" id="dday_result"></span>
	                  		 		<span class="ddayWord" id="dday_end"></span>
	                  		 	</li>
	                   	</ul>
	                   		<hr class="my-4">
	                    <div class="countdown-container">
			            	<div class="countdown-el days-c">
				                <p class="big-text" id="days">0</p>
				                <span>days</span>
			            	</div>
				            <div class="countdown-el hours-c">
				                <p class="big-text" id="hours">0</p>
				                <span>hours</span>
				            </div>
				            <div class="countdown-el mins-c">
				                <p class="big-text" id="mins">0</p>
				                <span>mins</span>
				            </div>
				            <div class="countdown-el seconds-c">
				                <p class="big-text" id="seconds">0</p>
				                <span>seconds</span>
				            </div>
	       		  		</div>
	       		  		<div class="ddayColor" id="body_final"></div>
	      		  		
	       		  		<form class="row g-3">
		       		  		<div class="col-auto">
		    					<label for="inputYear" class="visually-hidden">Year</label>
		    					<input type="text" class="form-control" id="inputYear" placeholder="'년도'를 입력하세요.">
		  					</div>
		  					<div class="col-auto">
		    					<label for="inputMonth" class="visually-hidden">Month</label>
		    					<input type="text" class="form-control" id="inputMonth" placeholder="'월'을 입력하세요.">
		  					</div>
		  					<div class="col-auto">
		    					<label for="inputDate" class="visually-hidden">Date</label>
		    					<input type="text" class="form-control" id="inputDate" placeholder="'일'을 입력하세요.">
		  					</div>
		  					<div class="col-sm-10">
	      						<input type="button" class="form-control" value="${userInfo.nick} 님의 바디프로필 촬영 날까지 남은 날은?"
	      							onclick="countdown();" class="btn btn-secondary">
	    					</div>
		  				</form>
		           </div>
		           <c:if test="${myPayment != null}">
		               <div class="card-box">
		               		<h4 class="header-title mb-3">결재내역 관리</h4>
		               		<button onclick="window.location='/myroom/payment'" class="btn btn-light">
		               			결제내역 관리 페이지로 이동하기
		               		</button>
		               		<div class="table-responsive">
			               		<table class="table" style="vertical-align: middle;">
			               			<thead>
			               				<tr>
			              					<th class="payNum">주문 번호</th>
											<th>강 의</th>
											<th>결제 금액</th>
											<th>환불 금액</th>
											<th>결제 시간</th>
											<th>상 태</th>
			               				</tr>
			               			</thead>
			               			<c:forEach var="myPayment" items="${myPayment}" >
				               			<tbody>
				               				<tr>
												<td class="payNum">${myPayment.merchantUid}</td>
												<td>
													<a href="/ddarawazoom/zclasscontent?num=${myPayment.c_num}">${myPayment.name}</a>
													[코치 명: ${myPayment.c_id}]
												</td>
												<td>${myPayment.amount}</td>
												<td>${myPayment.cancelAmount}</td>
												<td>${myPayment.paidAt}</td>
												<td>
													<c:if test="${myPayment.status == 'paid'}">		              				 	 
							               				<button class="btn btn-sm btn-success" disabled>결제완료</button></br>
						              				</c:if>
						              				<c:if test="${myPayment.status == 'creq'}">		              				 	 
							               				<button class="refundReqInfo btn btn-sm btn-secondary" >취소요청중</button>
							               				<div id="c-req-detail" style="display: none;"></div>
						              				</c:if>			              				
								              		<c:if test="${myPayment.status == 'cancelled'}">
								              			<button class="refundDone btn btn-sm btn btn-danger" id="">취소완료</button>	              				              			
								              			<div id="c-detail" style="display: none;"></div>
								              		</c:if>		
												</td>
											</tr>
				               			</tbody>
				               		</c:forEach>
			               		</table>
		               	    </div>	
		                </div>
	             	</c:if>
	               <c:if test="${reviewList != null}">
		               <div class="card-box">
		               		<h4 class="header-title mb-3">작성한 리뷰 관리</h4>
		               		<button onclick="window.location='/myroom/review'" class="btn btn-light">
		               			리뷰관리 페이지로 이동하기
		               		</button>
		               		<div class="table-responsive">
			               		<table class="table">
			               			<thead>
			               				<tr>
			              					<th>강의 명</th>
											<th>작성 내용</th>
											<th>평 점</th>
			               				</tr>
			               			</thead>
			               			<c:forEach var="reviewList" items="${reviewList}" >
				               			<tbody>
				               				<tr>
												<td>
													<a href="/ddarawazoom/zclasscontent?num=${reviewList.class_num}">${reviewList.title}</a>
												</td>
												<td>${reviewList.content}</td>
												<td>${reviewList.grade}</td>
											</tr>
				               			</tbody>
				               		</c:forEach>
			               		</table>
		               	    </div>	
		                </div>
	             	</c:if>
	              
	               <c:if test="${bodyProfileDTO != null}" >
		                <div class="card-box">
		                    <h4 class="header-title mb-3">현재 ${userInfo.nick} 님의 바디 프로필</h4>
		                    <button onclick="window.location='/myroom/bodyprofile'" class="btn btn-light" >
		                    	바디프로필 페이지로 이동하기
		                    </button>
		                    <div class="table-responsive">
		                    	<c:forEach items="${bodyProfileDTO}" var="bodyProfileDTO">
			                        <table class="table">
			                            <thead>
			                                <tr>
			                                    <th>#</th>
			                                    <th>종 류</th>
			                                    <th>기 록</th>
			                                </tr>
			                            </thead>
			                            <tbody>
			                                <tr>
			                                    <td>1</td>
			                                    <td>키</td>
			                                    <td>${bodyProfileDTO.b_height} cm</td>
			                                </tr>
			                                <tr>
			                                    <td>2</td>
			                                    <td>몸무게</td>
			                                    <td>${bodyProfileDTO.b_weight} kg</td>
			                                </tr>
			                                <tr>
			                                    <td>3</td>
			                                    <td>근육량</td>
			                                    <td>${bodyProfileDTO.b_muscle}</td>
			                                </tr>
			                                <tr>
			                                    <td>4</td>
			                                    <td>체지방량</td>
			                                    <td>${bodyProfileDTO.b_bodyfat} kg</td>
			                                </tr>
			                                <tr>
			                                    <td>5</td>
			                                    <td>가슴 둘레</td>
			                                    <td>${bodyProfileDTO.b_chest} cm</td>
			                                </tr>
			                                <tr>
			                                    <td>6</td>
			                                    <td>허리 둘레</td>
			                                    <td>${bodyProfileDTO.b_waist} cm</td>
			                                </tr>
			                                <tr>
			                                    <td>7</td>
			                                    <td>팔뚝 둘레</td>
			                                    <td>${bodyProfileDTO.b_arm} cm</td>
			                                </tr>
			                                 <tr>
			                                    <td>8</td>
			                                    <td>허벅지 둘레</td>
			                                    <td>${bodyProfileDTO.b_thigh} cm</td>
			                                 </tr>
			                                 <tr>
			                                    <td>9</td>
			                                    <td>엉덩이 둘레</td>
			                                    <td>${bodyProfileDTO.b_hip} cm</td>
			                                 </tr>
			                                 <tr>
			                                    <td>10</td>
			                                    <td>체 형</td>
			                                    <td>${bodyProfileDTO.b_shape}</td>
			                                 </tr>
			                            </tbody>
			                        </table>
		                        </c:forEach>
		                        	<div id='calendar' style="margin-top:150px;"></div>
			                    </div>
			                </div>
		                </c:if>
		            </div>
		       </div>
		  </div>
	</c:if>	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src='/resources/js/class/main.js'></script>
	<script src="/resources/js/class/class.js" type="text/javascript"></script>
	<script src="/resources/js/class/class_zoom.js" type="text/javascript"></script>
</body>
</html>

<%@ include file="../layout/footer.jsp"%>
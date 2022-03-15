<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
	<title>관리자 방문자 관리 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/manager/visitor.js?ver=12" type="text/javascript"></script>
	
	<link href="../../resources/css/manager/notice.css" rel="stylesheet">
	<link href="../../resources/css/manager/visitor.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous" />
</head>
<body>
<div class="col-md-10">
		<a href="/manager/visitor"><h3 class="header-title pb-3 mt-0">- 방문자 관리 페이지 -</h3></a>
	    <div class="row">
	        <div class="col-xl-3 col-lg-6">
	            <div class="card l-bg-cherry">
	                <div class="card-statistic-3 p-4">
	                    <div class="card-icon card-icon-large"><i class="fas fa-users"></i></div>
	                    <div class="mb-4">
	                        <h5 class="card-title mb-0">오늘의 방문자 수</h5>
	                    </div>
	                    <div class="row align-items-center mb-2 d-flex">
	                        <div class="col-8">
	                            <h2 class="d-flex align-items-center mb-0">
	                            	<c:if test="${todayVisitorCount == 0}">
	                            		<font style="font-size:12px;">오늘의 방문자가 없습니다.</font>
	                            	</c:if>
	                            	<c:if test="${todayVisitorCount != 0}">
	                                	${todayVisitorCount} 명
	                                </c:if>
	                            </h2>
	                        </div>
	                        <div class="col-4 text-right">
	                            <span>
	                            	<c:if test="${todayVisitorCount == 0}"></c:if>
	                            	<c:if test="${todayVisitorCount != 0}">
	                            		${todayVisitorCount} 명
	                            		<i class="fa fa-arrow-up"></i>
	                            	</c:if>
								</span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-xl-3 col-lg-6">
	            <div class="card l-bg-blue-dark">
	                <div class="card-statistic-3 p-4">
	                    <div class="card-icon card-icon-large"><i class="fas fa-users"></i></div>
	                    <div class="mb-4">
	                        <h5 class="card-title mb-0">일반 방문자 수</h5>
	                    </div>
	                    <div class="row align-items-center mb-2 d-flex">
	                        <div class="col-8">
	                            <h2 class="d-flex align-items-center mb-0">
	                            	<c:if test="${visitorCount == 0}">
	                            		<font style="font-size:12px;">일반 방문자가 없습니다.</font>
	                            	</c:if>
	                            	<c:if test="${visitorCount != 0}">
	                               	 	${visitorCount} 명
	                                </c:if>
	                            </h2>
	                        </div>
	                        <div class="col-4 text-right">
	                            <span>
	                            	<c:if test="${visitorCount == 0}"></c:if>
	                            	<c:if test="${visitorCount != 0}">
	                            		${visitorCount} 명
	                            		<i class="fa fa-arrow-up"></i>
	                            	</c:if>
	                            </span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-xl-3 col-lg-6">
	            <div class="card l-bg-green-dark">
	                <div class="card-statistic-3 p-4">
	                    <div class="card-icon card-icon-large"><i class="fas fa-users"></i></div>
	                    <div class="mb-4">
	                        <h5 class="card-title mb-0">네이버 방문자 수</h5>
	                    </div>
	                    <div class="row align-items-center mb-2 d-flex">
	                        <div class="col-8">
	                            <h2 class="d-flex align-items-center mb-0">
	                            	<c:if test="${naverVisitorCount == 0}">
	                            		<font style="font-size:12px;">네이버 방문자가 없습니다.</font>
	                            	</c:if>
	                            	<c:if test="${naverVisitorCount != 0}">
	                                	${naverVisitorCount} 명
	                                </c:if>
	                            </h2>
	                        </div>
	                        <div class="col-4 text-right">
	                            <span>
	                            	<c:if test="${naverVisitorCount == 0}"></c:if>
	                            	<c:if test="${naverVisitorCount != 0}">
	                            		${naverVisitorCount} 명
	                            		<i class="fa fa-arrow-up"></i>
	                            	</c:if>
	                            </span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-xl-3 col-lg-6">
	            <div class="card l-bg-orange-dark">
	                <div class="card-statistic-3 p-4">
	                    <div class="card-icon card-icon-large"><i class="fas fa-users"></i></div>
	                    <div class="mb-4">
	                        <h5 class="card-title mb-0">카카오톡 방문자 수</h5>
	                    </div>
	                    <div class="row align-items-center mb-2 d-flex">
	                        <div class="col-8">
	                            <h2 class="d-flex align-items-center mb-0">
	                            	<c:if test="${kakaoVisitorCount == 0}">
	                            		<font style="font-size:12px;">카카오톡 방문자가 없습니다.</font>
	                            	</c:if>
	                            	<c:if test="${kakaoVisitorCount != 0}">
	                            		${kakaoVisitorCount} 명
	                            	</c:if>
	                            </h2>
	                        </div>
	                        <div class="col-4 text-right">
	                            <span>
	                            	<c:if test="${kakaoVisitorCount == 0}"></c:if>
	                            	<c:if test="${kakaoVisitorCount != 0}">
	                            		${kakaoVisitorCount} 명
	                            		<i class="fa fa-arrow-up"></i>
	                            	</c:if>
	                            </span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	         <div class="col-xl-3 col-lg-6">
	            <div class="card l-bg-orange-dark">
	                <div class="card-statistic-3 p-4">
	                    <div class="card-icon card-icon-large"><i class="fas fa-users"></i></div>
	                    <div class="mb-4">
	                        <h5 class="card-title mb-0">멤버 방문자 수</h5>
	                    </div>
	                    <div class="row align-items-center mb-2 d-flex">
	                        <div class="col-8">
	                            <h2 class="d-flex align-items-center mb-0">
	                            	<c:if test="${memberVisitorCount == 0}">
	                            		 <font style="font-size:12px;">멤버 방문자가 없습니다.</font>
	                            	</c:if>
	                            	<c:if test="${memberVisitorCount != 0}">
	                            		${memberVisitorCount} 명
	                            	</c:if>
	                            </h2>
	                        </div>
	                        <div class="col-4 text-right">
	                            <span>
	                            	<c:if test="${memberVisitorCount == 0}"></c:if>
	                            	<c:if test="${memberVisitorCount != 0}">
	                            		${memberVisitorCount} 명
	                            		<i class="fa fa-arrow-up"></i>
	                            	</c:if>
	                            </span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-xl-3 col-lg-6">
	            <div class="card l-bg-green-dark">
	                <div class="card-statistic-3 p-4">
	                    <div class="card-icon card-icon-large"><i class="fas fa-users"></i></div>
	                    <div class="mb-4">
	                        <h5 class="card-title mb-0">코치 방문자 수</h5>
	                    </div>
	                    <div class="row align-items-center mb-2 d-flex">
	                        <div class="col-8">
	                            <h2 class="d-flex align-items-center mb-0">
	                            	<c:if test="${coachVisitorCount == 0}">
	                            		 <font style="font-size:12px;">코치 방문자가 없습니다.</font>
	                            	</c:if>
	                            	<c:if test="${coachVisitorCount != 0}">
	                            		${coachVisitorCount} 명
	                            	</c:if>
	                            </h2>
	                        </div>
	                        <div class="col-4 text-right">
	                            <span>
	                            	<c:if test="${coachVisitorCount == 0}"></c:if>
	                            	<c:if test="${coachVisitorCount != 0}">
	                            		${coachVisitorCount} 명
	                            		<i class="fa fa-arrow-up"></i>
	                            	</c:if>
		                        </span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="col-xl-3 col-lg-6">
	            <div class="card l-bg-cherry">
	                <div class="card-statistic-3 p-4">
	                    <div class="card-icon card-icon-large"><i class="fas fa-users"></i></div>
	                    <div class="mb-4">
	                        <h5 class="card-title mb-0">총 누적 방문자 수</h5>
	                    </div>
	                    <div class="row align-items-center mb-2 d-flex">
	                        <div class="col-8">
	                            <h2 class="d-flex align-items-center mb-0">
	                            	<c:if test="${totalVisitorCount == 0}">
	                            		 <font style="font-size:12px;">총 누적 방문자가 없습니다.</font>
	                            	</c:if>
	                            	<c:if test="${totalVisitorCount != 0}">
	                            		${totalVisitorCount} 명
	                            	</c:if>
	                            </h2>
	                        </div>
	                        <div class="col-4 text-right">
	                            <span>
	                            	<c:if test="${totalVisitorCount == 0}"></c:if>
	                            	<c:if test="${totalVisitorCount != 0}">
	                            		${totalVisitorCount} 명
	                            		<i class="fa fa-arrow-up"></i>
	                            	</c:if>
	                            </span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="md-3" >
		    <form name="visitorDate">
		    	<input type="date" id="visitDate" name="visitDate" class="form-controller" style="margin:0 auto; text-align:center; width:50%"/>
		    	<input type="button" id="btn" value="검색" class="btn btn-outline-secondary"  style="margin:0 auto; margin:0 auto; width:50%;"/>
		    </form>
	    </div>
	    
	    <h5 id="visiterNull" class="header-title pb-3 mt-0" style="display:none;"> 해당 날짜에 로그인한 방문자 기록이 없습니다. </h5>
	    
	    <div id="visitDateDiv" style="display: none;">
	    
		    <div class="container">
		    	<div class="row">
		    		<h5 class="header-title pb-3 mt-0"> 로그인 멤버 리스트 </h5>
			        <div class="col-xl-12">
			            <div class="card">
			                <div class="card-body">
			                    <div class="table-responsive">
			                        <table class="table table-hover mb-0">
			                            <thead>
			                                <tr class="align-self-center">
			                                    <th>번 호</th>
			                                    <th>아이디</th>
			                                    <th>구 분</th>
			                                    <th>날 짜</th>
			                                </tr>
			                            </thead>
				                        <tbody id="targetArea">
			                            	
				                        </tbody>
			                        </table>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
			
		</div>
	</div>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>
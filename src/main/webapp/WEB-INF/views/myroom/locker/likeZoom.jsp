<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title>likeZoom 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src ="../../resources/js/myroom/like.js" type="text/javascript"></script>
	
	<link href="../../resources/css/myroom/myRoom.css" rel="stylesheet" >
</head>
<body>
	<div class="likeZoom_title">
		<h3>소중한 관심Zoom 공간</h3>
	</div>
	<div class="row row-cols-1 row-cols-sm-1 g-3">
      	<c:if test="${count == 0}">
	      <section class="py-5 text-center container">
		    <div class="row py-lg-5">
		      <div class="col-lg-12 col-md-12 mx-auto">
		        <h1 class="fw-light">아직 관심을 주신 Zoom강의가 없습니다.</h1>
		        <hr class="my-4">
		        <p class="lead text-muted">관심이 가는 Zoom 강의를 등록해보세요!</p>
		        <p>
	          		<button type="button" class="btn btn-primary my-2"
	          			onclick="window.location='/ddarawazoom/zoom?id=${sessionScope.id}'">관심 등록하러가기 ☞</button>
	       	 	</p>
		      </div>
		    </div>
		  </section>
      	</c:if>
	</div>
	<c:if test="${count > 0 }">
		<div class="container-fluid">
   		 	<div class="container">
				<div class="row row-cols-1 row-cols-sm-1 row-cols-md-3 g-3">
					<c:forEach var="zoomList" items="${zoomList}">
						<div class="col">
							<div class="card shadow-sm">
		        				<img src="/resources/coach/img/${zoomList.img}" class="card-img-top" width="100" height="225">       
		         					<div class="card-body"> 	
										<p class="card-text">
											<b>코치 명 :</b> ${zoomList.c_id} 코치님
										</p>
										<p class="card-text">
											<b>강의 명 :</b><br/>
											<a href="/ddarawazoom/zoomReadcount?num=${zoomList.num}">${zoomList.title}</a>
										</p>
										<p class="card-text">
											<b>강의 소개 :</b><br/>
											${zoomList.intro}
										</p>
										<p class="card-text">
											<b>가 격 :</b><br/>
											${zoomList.price}원 
										</p>	
	 								<div class="d-flex justify-content-between align-items-center">
		              					<div class="btn-group">
							                <button type="button" class="btn btn-sm btn btn-danger" disabled>${zoomList.type}</button>&nbsp;&nbsp; 	 	 
							               	<button type="button" class="btn btn-sm btn btn-success" disabled>${zoomList.goal}</button>&nbsp;&nbsp;
							               	<button type="button" class="btn btn-sm btn btn-warning" disabled>${zoomList.tool}</button>&nbsp;&nbsp;
							               	<button type="button" class="btn btn-sm btn btn-primary" disabled>${zoomList.frequency}</button>
							               	<button type="button" class="btn btn-light" onclick="deleteLikeZoom(${zoomList.num});">관심 해제</button>
		              					</div>	     
						            </div>
						         </div>
			        		</div>
		        		</div>
					</c:forEach> 
				</div>		
	 		</div>
		</div>
	</c:if>	
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>
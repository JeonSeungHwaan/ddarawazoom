<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/js/zoom/search.js" type="text/javascript"></script>

<link href="../../resources/css/manager/zoom.css" rel="stylesheet">

<div class="container-fluid">
	<div class="album py-2 bg-light"><br>
    	<h2 style="text-align: center;"> 따라와 줌 </h2>
    	<h3 style="text-align: center;"> 온라인PT </h3><br>
    <div class="container">
	<div class="row row-cols-2 row-cols-sm-1 row-cols-md-3 g-2"> 
 
	<c:if test="${count == 0}" >
	<div class="container-fluid">
		<div align="center">
	   		<h5>수업이 없습니다.</h5>
	   		<h5>강의등록 버튼을 눌러 수업을 추가해주세요!</h5>  
	    </div>
	</div>   
	</c:if>
			
	<c:if test="${count > 0}">	
		<c:forEach var="zoomList" items="${zoomList}">
		<div class="col">
			<div class="card shadow-sm">
	        	<img src="/resources/coach/img/${zoomList.img}" class="card-img-top" width="100" height="225">       
         	<div class="card-body"> 	
				<p class="card-text">No.${number} /
					<c:set var="number" value="${number - 1}"/>
					readcount <font color="red">${zoomList.count}</font> <img src="/resources/image/zoom/eye.png"> 
					<c:if test="${zoomList.count >= 20}">
					  <span class="hit">hit!!</span> 
					</c:if>
				</p>
				<p class="card-text">
					<a href="/ddarawazoom/coachInfo?c_id=${zoomList.c_id}">${zoomList.c_nick}</a> 강사님
				</p>
				<p class="card-text">
					<a href="/ddarawazoom/zoomReadcount?num=${zoomList.num}">${zoomList.title}</a>
				</p>
				<p class="card-text">
					가격 : ${zoomList.price}원  
				</p>	
			<div class="d-flex justify-content-between align-items-center">
            <div class="btn-group">
              	<button type="button" class="btn btn-sm btn btn-danger"
              		onclick="window.location='/ddarawazoom/searchClass?category=type&input=${zoomList.type}'">${zoomList.type}</button>&nbsp;	 	 
             	<button type="button" class="btn btn-sm btn btn-success"
             		onclick="window.location='/ddarawazoom/searchClass?category=goal&input=${zoomList.goal}'">${zoomList.goal}</button>&nbsp;

             	<c:if test="${zoomList.tool == '-'}">
             		<button type="button" class="btn btn-sm btn btn-warning" disabled>${zoomList.tool}</button>&nbsp;
             	</c:if>
             	<c:if test="${zoomList.tool != '-'}">
             		<button type="button" class="btn btn-sm btn btn-warning"
             			onclick="window.location='/ddarawazoom/searchClass?category=tool&input=${zoomList.tool}'">${zoomList.tool}</button>&nbsp;
             	</c:if>

             	<button type="button" class="btn btn-sm btn btn-primary" disabled>${zoomList.frequency}</button> 
            </div>	          
	        </div>
            </div>
        	</div>
       </div>
	   </c:forEach> 
	</c:if>
	
	</div><br /> 
	
	<form action="/ddarawazoom/searchClass" method="post" onsubmit="return valueCheck()">

	  <div style="width: 50%; text-align: center; margin: auto 0;">
		  <div class="input-group mb-3">
		    <select class="form-select form-select-sm" id="search-category" name="category" style="width: 25%;">
		      <option selected value="">선택하세요</option>
		      <option value="c_nick">코치명</option>
		      <option value="title">강의 제목</option>
		      <option value="type">운동 타입</option>
		    </select>

		    <input type="text" class="form-control" placeholder="검색어를 입력하세요" style="width: 60%;" id="search-input" name="input">
		    <button class="btn btn-outline-secondary" type="submit" id="search-btn" style="width: 15%;">검색</button>
		  </div>
	  </div>
	</form>
	
	<c:if test="${sessionScope.id == null && sessionScope.c_id != null}">
		<div>
			<input type="button" value="강의등록" class="btn btn-outline-primary" onclick="window.location='/ddarawazoom/zwriteForm'">
		</div>  
	</c:if> <br />
	
	<c:if test="${pageCount > 1}">
		<div id="page">페이지&nbsp;  
			<c:if test="${startPage > 10}">
				<a href="/ddarawazoom/zoom?pageNum=${startPage - 10}"> [이전] </a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="/ddarawazoom/zoom?pageNum=${i}">${i}</a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a href="/ddarawazoom/zoom?pageNum=${startPage + 10}"> [다음] </a>
			</c:if>
		</div>
	</c:if>	
				
 	</div>
	</div>	 
</div>  
	
<%@ include file="../../layout/footer.jsp"%> 
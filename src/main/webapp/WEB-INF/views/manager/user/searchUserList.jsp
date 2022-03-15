<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<html>
<head>
	<title>User 관리 페이지</title>
	<script src="../../resources/js/manager/user.js" type="text/javascript" ></script>
	
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
	<link href="../../resources/css/manager/user.css" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<div class="row el-element-overlay">
			<a href="/manager/user"><h3 class="header-title pb-3 mt-0">- 멤버 관리자 페이지 -</h3></a>
			<div class="container bootstrap snippets bootdey">
			  <div class="row" style="margin-bottom: 100px;">
			  	 <div class="col-lg-2 col-sm-6">
			      <div class="circle-tile ">
			        <a href="#"><div class="circle-tile-heading purple"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
			        <div class="circle-tile-content purple">
			          <div class="circle-tile-description text-faded">총 멤버</div>
			          <div class="circle-tile-number text-faded ">총 ${count} 명</div>
			        </div>
			      </div>
			    </div>
			    <div class="col-lg-2 col-sm-6">
			      <div class="circle-tile ">
			        <a href="#"><div class="circle-tile-heading dark-blue"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
			        <div class="circle-tile-content dark-blue">
			          <div class="circle-tile-description text-faded"> 탈퇴 멤버 </div>
			          <div class="circle-tile-number text-faded ">${deleteUserCount} 명</div>
			        </div>
			      </div>
			    </div>
     
			    <div class="col-lg-2 col-sm-6">
			      <div class="circle-tile ">
			        <a href="#"><div class="circle-tile-heading red"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
			        <div class="circle-tile-content red">
			          <div class="circle-tile-description text-faded"> 오늘 하루 신규 가입 멤버 </div>
			          <div class="circle-tile-number text-faded ">${newUserCount} 명</div>
			        </div>
			      </div>
			    </div> 
     		
	     		 <div class="col-lg-2 col-sm-6">
			      <div class="circle-tile ">
			        <a href="#"><div class="circle-tile-heading orange"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
			        <div class="circle-tile-content orange">
			          <div class="circle-tile-description text-faded"> 일반 가입 멤버 </div>
			          <div class="circle-tile-number text-faded ">${userCount}</div>
			        </div>
			      </div>
			    </div>
	     		
			     <div class="col-lg-2 col-sm-6">
			      <div class="circle-tile ">
			        <a href="#"><div class="circle-tile-heading yellow "><i class="fa fa-users fa-fw fa-3x"></i></div></a>
			        <div class="circle-tile-content yellow">
			          <div class="circle-tile-description text-faded"> 카카오톡 가입 멤버 </div>
			          <div class="circle-tile-number text-faded ">${kakaoUserCount} 명</div>
			        </div>
			      </div>
			    </div> 
		     
			     <div class="col-lg-2 col-sm-6">
			      <div class="circle-tile ">
			        <a href="#"><div class="circle-tile-heading green"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
			        <div class="circle-tile-content green">
			          <div class="circle-tile-description text-faded"> 네이버 가입 멤버 </div>
			          <div class="circle-tile-number text-faded ">${naverUserCount} 명</div>
			        </div>
			      </div>
			    </div> 
			  </div> 
			</div>  
			<div style="width: 80%; text-align:center; margin: 0 auto; margin-bottom: 50px;">
                  <form action="/manager/searchUserList" method="post" name="searchForm" onsubmit="return valueCheck()">
					  <div class="input-group mb-3">
					    <select class="form-select form-select-sm" id="search-category" name="category" style="width: 25%;">
					      <option selected value="">선 택</option>
					      <option value="id">아이디</option>
					      <option value="nick">닉네임</option>
					      <option value="gender">성 별</option>
					      <option value="status">상 태</option>
					    </select>
				    <input type="text" class="form-control" placeholder="검색어를 입력하세요" style="width: 60%;" id="search-input" name="input">
				    <button class="btn btn-light" type="submit" id="search-btn" style="width: 15%;">검색</button>
				  </div>
				</form>
			 </div>
		
		<h5> - 검색한 멤버 결과 <font style="color:red;">[ ${searchCount} 명 ]</font> -</h5>
			<c:if test="${searchCount == 0}">
				<h6 class="userTitle">검색한 결과가 없습니다.</h6>
			</c:if>
			<c:if test="${searchCount != 0}">
				<c:forEach var="userList" items="${userList}">
				    <div class="col-lg-3 col-md-6">
				        <div class="card">
				            <div class="el-card-item">
				                <div class="el-card-avatar el-overlay-1"> <img src="../../resources/image/upload/${userList.img}" alt="user">
				                    <div class="el-overlay">
				                        <ul class="list-style-none el-info">
				                            <li class="el-item"><a class="btn default btn-outline image-popup-vertical-fit el-link" href="/manager/userInfo?id=${userList.id}"><i class="fa fa-search" aria-hidden="true"></i></a></li>
				                        </ul>
				                    </div>
				                </div>
				                <div class="el-card-content">
				                    <h4 class="m-b-0">${userList.id}</h4> <span class="text-muted">${userList.email}</span>
				                </div>
				            </div>
				        </div>
				    </div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<div id="page">
		<c:if test="${pageCount > 0}">
			페이지&nbsp;
			<c:if test="${startPage > 10}">
				<a href="/manager/searchUserList?category=${category}&input=${input}&pageNum=${startPage - 10}"> [이전] </a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="/manager/searchUserList?category=${category}&input=${input}&pageNum=${i}">${i}</a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a href="/manager/searchUserList?category=${category}&input=${input}&pageNum=${startPage + 10}"> [다음] </a>
			</c:if>
		</c:if>	
	</div>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>
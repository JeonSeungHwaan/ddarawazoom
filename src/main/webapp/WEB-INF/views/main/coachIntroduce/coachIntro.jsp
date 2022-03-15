<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      .circle{
      	border: 3px solid gold;
		border-radius: 100px;
		-moz-border-radius: 100px;
		-khtml-border-radius: 100px;
		-webkit-border-radius: 100px;
      }
</style>

<link href="/resources/css/carousel.css" rel="stylesheet">

<div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
      
      <c:forEach items="${coachInfo}" var="coachInfo">
        <div class="col-lg-4">
          <a href="/ddarawazoom/coachInfo?c_id=${coachInfo.c_id}">	
          	<img class="circle" src="/resources/image/upload/${coachInfo.c_img}" class="rounded mx-auto d-block" alt="..." width="150px" height="150px">
          </a>

          <p>${coachInfo.c_name}</p>
          <p><a class="btn btn-secondary" href="/ddarawazoom/coachInfo?c_id=${coachInfo.c_id}">코치 정보 보기</a></p>
        </div><!-- /.col-lg-4 -->
	  </c:forEach>
    </div>

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->
  
<%@ include file="../../layout/footer.jsp"%>  
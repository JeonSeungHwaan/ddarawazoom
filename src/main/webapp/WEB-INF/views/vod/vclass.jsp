<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>


<div class="container-fluid bg-light">
	</br>
	<div class="album py-2 bg-light">
	  	<h2 style="text-align: center;"> 따라와 줌 </h2>
	  	<h3 style="text-align: center;"> 온라인PT-VOD </h3>
	  	</br>
  	</div>
  	
  	<c:if test="${contentCount == 0}">
		<div class="container-fluid">
			<div align="center">
		   		<h5>등록된 영상이 없습니다.</h5>
		   		<h5>관리자에게 문의하세요.</h5>   
		    </div>
		</div>   
	</c:if>
  	
   	<c:if test="${contentCount > 0}">
   		<div class="container-vod">
   			<form action="/ddarawazoom/searchVod" method="post">
	   			<div style="width: 50%;">
			   		<div class="input-group mb-3">
						<input type="text" class="form-control" name="input" placeholder="검색어를 입력하세요" style="width: 60%;"/>
						<button class="btn btn-outline-secondary" type="submit" style="width: 15%;">
							검색
						</button>
					</div>
				</div>
			</form>	
		
			<div class="row row-cols-2 row-cols-sm-1 row-cols-md-3 g-2">
			    <c:forEach items="${youtube}" var="youtubeDTO">
				    <div class="col">
					    <div class="card" style="width: 480;">
					     	<div class="text-center">${youtubeDTO.embedhtml}</div> 		    		
						    	<div class="card-body"> 	
									<p class="card-text">
										${youtubeDTO.title}
									</p>
									<p class="card-text">
										${youtubeDTO.channeltitle}
									</p>
									<p class="card-text">
										#${youtubeDTO.tag1} #${youtubeDTO.tag2} #${youtubeDTO.tag3}
									</p>	
					            </div>
				            </div>	    
					    </div>
			    </c:forEach>	  
		  	</div>
	
			<br/>
			<div id="page">
				<span>페이지</span> 
				<c:if test="${startPage > pageBlock}">
					<a href="/ddarawazoom/vod?pageNum=${startPage}-${pageBlock}"> [이전] </a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a href="/ddarawazoom/vod?pageNum=${i}">${i}</a>
				</c:forEach>
				<c:if test="${endPage < totalPage}">
					<a href="/ddarawazoom/vod?pageNum=${startPage}+${pageBlock}"> [다음] </a>
				</c:if>
			</div>
			<br/>
	  	</div>
	</c:if>	
</div>


<%@ include file="../layout/footer.jsp"%>

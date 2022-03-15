<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>    
<%@ include file="../../pay/iamport.jsp"%>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<link href="../../resources/css/manager/zoom.css" rel="stylesheet">
<script src ="../../resources/js/myroom/like.js" type="text/javascript"></script>

<div class="container-fluid"> 
	<div class="album py-2 bg-light">
    	<h2 style="text-align: center;"> 따라와 줌 </h2>
    	<h3 style="text-align: center;"> 온라인PT 상세페이지</h3> 
    <div class="container">
    
	<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 g-3">
		<div class="col">
		<div class="card shadow-sm">  
			<img src="/resources/coach/img/${zoomContent.img}" class="card-img-top" width="100" height="625">
			<c:if test="${sessionScope.c_id == zoomContent.c_id}">	
				<input type="button" value="사진변경" class="btn btn-outline-warning" onclick="window.location='/ddarawazoom/imgUpdate?img=${zoomContent.img}&num=${zoomContent.num}'" />
			</c:if>	
		<div class="btn-group">	
           	<c:if test="${sessionScope.c_id == zoomContent.c_id}">
				<input type="button" class="btn btn-outline-primary" value="강의정보 수정" onclick="document.location.href='/ddarawazoom/zupdateForm?num=${zoomContent.num}'">
				<input type="button" class="btn btn-outline-danger" value="강의 삭제" onclick="document.location.href='/ddarawazoom/zdeleteForm?num=${zoomContent.num}'"> 
			</c:if>	 
			<input type="button" class="btn btn-outline-secondary" value="글목록" onclick="document.location.href='/ddarawazoom/zoom'">
			<c:if test="${sessionScope.id != null}">			
				<input type="button" id="payBtn" class="btn btn-outline-primary" value="바로 결제하기">
			</c:if>
		</div>
			<div>
				<br />
				&nbsp;&nbsp;<button type="button" class="btn btn-m btn-danger" disabled>${zoomContent.type}</button>	 	 
             	&nbsp;&nbsp;<button type="button" class="btn btn-m btn-success" disabled>${zoomContent.goal}</button>
             	&nbsp;&nbsp;<button type="button" class="btn btn-m btn-warning" disabled>${zoomContent.tool}</button>
             	&nbsp;&nbsp;<button type="button" class="btn btn-m btn-primary" disabled>${zoomContent.frequency}</button> 
			</div>
			<div class="card-body">
				<h4 align="left">No.${zoomContent.num}</h4>
				<h5 align="left">readcount 
				<font color="red"> ${zoomContent.count} </font><img src="/resources/image/zoom/eye.png">
					<c:if test="${zoomContent.count >= 20}">
						<span class="hit">hit!!</span>  
					</c:if>
				</h5>
					
				<h2>${zoomContent.title}
				
 				 <c:if test="${sessionScope.c_id == null}">   
					<c:if test="${result == 1}">   
						<img src="/resources/image/like/heart_fill.png" width="40px" height="40px" onclick="zoomLikeDelete(${zoomContent.num})"><font color="red">&nbsp;Like!</font><br/>
					</c:if>
					<c:if test="${result == 0}">
						<img src="/resources/image/like/heart_empty.png"  width="40px" height="40px" onclick="zoomLikeWrite(${zoomContent.num})"><font color="black">&nbsp;Like!</font><br/>
					</c:if>				
			 	 </c:if> 
				
				</h2>
				<h5>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/ddarawazoom/coachInfo?c_id=${zoomContent.c_id}"><font color="blue">${zoomContent.c_nick}</font></a> 강사님</h5><br />
				<h5>&nbsp;&nbsp;${zoomContent.intro}</h5>
			</div> 
		</div>	
		</div>
	</div>
	
	<br >
	
	<c:if test="${sessionScope.id != null}">
	<div class="row row-cols-1 row-cols-sm-1 row-cols-md-1 g-3">
		<div class="col">
			<h2>후기</h2> 
			
			<script type="text/javascript">
			    function validate(){
			        x=document.numbercheck
			        txt=x.grade.value
			        if (txt>=1 && txt<=10) {
						alert("맞게 입력하셨습니다.")
			            return true;
			        }else{
			            alert("1부터 10까지 숫자만 입력가능합니다.")
			            return false;
			        }
				}
			    
			    function nullcheck(){
					var n = document.numbercheck;
					if(n.grade.value == ""){
						alert("평점은 필수항목입니다");
						n.grade.focus();
						return false;	
					}
					if(n.content.value == ""){
						alert("내용은 필수항목입니다");
						n.content.focus();
						return false;	
					}
			    }	
			</script> 
			
			<hr class="featurette-divider">
	  			<div class="row featurette">
  			 	<div class="col-md-12">
  			 		<form action="re_writePro" method="post" name="numbercheck" onsubmit='return validate(this.form);'>
	  			 		<input type="hidden" name="class_num" value="${zoomContent.num}">
	  			 		<input type="hidden" name="title" value="${zoomContent.title}">
	     	 	  	<table class="table table-bordered">
	  		    		<thead>
					 		<tr>
								<th scope="col" style="width: 100px;"></th>
								<th scope="col" style="width: 30%;">아이디</th>
								<th scope="col" style="width: 30%;">닉네임</th>
								<th scope="col">평점(총점 10점)</th>
						 	</tr>
						</thead>			
						<tbody>
		      		 		<tr>
				        	    <th scope="row"></th>
				        	    <td><input type="hidden" name="id" value="${sessionScope.id}">${sessionScope.id}</td>
				                <td><input type="hidden" name="nick" value="${userInfo.nick}">${userInfo.nick}</td> 
				                <td><input type="text" name="grade" size="3">&nbsp;<input type="button" value="확인" onclick='return validate(this.form);'></td>  
				            </tr>
				            <tr>
				                <th scope="row"> 강의명 </th>
				                <td colspan="3">${zoomContent.title}</td>
				            </tr>
				      		<tr>
				                <th scope="row"> 후기 </th>
				                <td colspan="3"><textarea name="content" rows="3" cols="100"></textarea></td>
				            </tr>
				            <tr>
				            	<td colspan="4" align="right">
					            	<input type="submit" value="작성하기" onclick='return nullcheck(this.form);'>&nbsp;&nbsp;
					            	<input type="reset" value="초기화하기">&nbsp;&nbsp;		           
				            	</td>
				            </tr>
	  		           </tbody>
	        	   </table>
		           </form>			
		       </div>
			   </div>
			   </c:if>
			   
			<c:if test="${count == 0}" >
	    		<h5 align="center">작성된 후기가 없습니다.</h5> 
			</c:if>	
				   
		   <c:if test="${count > 0}">
		   <c:forEach var="reviewList" items="${reviewList}"> 
		   <hr class="featurette-divider">
  				<div class="row featurette">
  			 	<div class="col-md-12">
     	 	  		<table class="table table-bordered">
  		    			<thead>
							 <tr>
								<th scope="col" style="width: 100px;"></th>
								<th scope="col" style="width: 30%;">닉네임</th> 
								<th scope="col">평점</th>
							 </tr>
						</thead>								
						<tbody>
				      		 <tr>
				        	    <th scope="row"></th>
				                <td>${reviewList.nick}</td>
				                <td>${reviewList.grade}/10</td>
				            </tr>
				            <tr>
				                <th scope="row"> 강의명 </th>
				                <td colspan="2">${reviewList.title}</td>
				            </tr>
				      		<tr>
				                <th scope="row"> 후기 </th>
				                <td colspan="2">
					                <c:if test="${reviewList.deleted ne 'yes'}">
	                    					${reviewList.content}
	                    			</c:if>
	                    			<c:if test="${reviewList.deleted eq 'yes' and reviewList.deleted ne 'no'}">
	                    				<font style="color: red;">
                    						<b>[<i class="fas fa-dizzy"></i> 경고!]</b> ${reviewList.id}님께서 작성하신 리뷰는 <b>"리뷰 관리 기준"</b>을 위반하여 관리자에 의해 경고를 받았습니다.<br/><br/>
                    						위 경고에 대해 궁금하신 사항이 있으시다면, <b>DDarawaZoom</b>으로 문의 주세요.<br/>
	                    				</font>
						           </c:if>
				                </td> 
				            </tr>
	  		           </tbody>
			         </table>				      			
			     </div>
				 </div>
			</c:forEach>
			</c:if>	
			
		<c:if test="${count > 1}">
		<div id="page">페이지&nbsp;  
			<c:if test="${startPage > 10}">
				<a href="/ddarawazoom/zclasscontent?num=${zoomContent.num}&pageNum=${startPage - 10}"> [이전] </a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1"> 
				<a href="/ddarawazoom/zclasscontent?num=${zoomContent.num}&pageNum=${i}">${i}</a>
			</c:forEach>
			
			<c:if test="${endPage < pageCount}">
				<a href="/ddarawazoom/zclasscontent?num=${zoomContent.num}&pageNum=${startPage + 10}"> [다음] </a>   
			</c:if>
		</div>
		</c:if>
	</div>
	</div>		
</div>

<%@ include file="../../layout/footer.jsp"%>   
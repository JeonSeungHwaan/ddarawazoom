<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%> 
  
<script type="text/javascript">
$(document).ready(function(){

	$('#SearchBtn').click(function() {
		$.ajax({
            type: "post",
    		data: {
    			"qurey":$('#qurey').val(), 
    			"maxResults":$('#maxResults').val()
    			},
            url: "/manager/searchVodCode", // data 보낼 주소		                    	                    	
            success: function(videoIdList){	// data 전송 성공 했을때                		                    	
            	var code=""
            	$.each(videoIdList, function( index, value ) {
                    code += videoIdList[index]+" / ";
            		console.log( videoIdList[index] ); 
                 });

            	$("#code").html(code);           	
            }
        });
	});
	
	$('#AutoInputBtn').click(function() {
		$.ajax({
            type: "post",
    		data: {
    			"qurey":$('#qurey').val(), 
    			"maxResults":$('#maxResults').val()
    			},
            url: "/manager/autoInsertVod", // data 보낼 주소		                    	                    	
            success: function(result){	// data 전송 성공 했을때                		                    	
            	if (result == 1) {
            		alert("모두 입력되었습니다.");           		
            	} else {
            		alert("다시 시도해주세요.");
            	}	
            	location.reload();
            }
        });
	});
	
	$('#InputBtn').click(function() {
		$.ajax({
            type: "post",
    		data: {"videoId":$('#videoId').val()},
            url: "/manager/insertVod", // data 보낼 주소		                    	                    	
            success: function(result){	// data 전송 성공 했을때                		                    	
            	console.log(result);
				$("#vodList").load("/manager/vod #vodList");
            }
        });
	});

	$('.del').click(function() {
		console.log("삭제");
		var tdArr = new Array();			// 클릭한 행(row) 데이터
		var delBtn = $(this);
		var tr = delBtn.parent().parent();
		var td = tr.children();
		var vnum=td.eq(0).text();
		console.log(vnum);
		$.ajax({
            type: "post",
    		data: {"vnum":vnum},
            url: "/manager/deleteVod", // data 보낼 주소		                    	                    	
            success: function(result){	// data 전송 성공 했을때                		                    	
            	console.log(result);
            	location.reload();
            	if (result == 0) {
            		alert("다시 시도해주세요.");
            	}	
            }
        });
	});
	
	$('.status').click(function() {
		console.log("상태변경");
		var tdArr = new Array();			// 클릭한 행(row) 데이터
		var delBtn = $(this);
		var tr = delBtn.parent().parent();
		var td = tr.children();
		var vnum=td.eq(0).text();
		var status=td.eq(6).text().trim();
		if (status == "ON") {
			status = "OFF"
		} else {
			status = "ON"
		}
		console.log(status);
		$.ajax({
            type: "post",
    		data: {"vnum":vnum, "status":status},
            url: "/manager/changeStatusVod", // data 보낼 주소		                    	                    	
            success: function(result){	// data 전송 성공 했을때                		                    	
            	console.log(result);
            	location.reload();
				/* $("#vodList").load("/manager/vod #vodList"); */
				if (result == 0) {
            		alert("다시 시도해주세요.");
            	}
            }
        });
	});
		
			
});

function valueCheck(){
	if($('#input').val() == ''){
		alert("검색어를 입력하세요.");
		return false;
	}
}
</script>      

<div class="container marketing">	
	<h2 style="text-align: center;"> Vod 관리	
		<button class="btn btn-lg btn-outline-dark">
			Total: ${contentCount}개
		</button>
	</h2>
	<hr class="featurette-divider">
	
	<div class="container">
  		<div class="row">
			<div class="form-floating col">
		   		<input type="text" id="qurey" class="form-control" placeholder="qurey"/>
		   		<label for="qurey">키워드</label>
			</div>
			<div class="form-floating col-md-auto">
				<input type="number" id="maxResults" class="form-control vw-10" placeholder="maxResults">
	    		<label for="maxResults">검색 갯수</label>
	    	</div>
	    	<div class="form-floating col-md-auto">
				<input type="button" id="AutoInputBtn" class="w-100 btn btn-lg btn-secondary mb-3" value="자동입력"/>
			</div>
	    	<div class="form-floating col-md-auto">
				<input type="button" id="SearchBtn" class="w-100 btn btn-lg btn-secondary mb-3" value="코드검색"/>
			</div>
			<div class="form-floating col">
		   		<input type="text" id="videoId" class="form-control" placeholder="videoId"/>
		   		<label for="videoId">동영상코드</label>
			</div>
			<div class="form-floating col-md-auto">
				<input type="button" id="InputBtn" class="w-100 btn btn-lg btn-primary mb-3" value="코드입력"/>
			</div>
		</div>
	</div>
	
	<div class="container" id="code">
	</div>
		
	<c:if test="${contentCount == 0}">
		<div class="container-fluid">
			<div align="center">
		   		<h5>등록된 영상이 없습니다.</h5>
		    </div>
		</div>   
	</c:if>
	
	<c:if test="${contentCount > 1}">
		<div class="text-end">
			<button class="btn btn-lg btn-secondary">
				OnAir: ${onCount}개
			</button>
			<button class="btn btn-lg btn-outline-primary">
				Disabled: ${offCount}개
			</button>
		</div>
		
		<table id="vodList" class="table table-striped table-sm table-hover">
			<thead>
	            <tr>
					<th scope="col"></th>
					<th scope="col">썸네일</th>
	              	<th scope="col" style="width: 40%">제목</th>
	              	<th scope="col">채널명</th>
	              	<th scope="col">코드</th>
	              	<th scope="col">tags</th>
	              	<th scope="col">상태</th>
	              	<th scope="col"></th>
	            </tr>
			</thead>
			<tbody>
				<c:forEach items="${youtube}" var="youtubeDTO">
	           		<tr>
		              	<td>${youtubeDTO.vnum}</td>
		              	<td>
		              		<a href="https://www.youtube.com/watch?v=${youtubeDTO.videoid}" target='_blank'>
		              			<img src="${youtubeDTO.thumbnail_url}">
		              		</a>
	              		</td>
		              	<td>
		              		<a href="https://www.youtube.com/watch?v=${youtubeDTO.videoid}" target='_blank'>
		              			${youtubeDTO.title}
	              			</a>
		              	</td>   
		              	<td>
		              		${youtubeDTO.channeltitle}</br>		              		
		              	</td>
		              	<td>
		              		${youtubeDTO.videoid}
	              		</td>		              	
		              	<td>
		              		${youtubeDTO.tag1}</br>
		              		${youtubeDTO.tag2}</br>
		              		${youtubeDTO.tag3}</br>
		              	</td>
		              	<td>
							<c:if test="${youtubeDTO.status == 'ON'}">
								<button type="button" class="status btn btn-sm btn-secondary">
									ON
								</button>
							</c:if>
							<c:if test="${youtubeDTO.status == 'OFF'}">
								<button type="button" class="status btn btn-sm btn-outline-secondary">
									OFF
								</button>
							</c:if>
						<td>
							<button type="button" class="del btn btn-sm btn-outline-primary">
								삭제
							</button>
						<td>              	
		              	</td>
	           		</tr>
				</c:forEach>
			</tbody>
		</table>
		
	  	<br/>
	  	<form action="/manager/vodSearchList" method="post"  onsubmit="return valueCheck()">
   			<div style="width: 50%;">
		   		<div class="input-group mb-3">
					<input type="text" class="form-control" id="input" name="input" placeholder="검색어를 입력하세요" style="width: 60%;"/>
					<button class="btn btn-outline-secondary" type="submit" style="width: 15%;">
						검색
					</button>
				</div>
			</div>
		</form>	
	
		<br/>
		<div id="page">페이지  
			<c:if test="${startPage > pageBlock}">
				<a href="/manager/vod?pageNum=${startPage}-${pageBlock}"> [이전] </a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="/manager/vod?pageNum=${i}">${i}</a>
			</c:forEach>
			<c:if test="${endPage < totalPage}">
				<a href="/manager/vod?pageNum=${startPage}+${pageBlock}"> [다음] </a>
			</c:if>
		</div>
	</c:if>
	
</div>


<%@ include file="../../layout/footer.jsp"%>

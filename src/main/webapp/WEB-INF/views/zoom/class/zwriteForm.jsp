<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%> 

<!DOCTYPE html>
<html>
	<head>
		<title>강의등록 페이지</title>
	</head>
	
	<script>
		function nullcheck(){
			var n = document.zwriteForm;
			if(n.title.value == ""){
				alert("제목은 필수항목입니다");
				n.title.focus();
				return false;	
			}
			if(n.intro.value == ""){
				alert("내용은 필수항목입니다");
				n.intro.focus();
				return false;	
			}
			if(n.type.value == ""){
				alert("분야는 필수항목입니다");
				n.type.focus();
				return false;	
			}
			if(n.goal.value == ""){
				alert("목적은 필수항목입니다");
				n.goal.focus();
				return false;	
			}
			if(n.frequency.value == ""){
				alert("횟수는 필수항목입니다");
				n.frequency.focus();
				return false;	
			}
			if(n.price.value == ""){
				alert("가격은 필수항목입니다");
				n.price.focus();
				return false;	
			}
		}
	</script>
	
	<body>
		<div class="container">
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div class="row g-5">
					<div class="col-md-7 col-lg-8">
					
					<h4 class="mb-3">강의등록 신청서</h4>
					
					<form name="zwriteForm" onsubmit="return nullcheck();" method="post" action="/ddarawazoom/zwritePro"> 
					<div class="row g-3">
						<span class="border border-3">
							&nbsp;	
							<div class="col-12">
								<label for="c_id" class="form-label">- 코치닉네임</label>
								<input type="hidden" name="c_id" value="${sessionScope.c_id}">
								<input type="hidden" name="c_nick" value="${coachInfo.c_nick}" />
								<div class="form-control">${coachInfo.c_nick}</div>
							</div>
							&nbsp;
							<div class="col-12">
								<label for="title" class="form-label">- 강의제목</label>
								<input type="text" class="form-control" name="title" />
							</div>
							&nbsp;
							<div class="col-12">
								<label for="intro" class="form-label">- 강의소개</label>
								<textarea class="form-control" name="intro"></textarea>
							</div>
							&nbsp;
							<div class="col-12">
								<label for="type" class="form-label">- 강의분야</label>
								<select class="form-select" name="type">
									<option value=""></option>
									<option value="남성웨이트">남성웨이트</option>
									<option value="여성웨이트">여성웨이트</option>
									<option value="필라테스">필라테스</option>
									<option value="요가">요가</option>
									<option value="피트니스">피트니스</option>
									<option value="발레">발레</option>
									<option value="재활">재활</option>
									<option value="다이어트">다이어트</option>
								</select>
							</div>
							&nbsp;
							<div class="col-12">
								<label for="goal" class="form-label">- 강의목적</label>
								<select class="form-select" name="goal">
									<option value=""></option>
									<option value="전신">전신</option>
									<option value="코어">코어</option>
									<option value="상체">상체</option>
									<option value="하체">하체</option>
									<option value="재활">재활</option>
									<option value="근력">근력</option>
									<option value="심신안정">심신안정</option>
									<option value="스트레칭">스트레칭</option>
									<option value="스트레칭">다이어트</option>
								</select>
							</div>
							&nbsp;
							<div class="col-12">
								<label for="tool" class="form-label">- 필요장비</label>
								<input type="text" class="form-control" name="tool" />
							</div>
							&nbsp;
							<div class="col-12">
								<label for="frequency" class="form-label">- 운동횟수(ex-4주/주3회/20분)</label>
								<input type="text" class="form-control" name="frequency" />
							</div>
							&nbsp;	
							<div class="col-12">
								<label for="price" class="form-label">- 가격(원)</label>
								<input type="text" class="form-control" name="price" />
							</div>
							&nbsp;
							<div style="text-align:center;">
								<input type="submit" id="submit" class="btn btn-outline-primary" value="강의등록" />&nbsp;&nbsp;						
								<input type="reset" class="btn btn-outline-danger" value="다시작성" />&nbsp;&nbsp;	
								<input type="button" class="btn btn-outline-secondary" value="목록으로" onClick="javascript:window.location='/ddarawazoom/zoom'" />	
							</div>
							&nbsp;
						</span> 
					</div>	
					</form>	
					</div>
   	 			</div>  	 
  			</main>
		</div> 	 
	</body>
</html>
				
<%@ include file="../../layout/footer.jsp"%>
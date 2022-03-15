<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<title>멤버 한 명의 정보 페이지</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/manager/user.js" type="text/javascript" ></script>
	
	<link href="../../resources/css/manager/notice.css" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
</head>
<body>
	<div class="container">
    	<div class="row">
    		<h5 class="header-title pb-3 mt-0">- 멤버 정보 페이지- </h5>
		        <div class="col-xl-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="table-responsive">
		                    	<h6 class="header-title  mt-1">${userInfo.id} 님의 정보</h6>
		                        <table class="table table-hover mb-0">
		                            <thead>
		                                <tr class="align-self-center">
		                                	<th>Image</th>
		                                    <th>Name</th>
		                                    <th>Gender</th>
		                                    <th>Id</th>
		                                    <th>Pw</th>
		                                    <th>Nick</th>
		                                    <th>Email</th>
		                                    <th>Tel</th>
		                                    <th>Birh</th>
		                                    <th>Status</th>
		                                </tr>
		                            </thead>
			                        <tbody>
		                                <tr>
		                                	<td>
		                                		<img src="../../resources/image/upload/${userInfo.img}" class="memberImg" width="50px" height="50px" alt="img">
		                                	</td>
		                                    <td>${userInfo.name}</td>
		                                    <td>${userInfo.gender}</td>
		                                    <td>${userInfo.id}</td>
		                                    <td>${userInfo.pw}</td>
		                                    <td>${userInfo.nick}</td>
		                                    <td>${userInfo.email}</td>
		                                    <td>${userInfo.tel}</td>
		                                    <td>
		                                    	<fmt:formatDate var="member_birthday" pattern="yyyy년 MM월 dd일" value="${userInfo.birth}" />
		                                    	${member_birthday}
		                                    </td>
		                                    <td>${userInfo.status}</td>
		                                </tr>
			                        </tbody>
		                        </table>
		                    </div>
		                </div>
		                <div style="text-align:center; margin:0 auto;">
		                	<c:if test="${userInfo.status != '탈퇴'}">
	                        	<input type="button" class="btn btn-outline-black" onclick="userPw('${userInfo.id}');" value="비밀번호 수정"/>
	                        	<input type="button" class="btn btn-outline-black" onclick="userDelete('${userInfo.id}')" value="탈퇴등록하기"/>
                        	</c:if>
                        	<input type="button" class="btn btn-outline-black" onclick="window.location='/manager/user'" value="멤버관리 페이지 이동"/>
                        </div>
					</div>
	            </div>
	        </div>
	    </div>
	    
	    <c:if test="${myPayment == null }">
       		<table class="table table-hover mb-0">
       			<tr>
       				<th>결제한 내역이 없습니다.<br/>
       				</th>
       			</tr>
       		</table>
       	</c:if>
	    <c:if test="${myPayment != null}">
		    <div class="container">
	    		<div class="row">
			        <div class="col-xl-12">
			            <div class="card">
			                <div class="card-body">
			                    <div class="table-responsive">
			                    	<h6 class="header-title  mt-1">${memberInfo.id} 님의 결재 정보</h6>
			                        <table class="table table-hover mb-0">
			                            <thead>
			                                <tr class="align-self-center">
			                                    <th class="payNum">주문 번호</th>
												<th>강 의</th>
												<th>결제 금액</th>
												<th>환불 금액</th>
												<th>결제 시간</th>
												<th>상 태</th>
			                                </tr>
			                            </thead>
				                        <tbody>
				                        	<c:forEach var="myPayment" items="${myPayment}" >
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
									              			<button class="refundReqBtn btn btn-sm btn-outline-dark" data-toggle="modal" data-target="#refundModal">
								              					취소 요청
								              				</button> 
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
				                            </c:forEach>
				                        </tbody>
			                        </table>
			                    </div>
			                </div>
						</div>
		            </div>
		        </div>
		    </div>
		</c:if>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>
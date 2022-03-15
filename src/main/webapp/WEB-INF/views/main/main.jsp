<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>

<!-- content -->
<section class="masthead">
    <div class="container px-5">
    
		<div class="row gx-5 align-items-center">
            <div class="col-lg-6">
                <!-- Mashead text and app badges-->
                <div class="mb-5 mb-lg-0 text-center text-lg-start">
                    <h1 class="display-1 lh-1 mb-3">따라와Zoom</h1>
                    <p class="lead fw-normal text-muted mb-5">
                    	코치님과 1:1 온라인 운동, 실시간 화상 수업으로 시작하세요</br>
                    	혼자하는 개인 운동, 유투브 수업으로 시작하세요
                   	</p>                
                    <div class="d-flex flex-column flex-lg-row align-items-center">
                        <a class="me-lg-3 mb-4 mb-lg-0" href="/ddarawazoom/zoom">
                        	<button type="button" class="btn btn-secondary btn-lg vw-10">Zoom 강의</button>                        	
                       	</a>
                        <a class="me-lg-3 mb-4 mb-lg-0" href="/ddarawazoom/vod">
                        	<button type="button" class="btn btn-secondary btn-lg vw-10">Vod 강의</button>                        	
                       	</a>
                    </div>
				</div>
           	</div>
            
            <div class="col-lg-6">
                <!-- Masthead device mockup feature-->
                <div class="masthead-device-mockup">
					<svg class="circle" viewBox="0 0 100 100" overflow="visible" xmlns="http://www.w3.org/2000/svg">
                        <defs>
                            <linearGradient id="circleGradient" gradientTransform="rotate(45)">
                                <stop class="gradient-start-color" offset="0%"></stop>
                                <stop class="gradient-end-color" offset="100%"></stop>
                            </linearGradient>
                        </defs>
                        <circle cx="60" cy="50" r="70"></circle>
					</svg>
                    <svg class="shape-1 d-none d-sm-block" viewBox="0 0 240.83 240.83" xmlns="http://www.w3.org/2000/svg">
                    	<rect x="-32.54" y="78.39" width="305.92" height="84.05" rx="42.03" transform="translate(120.42 -49.88) rotate(45)"></rect>
                    	<rect x="-32.54" y="78.39" width="305.92" height="84.05" rx="42.03" transform="translate(-49.88 120.42) rotate(-45)"></rect>
                    </svg>
                    <svg class="shape-2 d-none d-sm-block" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
                    	<circle cx="50" cy="50" r="50"></circle>
                   	</svg>
                    <div class="device-wrapper position-absolute start-0">
                    	<img src="../../resources/image/main/main1.jpg"/>
                    </div>
                </div>
            </div>
            
		</div>
    </div>
</section>


<%@ include file="../layout/footer.jsp"%>
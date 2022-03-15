<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp"%>
    
<html>
<head>
	<title>멤버 Class 페이지</title>
	
	<link href='../../resources/css/class/main.css' rel='stylesheet' />
	<link href="../../resources/css/class/class.css" rel="stylesheet" />
	
	<script src='../../resources/js/class/main.js'></script>
	<script src="../../resources/js/class/class.js" type="text/javascript"></script>
	<script src="../../resources/js/class/class_zoom.js?ver=12" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
<style>
  #calendar {
    max-width: 900px;
    margin: 0 auto;
    postion: relative;
  }
</style>	

</head>
<body>
	<div id='calendar'></div>
	
	<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
   	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
</body>
</html>

<%@ include file="../../layout/footer.jsp"%>
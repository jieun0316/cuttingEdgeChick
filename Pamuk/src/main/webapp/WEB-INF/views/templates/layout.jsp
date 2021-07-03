<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>냉파먹 - 당신의 냉장고를 파먹자!!!</title>

<!-- Favicon -->
<!-- <link rel="icon" href="img/core-img/favicon.ico"> -->

<!-- Core Stylesheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

</head>
<body>
	<!-- 
		header. footer 만 있는 영역 
		(서브페이지에서 사용)
	-->
	
	<!-- Tiles header 영역 -->
	<tiles:insertAttribute name="header" />
	<!-- Tiles main 영역 -->
	<tiles:insertAttribute name="main" />
	<!-- Tiles footer 영역 -->
	<tiles:insertAttribute name="footer" />
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>   
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <!-- title이 null인 경우는 무시된다 -->
  <title><tiles:insertAttribute name="title" ignore="true" /></title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<%--   <link rel="stylesheet"  type="text/css" 
href="${pageContext.request.contextPath}/resources/css/home2.css" > --%>
  
</head>
<body>
	<div id="header">
	<!-- Tiles header 영역 -->
	<tiles:insertAttribute name="header" />
	</div>
	<div class="container-fluid text-center">    
     <div class="row content">
    <div id="left" class="col-sm-3 sidenav" >
    <!-- Tiles left 영역 -->
    <tiles:insertAttribute name="left" />
    </div>
	<div id="main" class="col-sm-7 text-left">
	<!-- Tiles main 영역 -->
	<tiles:insertAttribute name="main" />
	</div>
	<div id="right" class="col-sm-2 sidenav">
	<!-- Tiles right 영역 -->
	<tiles:insertAttribute name="right" />
	</div>
	</div>
	</div>
	<div id="footer">
	<!-- Tiles footer 영역 -->
	<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>











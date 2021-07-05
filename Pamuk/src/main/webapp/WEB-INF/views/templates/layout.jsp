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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pamuk.css">

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
</body>
</html>











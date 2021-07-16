<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>냉장고 등록</title>

<style type="text/css">
.bgImage {background-image: url(/img/fridge1.jpg); padding: 100px;}
.bigText {text-align: center;font-size: 32px; color:white; }
 input[type=number]{width:100px;height:70px;color:black;text-align: center}/

</style>
</head>
<body>
	<div class="container bgImage">
	 <div id="left" class="col-sm-4 bigText"  >
    	<h1>냉장고 등록</h1><br>
    	<form action="registerStorage">
	냉장 <input type="number" name="fridge" value="1"> 칸<br> 
	냉동 <input type="number" name="freezer" value="1"> 칸<br> 
	실온 <input type="number" name="room" value="1"> 칸<br> <br>
	<input type="submit" class="btn btn-warning btn-lg btn-block" value="스토리지 생성"><br> 
	
	</form>
		
    </div>
	</div>
</body>
</html>
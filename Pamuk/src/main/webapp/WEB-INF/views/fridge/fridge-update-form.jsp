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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div id="left" class="col-sm-4 ">
	<h2>냉장고 칸별 조회</h2>
  	<p>칸별로 어떤 재료가 있는지 확인, 추가, 수정, 삭제하세요</p>

  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#fridge">냉장</a></li>
    <li><a data-toggle="tab" href="#fridge1">냉장 1</a></li>
    <li><a data-toggle="tab" href="#fridge2">냉장 2</a></li>
    <li><a data-toggle="tab" href="#fridge3">냉장 3</a></li>
  </ul><br><br>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">냉동</a></li>
    <li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
    <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
  </ul><br><br>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">실온</a></li>
    <li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
  </ul><br><br>
  </div>
		
<%-- 	<c:forEach item="${storage}" var="s" varStatus="status"> 
	<input type="radio" name="storage" value="냉장+${status.count}"> 
	</c:forEach> --%>

	
	<div class="tab-content col-sm-8">
	<div id="fridge" class="tab-pane fade in active">
	<h3>냉장 전체</h3>
	<table class="table">
	<thead class="thead-light">
	<tr><th>삭제</th><th>식재료명</th><th>수정</th><th>위치</th><th>수량</th><th>보관날짜</th><th>유통기한</th></tr>
	</thead>
	<tbody>
	<tr><td><input type="checkbox" id=""></td>
	<td>소고기</td>
	<td><button type="button">수정</button></td>
	<td>냉장1</td>
	<td>600g</td>
	<td>6월30일</td>
	<td>7월10일</td>
	</tr>
	<tr><td><input type="checkbox" id=""></td>
	<td>우유</td>
	<td><button type="button">수정</button></td>
	<td>냉장2</td>
	<td>1팩</td>
	<td>6월30일</td>
	<td>7월05일</td>
	</tr>
	<tr><td colspan="6"><a href="#">+새로 만들기</a></td></tr>
	</tbody>
	</table>
	<input type="submit" value="등록">
	<input type="submit" value="삭제">
	</div>
	
	<div id="fridge1" class="tab-pane fade">
	<h3>냉장 1</h3>
	</div>
	<div id="fridge2" class="tab-pane fade">
	<h3>냉장 2</h3>
	</div>
	<div id="fridge3" class="tab-pane fade">
	<h3>냉장 3</h3>
	</div>
	</div>
	</div>
</body>
</html>
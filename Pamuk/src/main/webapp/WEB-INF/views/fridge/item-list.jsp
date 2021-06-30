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
	<h2>재료 검색</h2>
  <p>재료이름을 검색하세요</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    //    $("#veg input[type=checkbox]").filter(function() {
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

	
	<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#meat">정육/계란류</a></li>
  <li><a data-toggle="tab" href="#veg">채소</a></li>
  <li><a data-toggle="tab" href="#fruit">과일</a></li>
</ul>

<div class="tab-content">
  <div id="meat" class="tab-pane fade in active">
    <table>
    <thead><tr><th>정육/계란류</th></tr></thead>
    <tbody id="myTable">
    <c:forTokens  var="item" items="계란,알류,소고기,돼지고기,닭고기,오리고기,양념육,가공육" delims=",">
	<tr><td>${item}</td></tr>
	</c:forTokens>
	</tbody>
	</table>
  </div>
  <div id="veg" class="tab-pane fade">
	<p>
	<c:forTokens  var="item" items="두부,콩나물,숙주나물,고구마,감자,양파,마늘,파,생강,오이,가지,호박,옥수수,상추,깻잎,쌈채소,고추,피망,파프리카,시금치,부추,나물,양배추,양상추,브로콜리,샐러드,어린잎채소,당근,우엉,연근,마,버섯,배추,무,김장채소,아스파라거스,허브류,인삼,더덕,도라지,약선재료" delims=",">
	<input type="checkbox" id="${item}">${item}
	</c:forTokens>
    </p>  
    </div>
  <div id="fruit" class="tab-pane fade">
    <p>
    <c:forTokens  var="item" items="사과,배,감귤,만감류,수박,멜론,참외,토마토,딸기,키위,블루베리,포도,자두,복숭아,감,곶감,바나나,파인애플,오렌지,자몽,레몬,망고,열대과일,체리,석류,아보카도" delims=",">
	<input type="checkbox" id="${item}">${item}
	</c:forTokens>
    </p>
  </div>
</div>
	
	</div>
</body>
</html>
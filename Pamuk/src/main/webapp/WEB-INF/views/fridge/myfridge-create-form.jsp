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
<style>
th,td{padding:15px;}
table{border-spacing:10px;}
</style>

<script type="text/javascript">
	//alert(1);
	$(document).ready(function(){
		$("#storageCnt").change(function(){
			let num = $(this).val();
			//alert(num);
			let info =""
			for (let i=0;i<num;i++){
			info+='<tr><td>'+(i+1)+'번째칸<br><span id='+'"storage'+(i+1)+'"></span></td></tr>';
			//$("#test").append("<td><tr>"+(i+1)+"번째칸</tr></td>");
			};//for문
			//alert(info);
			$("#containers").html(info);
			});
	
		$("#addFood").click(function(){
			let conNo=$("#containerNo").val();
			if (conNo>$("#storageCnt").val()){
				alert("존재하지 않는 칸입니다");
				return;
			}
			let food=$("#food").val().split(" ");
			$("#food").val('');
			$("#foodDetailForm")[0].reset();
			if (food=="")
				return;
			let containerId="storage"+conNo;
			$("#"+containerId).append(food+",");
		});
		$("#deleteFood").click(function(){
			let conNo=$("#containerNo").val();
			let containerId="storage"+conNo;
			$("#"+containerId).empty();
		});
	
	});//function
</script>
</head>
<body>
	<div class="container">
	<h3>냉장고 등록하기</h3>
	1.냉장고가 몇칸인가요?(서랍포함)
	<select id="storageCnt">
	<option value="">선택</option>
	<% for(int i=1;i<10;i++) {%>
	<option value="<%=i%>"><%=i%></option>
	<%} %>
	</select>

<table border="1" width="300" height="400" background="" >
	<thead>
		<tr>
			<th>나의 냉장고</th>
		</tr>
	</thead>
	<tbody id="containers" bgcolor="white"></tbody>
</table>


2.냉장고 속 재료들을 하나씩, 또는 공백 기준으로 모두 입력해주세요<br>

(1)칸별 
<div id="">
<select id="containerNo">
	<option value="">선택</option>
	<% for(int i=1;i<10;i++) {%>
	<option value="<%=i%>"><%=i%></option>
	<%} %>	 
	</select>		
<form action="" id="foodDetailForm">																																																																																																																																																																																																																																																																																																		
<input type="text" name="" id="food" placeholder="재료명">
<input type="text" name="" placeholder="식군명">
<input type="text" name="" placeholder="유통기한">
<input type="button" value="재료추가" id="addFood">
<input type="button" value="다시입력" id="deleteFood"><br><br>
</form>		
</div>
(2)식군별
식군, 칸과 재료를 쉼표기준으로 하나씩 입력해주세요<br>
<input type="text" name="" placeholder="식군명">
<input type="text" name="" id="food2" placeholder="재료명">
<input type="text" name="" placeholder="유통기한">
<input type="button" value="재료추가" id="addFood2">
<input type="button" value="다시입력" id="deleteFood2"><br><br>

정산할 멤버들을 선택해주세요
<!-- <select id="friend"></select>
 -->
 <form id="memberForm">
 <div id="testDiv">
 </div>
  <input type="checkbox" id="allCheck">모두<br>
  </form>
  <br>

	</div>
</body>
</html>
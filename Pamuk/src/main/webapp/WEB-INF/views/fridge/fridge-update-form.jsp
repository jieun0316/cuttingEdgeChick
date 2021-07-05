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
<script type="text/javascript">

	$(document).ready(function(){
		

		$("li").bind("click",function(){
			let storageNo=$(this).children('input').val();
			let storageName=$(this).children('a').text();
			$.ajax({
				type:"get",
				url:"getStoredItemByStorageNo",
				dataType:"json",
				data:"storageNo="+storageNo,
				success:function(ja){
					let row="";
					for (let i=0;i<ja.length;i++){
					row+="<tr><td><input type='checkbox' id=''></td>";
					row+="<td>"+ja[i].itemName+"</td>";
					row+="<td><button type='button'>수정</button></td>";
					row+="<td>"+storageName+"</td>";
					row+="<td>"+ja[i].qty+"</td><td>"+ja[i].storedDate+"</td><td>"+ja[i].expiryDate+"</td></tr>";
					}
					//row+="<tr><td colspan='6'><a href='#' id='test1'>+새로 만들기</a></td></tr> ";
					$("#storedItemInfo").html(row);
				}//callback
			});//ajax 
		});
		$("#test1").bind("click",function(){
			window.open("item-list","popuptest","width = 500, height = 500, top = 100, left = 200, location = no")
		});
		
	})
</script>
</head>
<body>
<div class="container">
	<div id="left" class="col-sm-4 ">
	<h2>냉장고 칸별 조회</h2>
  	<p>칸별로 어떤 재료가 있는지 확인, 추가, 수정, 삭제하세요</p>

  <!-- 냉장고칸별탭 -->
  	<ul class="nav nav-tabs">
   	 <li class="active"><a data-toggle="tab" href="#all">전체보기</a></li>
    	<c:forEach items="${myStorage}" var="s">
    		<li>
    		<a data-toggle="tab" href="#fridge">${s.type}${s.locationNo}</a>
    		<input type="hidden" value="${s.storageNo}">
    		</li>
   	 	</c:forEach>
    </ul>
  	</div>

	
	<div class="tab-content col-sm-8">
	<div id="all" class="tab-pane fade in active">
	냉장고 모든 재료만? + 이름과 수량/위치만?
	</div>
	
	<div id="fridge" class="tab-pane fade"> <!-- class 에 in active  -->

	<table class="table">
	<thead class="thead-light">
	<tr><th>삭제</th><th>식재료명</th><th>수정</th><th>위치</th><th>수량</th><th>보관날짜</th><th>유통기한</th></tr>
	</thead>
	<tbody id="storedItemInfo">
	</tbody>
	</table>
	<a href='#' id='test1'>+새로 만들기</a><br><br>
	<input type="submit" value="등록">
	<input type="submit" value="삭제">
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
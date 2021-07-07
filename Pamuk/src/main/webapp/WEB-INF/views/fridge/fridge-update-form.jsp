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
	let storageNo="";
	let storageName="";
	$(document).ready(function(){

		$("li").bind("click",function (){
			storageNo=$(this).children('input').val();
			let storageName=$(this).children('a').text();
			
			$.ajax({
				type:"get",
				url:"getStoredItemByStorageNo",
				dataType:"json", 
				data:{"storageNo": storageNo},
				success:function(ja){
					let row="<input type='hidden' name='currentStorageNo' value='"+storageNo+"'>";
					row+="<input type='hidden' name='currentStorageName' value='"+storageName+"'>";
					for (let i=0;i<ja.length;i++){
					row+="<tr><td><input type='checkbox' ></td>";
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
		//$("#storedItemInfo").on("click","#test1",function(){
			$("#test1").click(function(){
			window.open("item-list","popuptest","width = 500, height = 500, top = 100, left = 200, location = no");
			
			});
			
			$("#newItemInfo").on("click",".storeItemBtn",function(){
			//let itemName = $("#newItemInfo input:hidden[name=itemName]").val();
 			/*let itemName=$(this).parent().parent().children().eq(1).text();
			let qty=$(this).parent().parent().children().eq(4).text();
			let qty=$(this).parent().parent().find('input[name=qty]').val();
			let storedDate=$(this).parent().parent().children().eq(7).text();
			 */
			
		$.ajax({
				type:"post",
				url:"storeItem",
				data:$("#storeItemForm").serialize(),
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success:function(ja){
					$("#newItemInfo").html('');
					let row="<input type='hidden' name='currentStorageNo' value='"+storageNo+"'>";
					for (let i=0;i<ja.length;i++){
					row+="<tr><td><input type='checkbox' ></td>";
					row+="<td>"+ja[i].itemName+"</td>";
					row+="<td><button type='button'>수정</button></td>";
					row+="<td>"+storageName+"</td>";
					row+="<td>"+ja[i].qty+"</td><td>"+ja[i].storedDate+"</td><td>"+ja[i].expiryDate+"</td></tr>";
					}
					$("#storedItemInfo").html(row);
				}//callback
			}); 
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
    		<input type="hidden"  value="${s.storageNo}">
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
	  <colgroup>
	  <col width="10%" style="background: red" />
	  <col width="15%" />
	  <col width="10%" />
	  <col width="10%" /> 
	  <col width="15%" />
	  <c:forEach begin="0" end="2">
      <col width="20%" />
      </c:forEach>
  	  </colgroup>
	<thead class="thead-light">
	<tr><th>삭제</th><th>식재료명</th><th>수정</th><th>위치</th><th>수량</th><th>보관날짜</th><th>유통기한</th></tr>
	</thead>
	<tbody id="storedItemInfo" >
	</tbody>
	</table>
	
	<form id="storeItemForm">
	<table class="table">
	<colgroup>
	  <col width="10%" style="background: red" />
	  <col width="15%" />
	  <col width="10%" />
	  <col width="10%" /> 
	  <col width="15%" />
	  <c:forEach begin="0" end="2">
      <col width="20%" />
      </c:forEach>
  	  </colgroup>
	<tbody id="newItemInfo">
	</tbody>
	</table>
	</form>
	
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
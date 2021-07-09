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
let storageName="";
let storageNo="";
 function showList (ja) {
		let row="<input type='hidden' name='currentStorageNo' value='"+storageNo+"'>";
		row+="<input type='hidden' name='currentStorageName' value='"+storageName+"'>";
		for (let i=0;i<ja.length;i++){
		row+="<tr><td><input type='checkbox' value='"+ja[i].storedItemNo+"' name='delete'></td>";
		row+="<td>"+ja[i].itemName+"</td>";
		row+="<td><input name='update' type='button' value='수정'/></td>";
		row+="<td>"+storageName+"</td>";
		row+="<td name='td2'>"+ja[i].qty+"</td><td name='td3'>"+ja[i].storedDate+"</td><td name='td4'>"+ja[i].expiryDate+"</td></tr>";
		row+="<input type='hidden' name='storedItemNo' value='"+ja[i].storedItemNo+"'>";
		
		}
		$("#storedItemInfo").html(row);
		}

	$(document).ready(function(){
		
		/* 냉장고 칸 탭 눌렀을 때 */
		$("li").on("click",function(){
			$("#newItemInfo").html('');
			storageNo=$(this).children('input').val();
			storageName=$(this).children('a').text();
			$.ajax({
				type:"get",
				url:"getStoredItemByStorageNo",
				dataType:"json",
				data:"storageNo="+storageNo,
				success:function(ja){
					showList(ja);
				}//callback
			});//ajax 	
		});//click
		
		/*재료 삭제버튼 클릭시 */
		$("#deleteBtn").click(function() {
			let ma = $("input:checkbox[name='delete']:checked");
			let deleteArray=[];
			//체크된 리스트 저장
             ma.each(function(i){
            	 deleteArray.push($(this).val());
             });

            let params={"deleteArray":deleteArray, "storageNo" : storageNo};
             $.ajax({
					type:"post",
					url:"checkboxDelete",
					data: JSON.stringify(params), 
					dataType: 'json',
					//배열을 json 형태로 보내주기 떄문에, 스프링 부트에서 컨텐트 타입 명시가 필요 
					contentType: 'application/json; charset=utf-8', 
					success : function(ja){
						showList(ja);
						}
				}); 
		});
		
		/* 재료 수정버튼 클릭시 */
		$("#storedItemInfo").on("click","input[name='update']", function (){
			if ($(this).val()=="수정완료"){
				let updateBtn = $(this);
				let tableBtn = $(this).parent().parent();
			
				$.ajax({
					type:"post",
					url:"getStoredItemByStorageNoUpdate",
					data:{'storedItemNo':$("input[name='storedItemNo']").val(), 'qty':$("input[name='qty']").val(), 'storageVO.storageNo': storageNo,
						'storedDate':$("input[name='storedDate']").val(),'expiryDate':$("input[name='expiryDate']").val()},
					dataType :"json", 
					success : function(kj){
						updateBtn.val("수정");		
						tableBtn.find("td[name='td2']").html(kj.qty);
						tableBtn.find("td[name='td3']").html(kj.storedDate);
						tableBtn.find("td[name='td4']").html(kj.expiryDate);
						}
				}); 
			}			
			else{
				$(this).parent().parent().find(":input[name='update']").val("수정완료");
				$(this).parent().parent().find("td[name='td2']").html("<input type='text' name='qty' value='' placeholder='수량' size=8>");
				$(this).parent().parent().find("td[name='td3']").html("<input type='date' name='storedDate' value='"+$("td[name='td3']").text()+"'size=8>");
				$(this).parent().parent().find("td[name='td4']").html("<input type='date' name='expiryDate' value='"+$("td[name='td4']").text()+"'size=8>");		
			}	
		});
		//
		
		//전체등록 버튼 누를시
		$("#storeAllBtn").click(function(){
			$.ajax({
					type:"post",
					url:"storeItems",
					data:$("#storeItemForm").serialize(),
					dataType:"json",
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success:function(ja){
						$("#newItemInfo").html('');
						showList(ja);
					}//callback
				}); 
				});

		//
		
		
		//새로만들기 버튼 클릭 - 재료 선택 팝업창 띄우기
		$("#new").on("click",function(){
			window.open("item-list","popuptest","width = 500, height = 500, top = 100, left = 200, location = no")
		});
		
	})
</script>
</head>
<body>

<!-- <input type="text">
<input type="text"> -->
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
	  <colgroup>
	  <col width="10%" />
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
	  <col width="10%" />
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
	
	<a href='#' id='new'>+새로 만들기</a><br><br>
	<input type="button" id="storeAllBtn" value="전체등록">
	<input type="submit" value="삭제" id="deleteBtn">
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- JSTL 사용 가능  -->
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> <!--시큐리티  -->
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
	
<title>Insert title here</title>

<!-- Security MemberId 적용중 -->
<sec:authentication var="mvo" property="principal" /> <!-- 세션값을 MVO로  -->

<script type="text/javascript">
	//모든 Ajax Post 요청에 대해 Http 헤더에 CSRF 토큰을 설정

	$.ajaxPrefilter(function(options) {

		let headerName = '${_csrf.headerName}';

		let token = '${_csrf.token}';

		if (options.type.toLowerCase() === 'post') {
			options.headers = {};
			options.headers[headerName] = token;
		}
	});
</script>

<script type="text/javascript">
let storageName="";
let storageNo="";         
 function showList (ja) {
	 	if (ja.length==0){
			let row="<input type='hidden' name='currentStorageNo' value='"+storageNo+"'>";	 		
			row+="<input type='hidden' name='currentStorageName' value='"+storageName+"'>";
			$("#storedItemInfo").html(row);
	 	} else {
		let row="<input type='hidden' name='currentStorageNo' value='"+storageNo+"'>";
		row+="<input type='hidden' name='currentStorageName' value='"+storageName+"'>";
		for (let i=0;i<ja.length;i++){
		row+="<tr name='tableTr' value='Hello'><td><input type='checkbox' value='"+ja[i].storedItemNo+"' name='delete'></td>";
		row+="<td>"+ja[i].itemName+"</td>";
		row+="<td><input name='update' type='button' value='수정'/></td>";
		row+="<td>"+storageName+"</td>";
		row+="<td name='td2'>"+ja[i].qty+"</td><td name='td3'>"+ja[i].storedDate+"</td><td name='td4'>"+ja[i].expiryDate+"</td>";
		row+="<input type='hidden' name='storedItemNo' value='"+ja[i].storedItemNo+"'>";
		$.ajax({
			type:"get",
			url :"showRemingDay",
			dataType:"json",
			data:"storedItemNo="+ja[i].storedItemNo,
			async:false,
		/* 	error:function(error){
				alert("error!");
				//$("#storedItemInfo").html(row);	
			}, */
			success:function(ga){
				
				if(ga<0) {
					row+="<td bgcolor='132012'></td></tr>";
				} else if(ga<8)  {
					row+="<td bgcolor='E49A17'></td></tr>";
				} else{
					row+="<td bgcolor='40CC0C'></td></tr>";
				} //2-else
				$("#storedItemInfo").html(row);	

					} // ga function
					
				}); //ajax		

			} //for
	 	  } //1-else  
		} //showList


	$(document).ready(function(){	
		/* 냉장고 칸 탭 눌렀을 때 */
		$("li").on("click",function(){
			$("#storedItemInfo").html('');
			$("#newItemInfo").html('');
			storageNo=$(this).children('input').val();
			storageName=$(this).children('a').text();
			if (storageName=="전체보기"){
				alert("storage_no별 보관된 아이템 목록 유통기한임박순으로 한줄에 출력");
				/* let storageArray=new Array();
				<c:forEach items='${myStorage}' var='s'>
				storageArray.push(${s.storageNo});
				</c:forEach> */
				$.ajax({
					type:"get",
					url:"getTotalStoredItemList",
					dataType:"json",
					data:storageArray,
					
				});
				}
			else{
			$.ajax({
				type:"get",
				url:"getStoredItemByStorageNo",
				dataType:"json",
				data:"storageNo="+storageNo,
				success:function(ja){
					showList(ja);
				}//callback
			});//ajax 	
		}//else
		});//click
		
		/*재료 삭제버튼 클릭시 */
		$("#deleteBtn").click(function() {
			let ma = $("input:checkbox[name='delete']:checked");
			if (ma.length==0){
				alert("선택된 항목이 없습니다");
				return;
			}
			if(!confirm("삭제하시겠습니까?"))
				return false;	
			let deleteArray=[];					
			//체크된 리스트 저장
             ma.each(function(i){
            	 deleteArray.push($(this).val());
             });
		 	/* for(let i=0; i<ma.length; i++){
				alert($(ma[i]).val());
			} */
			 
			 for(let i=0; i<ma.length; i++){
				if($(ma[i]).val()==null||$(ma[i]).val()=="on"){
					 $("input:checkbox[name='delete']:checked").parent().parent("tr").remove();
				} else {
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
								} //ja
						}); //ajax
		        
				} //else
			} //for           
		}); //deleteBtn
		
		/* 재료 수정버튼 클릭시 */
		$("#storedItemInfo").on("click","input[name='update']", function (){
			let updateBtn = $(this);
			let btnTr = $(this).parent().parent();
			if ($(this).val()=="수정완료"){
				$.ajax({
					type:"post",
					url:"getStoredItemByStorageNoUpdate",
					data:{'storedItemNo':$("input[name='storedItemNo']").val(), 'qty':$("input[name='qty']").val(), 'storageVO.storageNo': storageNo,
						'storedDate':$("input[name='storedDate']").val(),'expiryDate':$("input[name='expiryDate']").val()},
					dataType :"json", 
					success : function(kj){
						updateBtn.val("수정");		
/* 						btnTr.find("td[name='td2']").html(kj.qty);
						btnTr.find("td[name='td3']").html(kj.storedDate);
						btnTr.find("td[name='td4']").html(kj.expiryDate); */
						showList(kj); //
						}
				}); 
			}			
			else{
				updateBtn.val("수정완료");
				btnTr.children('td').eq(4).html("<input type='text' name='qty' value='"+btnTr.children('td').eq(4).html()+"' size=8>");
				btnTr.children('td').eq(5).html("<input type='date' name='storedDate' value='"+btnTr.children('td').eq(5).html()+"' size=8>");
				btnTr.children('td').eq(6).html("<input type='date' name='expiryDate' value='"+btnTr.children('td').eq(6).html()+"' size=8>");
				//$(this).parent().parent().find("td[name='td4']").html("<input type='date' name='expiryDate' value='"+$("td[name='td4']").text()+"'size=8>");		
			}	
		});
		//
		
		//전체등록 버튼 누를시
		$("#storeAllBtn").click(function(){
	       /*   if($("input[name='expiryDate']").val()==undefined){
	        	 alert("값을 넣어줘용");
	         } */
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
					}); //ajax
				}); // storeAllBtn

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
	   <h4>칸별 재료 목록(유통기한 순)</h4><hr>
   <c:forEach items="${totalItemList}" var="storage">
      <c:forEach items="${myStorage}" var="s">
            <c:if test="${storage.STORAGE_NO == s.storageNo}">
               ${s.type}${s.locationNo} : ${storage.ITEM_LIST} <hr>
            </c:if>
          </c:forEach>
   </c:forEach>
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
      <col width="15%" />
      </c:forEach>
      <col width="10%" />
  	  </colgroup>
	<thead style="background-color: Lavender;">
	<tr><th>선택</th><th>식재료명</th><th>수정</th><th>위치</th><th>수량</th><th>보관날짜</th><th>유통기한</th><th>신선도</th></tr>
	</thead>
	<tbody id="storedItemInfo" style="background-color: LightCyan;">
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
      <col width="15%" />
      <col width="25%" />
  	  </colgroup>
	<tbody id="newItemInfo" style="background-color: PapayaWhip;">
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
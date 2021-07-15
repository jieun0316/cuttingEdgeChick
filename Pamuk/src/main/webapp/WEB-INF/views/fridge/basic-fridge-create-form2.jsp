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
	//품목추가 버튼을 누르면 #items span에 표시
	$("#btn1").click(function(){
		$("#items").append($("#inputItems").val()+"<input type='text' class='small' placeholder='수량'><input type='text' class='small' placeholder='유통기한'><input type='text' class='small' placeholder='보관칸'><br>");
		$("#inputItems").val('');
	});
	//대분류를 고르면 분류에 해당되는 품목들 체크박스가 생성된다
	$("#selectCat").change(function(){
		let value=$(this).val();
		let checkboxCode="";
		let catItems=[];
		if (value=="채소류")
			catItems=["양배추","당근","양파","호박","대파","콩나물","버섯"];
		if (value=="육류")
			catItems=["소고기","닭고기","돼지고기"];
		if (value=="어패류")
			catItems=["오징어","조개","회"];
		if (value=="음료")
			catItems=["탄산음료","주스","맥주","소주","와인"];
		if (value=="과실류")
			catItems=["사과","수박","방울토마토","참외","키위"];
		if (value=="조미료류")
			catItems=["케찹","머스타드","참기름","마요네즈"];
		if (value=="반찬")
			catItems=["시금치무침","콩나물무침","김치","장조림"];
		if (value=="계란")
			catItems=["계란"];
		if (value=="기타")
			catItems=["남은배달음식"];
		for (let item of catItems){
			checkboxCode+="<input type='checkbox' name='item' value='"+item+"'>"+item+"<br>";
			}
		$("#catItems").html(checkboxCode);
		});
	//품목추가2 버튼을 누르면 체크한 항목들 #items span에 표시
	$("#btn2").click(function(){
		let ia=$("#checkForm :checkbox[name=item]:checked");
		for (let i=0;i<ia.length;i++){
			//alert($(ia[i]).val());
			$("#items").append($(ia[i]).val()+
					"<input type='text' class='small' placeholder='수량'><input type='text' class='small' placeholder='유통기한'><input type='text' class='small' placeholder='보관칸'><br>");
		}
	});
	
})
	

</script>
<style type="text/css">
th,td{padding:15px;}
table{border-spacing:10px;}
/*input[type=text]{width:100px;}*/
input[type=checkbox]{width:100px;}
.small{width:70px;}
</style>
</head>
<body>
	<div class="container">
	
	<h3>냉장고 등록하기</h3>
	<table width="300" height="400" border="5" >
	<tr><th>나의 냉장고</th></tr>
	<tr>
		<td>
			
			
			냉장고 속 음식들을 식군별로 선택하세요 
			<select id="selectCat">
			<option value="">분류</option>
			<c:forTokens  var="category" items="채소류,육류,계란,어패류,과실류,음료,조미료류,반찬,기타" delims=",">
			<option value="${category}">${category}</option>
			</c:forTokens>
			</select>
			
			
			<form id="checkForm" >
			<div id="catItems"></div>
			</form>
			<br>
			<input type="button" id="btn2" value="품목추가2"><br><br>
			
			또는 직접 입력하세요 <br>
			<input type="text" id="inputItems">
			<input type="button" id="btn1" value="품목추가"><br><br>

			<form id="detailForm">			
			<span id="items"></span>
			</form>
			<input type="button" id="btn3" value="등록"><br>
		</td>
	</tr>
	</table>
	</div>
</body>
</html>
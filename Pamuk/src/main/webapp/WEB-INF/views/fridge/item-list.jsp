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
  <p>이름으로 검색</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  
  
  
  <script type="text/javascript">
$(document).ready(function(){
	//재료 검색창에 문자 입력시 필터
	$("#myInput").on("keyup", function() {
    	var value = $(this).val().toLowerCase();
    	$("#totalItems input:checkbox").filter(function() {
      		$(this).toggle($(this).val().toLowerCase().indexOf(value) > -1);
     		$(this).next().toggle($(this).val().toLowerCase().indexOf(value) > -1);
    	});
  	});
	
	//추가버튼 클릭시 체크된 항목들을 입력폼과함께 부모창의 테이블에 추가한다
	$("#addBtn").click(function(){
		//let info=$(this).parent().children().eq(0).text(); // 뭐때문에 가져왔지?
		let storageName = $("#storedItemInfo input:hidden[name=currentStorageName]" , opener.document ).val();
		// storageName 다르게 가져오는 방법 : $("#storedItemInfo tr td:eq(3)" , opener.document ).text();
		let storageNo= $("#storedItemInfo input:hidden[name=currentStorageNo]" , opener.document ).val();
  		let ia = $("input:checkbox:checked");
	  	let row="";
		for (let i=0;i<ia.length;i++){
			row+="<tr><td><input type='checkbox'></td>";
			row+="<td>"+$(ia[i]).val()+"</td>";
			row+="<input type='hidden' name='itemName' value='"+$(ia[i]).val()+"'>";
			row+="<td><button type='reset' '>리셋</button></td>";
			row+="<td>"+storageName+"</td>";
			//아래 storageNo는 StoredItemVO 매핑을 위해선 storageVO.storageNo 로 써줘야함
			row+="<input type='hidden' name='storageNo' value='"+storageNo+"'>";
			row+="<td><input type='text' name='qty'  style='width:80px;'></td><td><input type='date' name='storedDate' style='width:100px;'></td><td><input type='date' name='expiryDate' style='width:100px;'></td>"; 
	  		row+="</tr>";
			$("#items").append($(ia[i]).val()+" ");
		}
		//
		$(opener.document).find("#newItemInfo").append(row);
		$("input:checkbox:checked").prop("checked", false);
  		});
	});
</script>
	
	<ul class="nav nav-tabs">
<%-- 	<c:forEach items=${category} var="cat" varStatus="status"> 
	  <li ><a data-toggle="tab" href="#category${status.count}">정육/계란류</a></li>
	</c:forEach> --%>
<li class="active"><a data-toggle="tab" href="#totalItems">전체보기</a></li>
  <li ><a data-toggle="tab" href="#meat">정육/계란류</a></li>
  <li><a data-toggle="tab" href="#veg">채소</a></li>
  <li><a data-toggle="tab" href="#sauce">소스</a></li>
  <li><a data-toggle="tab" href="#sauce2">장류/양념/가루/오일</a></li>
    <li><a data-toggle="tab" href="#fish">수산물/건해산</a></li>
      <li><a data-toggle="tab" href="#milk">우유/유제품/유아식</a></li>
  <li><a data-toggle="tab" href="#other1">리면/면류/즉석식품/통조림</a></li>
	  <li><a data-toggle="tab" href="#other2">기타</a></li>
</ul>

<div class="tab-content">
<!--    <div id="all1" class="tab-pane fade in active"> -->
<div id="totalItems" class="tab-pane fade in active">
	<c:forTokens  var="item" items="계란,알류,소고기,돼지고기,닭고기,오리고기,양념육,가공육" delims=",">
	<input type="checkbox" value="${item}"><span>${item}</span>
	</c:forTokens>
	<c:forTokens  var="item" items="두부,콩나물,숙주나물,고구마,감자,양파,마늘,파,생강,오이,가지,호박,옥수수,상추,깻잎,쌈채소,고추,피망,파프리카,시금치,부추,나물,양배추,양상추,브로콜리,샐러드,어린잎채소,당근,우엉,연근,마,버섯,배추,무,김장채소,아스파라거스,허브류,인삼,더덕,도라지,약선재료" delims=",">
	<input type="checkbox" value="${item}"><span>${item}</span>
	</c:forTokens>
	 <c:forTokens  var="item" items="사과,배,감귤,만감류,수박,멜론,참외,토마토,딸기,키위,블루베리,포도,자두,복숭아,감,곶감,바나나,파인애플,오렌지,자몽,레몬,망고,열대과일,체리,석류,아보카도" delims=",">
	<input type="checkbox" value="${item}"><span>${item}</span>
	</c:forTokens>
	<c:forTokens  var="item" items="쌈장,파스타소스,페스토,케찹,마요네즈,디핑소스,돈까스소스,스테이크소스,중식소스,일식소스,샐러드 드레싱,시럽" delims=",">
	<input type="checkbox" value="${item}"><span>${item}</span>
	</c:forTokens>
	<c:forTokens  var="item" items="고추장,된장,소금,설탕,후추,향신료,조미료,액젓,물엿,식초,식용유,참기름,오일류,밀가루,분말류" delims=",">
	<input type="checkbox" value="${item}"><span>${item}</span>
	</c:forTokens>
	<c:forTokens  var="item" items="라면,즉석면요리,파스타면,생면,건면,즉석밥,즉석요리,참치,스팸,축수산통조림,옥수수통조림,피클,과일통조림" delims=",">
	<input type="checkbox" value="${item}"><span>${item}</span>
	</c:forTokens>
	<c:forTokens  var="item" items="쌀,잡곡,견과,과자,시리얼,빙과,떡,베이커리,건강식품,냉장식품,냉동식품,간편식,밀키트,김치,반찬,생수,음료,주류,커피,원두,차" delims=",">
	<input type="checkbox" value="${item}"><span>${item}</span>
	</c:forTokens>
	<c:forTokens  var="item" items="채우기" delims=",">
	<input type="checkbox" value="${item}"><span>${item}</span>
	</c:forTokens>
	 <c:forTokens  var="item" items="생선, 조개" delims=",">
	<input type="checkbox" value="${item}"><span>${item}</span>
	</c:forTokens>
  </div>
  
  <div id="meat" class="tab-pane fade ">
    <c:forTokens  var="item" items="계란,알류,소고기,돼지고기,닭고기,오리고기,양념육,가공육" delims=",">
	<input type="checkbox" value="${item}"><span>${item}</span>
	</c:forTokens>
  </div>
  
  <div id="veg" class="tab-pane fade">

	<p>
	<c:forTokens  var="item" items="두부,콩나물,숙주나물,고구마,감자,양파,마늘,파,생강,오이,가지,호박,옥수수,상추,깻잎,쌈채소,고추,피망,파프리카,시금치,부추,나물,양배추,양상추,브로콜리,샐러드,어린잎채소,당근,우엉,연근,마,버섯,배추,무,김장채소,아스파라거스,허브류,인삼,더덕,도라지,약선재료" delims=",">
	<input type="checkbox" value="${item}"><span>${item}</span>
	</c:forTokens>
    </p>  
    </div>
    
  <div id="fruit" class="tab-pane fade">
    <p>
    <c:forTokens  var="item" items="사과,배,감귤,만감류,수박,멜론,참외,토마토,딸기,키위,블루베리,포도,자두,복숭아,감,곶감,바나나,파인애플,오렌지,자몽,레몬,망고,열대과일,체리,석류,아보카도" delims=",">
	<input type="checkbox" value="${item}"><span>${item}</span>
	</c:forTokens>
    </p>
  </div>
  
  <div id="sauce" class="tab-pane fade">
    <p>
    <c:forTokens  var="item" items="쌈장,파스타소스,페스토,케찹,마요네즈,디핑소스,돈까스소스,스테이크소스,중식소스,일식소스,샐러드 드레싱,시럽" delims=",">
	<input type="checkbox" value="${item}"><span>${item}</span>
	</c:forTokens>
    </p>
  </div>

  <div id="sauce2" class="tab-pane fade">
    <p>
    <c:forTokens  var="item" items="고추장,된장,소금,설탕,후추,향신료,조미료,액젓,물엿,식초,식용유,참기름,오일류,밀가루,분말류" delims=",">
	<input type="checkbox" value="${item}"><span>${item}</span>
	</c:forTokens>
    </p>
  </div>
  
   <div id="other1" class="tab-pane fade">
    <p>
    <c:forTokens  var="item" items="라면,즉석면요리,파스타면,생면,건면,즉석밥,즉석요리,참치,스팸,축수산통조림,옥수수통조림,피클,과일통조림" delims=",">
	<input type="checkbox" value="${item}"><span>${item}</span>
	</c:forTokens>
    </p>
  </div>

   <div id="other2" class="tab-pane fade">
    <p>
    <c:forTokens  var="item" items="쌀,잡곡,견과,과자,시리얼,빙과,떡,베이커리,건강식품,냉장식품,냉동식품,간편식,밀키트,김치,반찬,생수,음료,주류,커피,원두,차" delims=",">
	<input type="checkbox" value="${item}"><span>${item}</span>
	</c:forTokens>
    </p>
  </div>
  
  <div id="milk" class="tab-pane fade">
    <p>
    <c:forTokens  var="item" items="채우기" delims=",">
	<input type="checkbox" value="${item}"><span>${item}</span>
	</c:forTokens>
    </p>
  </div>
  
  <div id="fish" class="tab-pane fade">
    <p>
    <c:forTokens  var="item" items="생선, 조개" delims=",">
	<input type="checkbox" value="${item}"><span>${item}</span>
	</c:forTokens>
    </p>
  </div>
</div>
<hr>
	  <h4>추가된 항목</h4>
	  <span id="items"></span><br>	
	  	  <input type="button" id="addBtn" value="추가">
	  
	</div>
</body>
</html>
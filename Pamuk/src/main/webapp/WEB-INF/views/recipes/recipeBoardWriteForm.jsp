<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication var="mvo" property="principal" /> 



<script>
	//recipe step 을 증가위한 no
	let stepNo = 0;
	let itemNo = 0;
	// 현재 recipeWriteStep 번호를 받기 위한 no
	let stepCurForm = "";
	// 선택한 아이템 리스트 (중복 방지)
	let items = [];
	$(document).ready(function() {
		newStepForm();
		$(".recipePlusBtn").on({
			click : function() {
				newStepForm();
			}
		}); // on
		$(document).on("click", "button[name=delItemBtn]", function(){
            let clickedRow = $(this).parent().parent();
            var td = clickedRow.children();
            let itemName = td.eq(0).text();
            items.splice(items.indexOf(itemName),1); 
            clickedRow.remove();
        }); //on
		
		$("button[name=categoryBtn]").on("click",function(){
			$.ajax({
				url : "itemListByCategoryAjax",
				type: "get",
				data : { "categoryName" : $(this).attr('value') },
				success : function(responseData){	
					$("#ajax").remove();
					$("#ItemList").html("");
					$.each(responseData, function(index) {
						console.log($(this)[0].itemName);
						
						let itemForm = '<input type="button" class="btn btn-light" value="'+$(this)[0].itemName+'" onclick="selectItem(this)"></input>';
						$("#ItemList").append(itemForm);
					});
				}
			}); 
		});
	}); //ready
	
	function newStepForm() {
		stepNo++;
		let recipeStepForm = '<div class="recipeWriteStep">';
		recipeStepForm += '<div class="row mt-30 mg-15">';
		recipeStepForm += '<h3 style="text-align: center">Step' + stepNo
				+ '</h3 ></div>';
		recipeStepForm += '<div class="row"> <input type="text" class="form-control" name="recipeContentList['
				+ (stepNo - 1)
				+ '].stepTitle" placeholder="step'
				+ stepNo
				+ ' 제목을 입력해주세요" required="required"></div>';
		recipeStepForm += '<div class="row">';
 		recipeStepForm += '<input type="file" class="form-control" name="recipeStepImgs"';
		recipeStepForm += 'placeholder="레시피 step' + stepNo + ' 에 따른 이미지파일을 업로드해주세요!" required="required">'; 
		recipeStepForm += '<textarea class="form-control" name="recipeContentList['
				+ (stepNo - 1)
				+ '].content" cols="30" rows="10" placeholder="레시피 step'
				+ stepNo + ' 에 따른 설명을 넣어주세요!" required="required"></textarea>';
		recipeStepForm += '<input type="hidden" name="recipeContentList['
				+ (stepNo - 1) + '].stepNo" value="' + stepNo + '" required="required" />';
		recipeStepForm += '</div>';
		recipeStepForm += '</div>';
		// 현재 스탭 뒤에 append
		$("#recipeStepWrap").append(recipeStepForm);
	};
	
	function selectItem(item) {
		itemNo++;
		
		const table = document.getElementById('selectedItemListTable');
		//중복 X - 추가
		var value = $(item).attr('value');
		if($.inArray(value, items) == -1) {
			items.push(value);
		 	 // 새 행(Row) 추가
			const newRow = table.insertRow();
			  
			  // 새 행(Row)에 Cell 추가
			  const newCell1 = newRow.insertCell(0);
			  const newCell2 = newRow.insertCell(1);
			  const newCell3 = newRow.insertCell(2);
			  
			  // Cell에 텍스트 추가
			  newCell1.innerHTML = $(item).attr('value') + '<input type="hidden" name="recipeItemList[' + (itemNo - 1) + '].itemName" value="'+ $(item).attr('value') +'"/>';
			  newCell2.innerHTML = '<input type="text" name="recipeItemList[' + (itemNo - 1) + '].qty"></td>';
			newCell3.innerHTML = '<button name="delItemBtn">X</button>';

		}else {
			alert("이미 추가한 재료입니다");
		}
	};
</script>
<!-- 
	레시피 게시판 목록 보기 페이지
 -->
<!-- ##### Breadcumb Area Start ##### -->
<div class="breadcumb-area bg-img bg-overlay"
	style="background-image: url(/img/bg-img/breadcumb3.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcumb-text text-center">
					<h2>Recipes</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ##### Contact Form Area Start ##### -->
<div class="contact-area section-padding-0-80">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section-heading mt-70">
					<h3>레시피 등록하기</h3>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-12">
				<div class="contact-form-area">
					<form action="recipeBoardWrite" method="post" enctype="multipart/form-data">
					<sec:csrfInput />
						<div class="row">
							<div class="col-12 mb-15">
								<select name="category">
                              		<option value="한식">한식</option>
                               		<option value="일식">일식</option>
                         		    <option value="중식">중식</option>
                         		    <option value="양식">양식</option>
                            	</select>
							</div>
							
							<div class="col-12">
								<input type="text" class="form-control" name="recipeName" placeholder="레시피 제목을 입력해주세요" required="required">

								<h6>레시피 대표 이미지</h6>
								<input type="file" class="form-control" name="recipeThumbnailImg" placeholder="레시피 대표 이미지파일을 업로드해주세요!" required="required">
							</div>
						</div>
						<div class="row">
							<div class="col-12" id="recipeItemWrap">
								<h6>레시피 사용 재료</h6>
								<div class="form-control btn-group-vertical" id="recipeCategoryList" style="height: 300px; overflow-y:scroll; float: left;  width: 30%;">
									<c:forEach items="${categoryList}" var="category">
											<button type="button" name="categoryBtn" class="btn btn-light" value="${category.categoryName}">${category.categoryName}</button>
									</c:forEach>
								</div>
								<div class="form-control btn-group-vertical" id="ItemList" style="height: 300px; overflow-y:scroll; width: 25%; float: left; ">
									<!-- Default panel contents -->
									<!-- <ul id="item_ul_list" class="list-group list-group-flush"></ul> -->
								</div>
								<div class="form-control" id="selectedItemList" style="height: 300px; overflow-y:scroll; width: 45%; float: left; ">
									<table class="table table-hover" id="selectedItemListTable">
										<thead>
											<tr>
												<td style="width: 35%;">품목</td><td style="width: 55%;">수량</td><td style="width: 10%;"></td>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12" id="recipeStepWrap">
								<!-- 이 곳에 step이 추가 되고 있어요 -->
							</div>
							<div class="col-12 recipePlusBtn mt-50">
								<i class="fa fa-plus-circle fa-3x" aria-hidden="true"></i>
								<h6 class="mt-15">버튼을 클릭하면 레시피 step 을 증가시킬 수 있어요 !</h6>
							</div>
							<div class="col-12 text-right">
								<button class="btn delicious-btn mt-100" type="submit">작성</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ##### Contact Form Area End ##### -->
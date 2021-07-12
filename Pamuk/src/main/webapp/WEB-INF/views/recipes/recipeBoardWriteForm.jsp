<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication var="mvo" property="principal" /> 
<script>

	$(document).ready(function() {
		
		
		newStepForm();
		$(".recipePlusBtn").on({
			click : function() {
				newStepForm();
			}
		}); // on
		$("button[name=categoryBtn]").on("click",function(){
			$.ajax({
				url : "itemListByCategoryAjax",
				type: "get",
				data : { "categoryName" : $(this).attr('value') },
				success : function(responseData){	
					$("#ajax").remove();
					$("#item_ul_list").html("");
					$.each(responseData, function(index) {
						console.log($(this)[0].itemName);
						//얘를 목록에 뿌려주면 됩니다!!
						
						/*let itemForm = '<li class="list-group-item">'+$(this)[0].itemName+'&nbsp;&nbsp;<label class="switch ">';
						itemForm += '<input type="checkbox" class="success"> <span ';
						itemForm += 'class="slider round"></span>';
						itemForm += '</label> <input type="text" placeholder="수량"> </li>';*/
						
						//let itemForm = '<li>'+$(this)[0].itemName+'</li>';
						
						let itemForm = '<input type="button" value="'+$(this)[0].itemName+'" onclick="selectItem(this)"></input>';
						$("#item_ul_list").append(itemForm);
					});
				}
			}); 
		});
	}); //ready
	// recipe step 을 증가위한 no
	let stepNo = 0;
	let itemNo = 0;
	// 현재 recipeWriteStep 번호를 받기 위한 no
	let stepCurForm = "";
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
				+ ' 제목을 입력해주세요"></div>';
		recipeStepForm += '<div class="row">';
 		recipeStepForm += '<input type="file" class="form-control" name="recipeStepImgs"';
		recipeStepForm += 'placeholder="레시피 step' + stepNo + ' 에 따른 이미지파일을 업로드해주세요!">'; 
		recipeStepForm += '<textarea class="form-control" name="recipeContentList['
				+ (stepNo - 1)
				+ '].content" cols="30" rows="10" placeholder="레시피 step'
				+ stepNo + ' 에 따른 설명을 넣어주세요!"></textarea>';
		recipeStepForm += '<input type="hidden" name="recipeContentList['
				+ (stepNo - 1) + '].stepNo" value="' + stepNo + '"/>';
		recipeStepForm += '</div>';
		recipeStepForm += '</div>';
		// 현재 스탭 뒤에 append
		$("#recipeStepWrap").append(recipeStepForm);
	};
	function selectItem(item) {
		itemNo++;
		let selectedItemForm = '<tr><td>' + $(item).attr('value') + '<input type="hidden" name="recipeItemList[' + (itemNo - 1) + '].itemName" value="'+ $(item).attr('value') +'"/>';
		selectedItemForm += '</td> <td><input type="text" name="recipeItemList[' + (itemNo - 1) + '].qty"></td></tr>';
		
		$("#selectedItemList").append(selectedItemForm);
	};
</script>
<!-- 
	레시피 게시판 목록 보기 페이지
 -->
<!-- ##### Breadcumb Area Start ##### -->
<div class="breadcumb-area bg-img bg-overlay"
	style="background-image: url(img/bg-img/breadcumb3.jpg);">
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
							</div>
							<div class="col-12">
								<h6>레시피 대표 이미지</h6>
								<input type="file" class="form-control" name="recipeThumbnailImg" placeholder="레시피 대표 이미지파일을 업로드해주세요!" required="required">
							</div>
							<div class="col-12" id="recipeItemWrap">
								<div class="form-control recipeCategoryList" id="" name=""
									style="height: 90px;">

									<div class="btn-group" role="group">
										<c:forEach items="${categoryList}" var="category">
											<button type="button" name="categoryBtn" class="btn btn-success" value="${category.categoryName}">${category.categoryName}</button>
										</c:forEach>
									</div>
								</div>

								<div class="form-control recipeItemList" id="" name=""
									style="height: 300px; overflow-y: scroll;">
									<div class="card" style="margin: 50px 0">
										<!-- Default panel contents -->
										<ul id="item_ul_list" class="list-group list-group-flush">
											
										
										</ul>
									</div>
								</div>
								<div class="form-control recipeItemList" id="" name=""
									style="height: 300px; overflow-y: scroll;">
									<div class="card" style="margin: 50px 0">
										<!-- Default panel contents -->
										<table>
											<thead>
												<tr>
													<td>품목</td><td>수량</td>
												</tr>
											</thead>
											<tbody id="selectedItemList">
											</tbody>
										</table>
									</div>
								</div>

							</div>
							<div class="col-12" id="recipeStepWrap">
								
								<!-- 이 곳에 step이 추가 되고 있어요 -->


							</div>
							<div class="col-12 recipePlusBtn mt-50">
								<i class="fa fa-plus-circle fa-3x" aria-hidden="true"></i>
								<h6 class="mt-15">버튼을 클릭하면 레시피 step 을 증가시킬 수 있어요 !</h6>
							</div>
							<div class="col-12 text-right">
								<button class="btn delicious-btn mt-30" type="submit">작성</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ##### Contact Form Area End ##### -->
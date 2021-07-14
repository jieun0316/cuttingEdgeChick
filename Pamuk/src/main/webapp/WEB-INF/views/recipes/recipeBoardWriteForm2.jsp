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
		recipeStepForm += '<h3 style="text-align: center">Step</h3></div>';
		recipeStepForm += '<div class="row"> <input type="text" class="form-control" name="stepTitle" placeholder="step 제목을 입력해주세요"></div>';                                                             
		recipeStepForm += '<div class="row"> <input type="file" class="form-control" name="recipeStepImgs" placeholder="레시피 step에 따른 이미지파일을 업로드해주세요!">'; 
		recipeStepForm += '<textarea class="form-control" name="content" cols="30" rows="10" placeholder="레시피 step에 따른 설명을 넣어주세요!"></textarea>';
		recipeStepForm += '</div>';
		recipeStepForm += '</div>';
		// 현재 스탭 뒤에 append
		$("#recipeStepWrap").append(recipeStepForm);
	};
	function selectItem(item) {
		itemNo++;
		let selectedItemForm = '<tr><td>' + $(item).attr('value') + '<input type="hidden" name="recipeItemList[' + (itemNo - 1) + '].itemName" value="'+ $(item).attr('value') +'"/></td>';
		selectedItemForm += '<td><input type="text" name="recipeItemList[' + (itemNo - 1) + '].qty"></td></tr>';
		
		$("#selectedItemList").append(selectedItemForm);
	};
</script>
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
<div class="receipe-post-area section-padding-80">
	<div class="receipe-content-area">
		<div class="container">
			<div class="row">
				<div class="col-12 col-md-8">
					<div class="row mt-50">
						<form action="deleteRecipeForm" method="post">
							<sec:csrfInput />
							<button type="submit" class="btn btn-outline-success">레시피
								삭제</button>
							<input type="hidden" name="recipeNo" value="${recipeVO.recipeNo}">
						</form>
					</div>
					<div class="breadcumb-area bg-img bg-overlay receipe-headline my-5"
						style="background-image: url(${pageContext.request.contextPath}/upload/${recipeVO.recipeThumbnail});">
						<span>${recipeVO.writeDate}</span>
						<h2>${recipeVO.recipeName}</h2>
						<div class="receipe-duration">
							<h3>카테고리: ${recipeVO.category}</h3>
							<h6>작성자 : ${recipeVO.memberVO.memberId}</h6>
						</div>
					</div>
				</div>

				<div class="col-12 col-md-4">
					<div class="receipe-ratings text-right my-5">

						<div class="ratings">
							<i class="fa fa-star" aria-hidden="true"></i> <i
								class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
								aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star-o" aria-hidden="true"></i>
						</div>

					</div>

				</div>
			</div>

			<div class="row">
				<div class="col-12 col-lg-8">
					<!-- Single Preparation Step -->
					<c:forEach items="${recipeVO.recipeContentList}" var="content">
						<div class="prepStep">
							<h4>${content.stepNo}. ${content.stepTitle}</h4>
							

							<div class="single-preparation-step d-flex">
								<div class="preImgStep1 img mr-15">
									<img
										src="${pageContext.request.contextPath}/upload/${content.imagePath}"
										alt="">
								</div>
								<%-- <p>${paramMap.recipeContentVOList}</p> --%>
							</div>
							<p>${content.content}</p>
						</div>
						<hr>
					</c:forEach>
				</div>

				<!-- Ingredients -->
				<div class="col-12 col-lg-4">
					<div class="ingredients">
						<h4>Ingredients</h4>

						<!-- Custom Checkbox -->
						<c:forEach items="${recipeVO.recipeItemList}" var="item"
							varStatus="order">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customCheck${order.count}"> <label
									class="custom-control-label" for="customCheck${order.count}">${item.itemName},
									${item.qty}</label>
							</div>
						</c:forEach>


					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ##### Contact Form Area End ##### -->
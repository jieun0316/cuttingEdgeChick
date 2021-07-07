<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(document).ready(function() {
		newStepForm();
		$(".recipePlusBtn").on({
			click : function() {
				newStepForm();
			}
		}); // on
	}); //ready
	// recipe step 을 증가위한 no
	let stepNo = 0;
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
		recipeStepForm += '<input type="file" class="form-control" name="recipeContentList['
				+ (stepNo - 1) + '].imagePath"';
		recipeStepForm += 'placeholder="레시피 step' + stepNo
				+ ' 에 따른 이미지파일을 업로드해주세요!">';
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
				<div class="section-heading mt-70"">
					<h3>레시피 등록하기</h3>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-12">
				<div class="contact-form-area">
					<form action="recipeBoardWrite" method="post">
						<div class="row">
							<div class="col-4" id="recipeItemWrap">
								<div class="form-control recipeCategoryList" id="" name=""
									style="height: 90px; overflow-x: scroll;">

									<div class="btn-group" role="group">
										<button type="button" class="btn btn-success">전체보기</button>
										<button type="button" class="btn btn-success">채소류</button>
										<button type="button" class="btn btn-success">과일류</button>
										<button type="button" class="btn btn-success">조미료</button>
									</div>
								</div>

								<div class="form-control recipeItemList" id="" name=""
									style="height: 500px; overflow-y: scroll;">
									<div class="card" style="margin: 50px 0">
										<!-- Default panel contents -->
										<ul class="list-group list-group-flush">
											<li class="list-group-item">당근 
												<label class="switch "> 
													<input type="checkbox" class="success">  <span class="slider round"></span>
												</label>
												<input type="text" placeholder="수량">
											</li>
											<li class="list-group-item">오이 
												<label class="switch "> 
													<input type="checkbox" class="success">  <span class="slider round"></span>
												</label>
												<input type="text" placeholder="수량">
											</li>
											<li class="list-group-item">감자 
												<label class="switch "> 
													<input type="checkbox" class="success">  <span class="slider round"></span>
												</label>
												<input type="text" placeholder="수량">
											</li>
											<li class="list-group-item">고구마 
												<label class="switch "> 
													<input type="checkbox" class="success">  <span class="slider round"></span>
												</label>
												<input type="text" placeholder="수량">
											</li>
											
										</ul>
									</div>
								</div>

							</div>
							<div class="col-8" id="recipeStepWrap">
								<div class="row">
									<input type="text" class="form-control" name="recipeName"
										placeholder="레시피 제목을 입력해주세요">
								</div>
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

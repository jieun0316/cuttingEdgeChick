<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<div class="section-heading">
					<h3>레시피 등록하기</h3>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-12">
				<div class="contact-form-area">
					<form action="#" method="post">
						<div class="row">
							<div class="col-4">
								<textarea name="message" class="form-control" id="message"
									cols="30" rows="10" placeholder="재료 선택하는 텝"></textarea>
							</div>
							<div class="col-8">
								<div class="row">
									<input type="text" class="form-control" id="subject"
										placeholder="제목">
								</div>
								<!-- 
									이거 Ajax 로 처리해서 + 증가시켜주면 됩니당!!
									recipeWriteStep class
									Step + 숫자 해주기
								-->
								<div class="recipeWriteStep">
									<div class="row mt-30 mg-15">
										<h3 style="text-align: center">Step1</h3>
									</div>
									<div class="row">
										<input type="file" class="form-control" id="file"
											placeholder="파일 제목">
										<textarea name="message" class="form-control" id="message"
											cols="30" rows="10" placeholder="레시피 설명을 넣어주세요!"></textarea>
									</div>
								</div>
								<div class="recipeWriteStep">
									<div class="row mt-30 mg-15">
										<h3 style="text-align: center">Step2</h3>
									</div>
									<div class="row">
										<input type="file" class="form-control" id="file"
											placeholder="파일 제목">
										<textarea name="message" class="form-control" id="message"
											cols="30" rows="10" placeholder="레시피 설명을 넣어주세요!"></textarea>
									</div>
								</div>
							</div>

							<div class="col-12 text-right">
								<button class="btn delicious-btn mt-30" type="submit">Send</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ##### Contact Form Area End ##### -->

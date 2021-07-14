<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication var="mvo" property="principal" />

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
					<div class="breadcumb-area recipe bg-img receipe-headline my-5"
						style="background-image: url(${pageContext.request.contextPath}/upload/${recipeVO.recipeThumbnail});">
						<div class="recipeTitleWrap">
							<span>${recipeVO.writeDate}</span>
							<h2>${recipeVO.recipeName}</h2>
							<div class="receipe-duration">
								<h3>카테고리: ${recipeVO.category}</h3>
								<h6>작성자 : ${recipeVO.memberVO.memberId}</h6>
							</div>
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

							<p class="mt-15">${content.content}</p>

						</div>
						<hr>
					</c:forEach>
				</div>

				<!-- Ingredients -->
				<div class="col-12 col-lg-4">
					<div class="ingredients">
						<h4>필요한 재료</h4>

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

			<div class="row">
				<div class="col-12">
					<div class="section-heading text-left">
						<h3>Leave a comment</h3>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<div class="contact-form-area">
						<form action="#" method="post">
							<div class="row">
								<div class="col-12 col-lg-6">
									<input type="text" class="form-control" id="name"
										placeholder="Name">
								</div>
								<div class="col-12 col-lg-6">
									<input type="email" class="form-control" id="email"
										placeholder="E-mail">
								</div>
								<div class="col-12">
									<input type="text" class="form-control" id="subject"
										placeholder="Subject">
								</div>
								<div class="col-12">
									<textarea name="message" class="form-control" id="message"
										cols="30" rows="10" placeholder="Message"></textarea>
								</div>
								<div class="col-12">
									<button class="btn delicious-btn mt-30" type="submit">Post
										Comments</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
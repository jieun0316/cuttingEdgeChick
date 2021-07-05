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
<div class="receipe-post-area section-padding-80">

	<!-- Receipe Post Search -->
	<div class="receipe-post-search mb-80">
		<div class="container">
			<form action="#" method="post">
				<div class="row">
					<div class="col-12 col-lg-3">
						<select name="select1" id="select1">
							<option value="1">All Receipies Categories</option>
							<option value="1">All Receipies Categories 2</option>
							<option value="1">All Receipies Categories 3</option>
							<option value="1">All Receipies Categories 4</option>
							<option value="1">All Receipies Categories 5</option>
						</select>
					</div>
					<div class="col-12 col-lg-3">
						<select name="select1" id="select2">
							<option value="1">All Receipies Categories</option>
							<option value="1">All Receipies Categories 2</option>
							<option value="1">All Receipies Categories 3</option>
							<option value="1">All Receipies Categories 4</option>
							<option value="1">All Receipies Categories 5</option>
						</select>
					</div>
					<div class="col-12 col-lg-3">
						<input type="search" name="search" placeholder="Search Receipies">
					</div>
					<div class="col-12 col-lg-3 text-right">
						<button type="submit" class="btn delicious-btn">Search</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- Receipe Slider -->
	<!--  
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="receipe-slider owl-carousel">
                        <img src="img/bg-img/bg5.jpg" alt="">
                        <img src="img/bg-img/bg5.jpg" alt="">
                        <img src="img/bg-img/bg5.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
        -->

	<!-- Receipe Content Area -->
	<div class="receipe-content-area">
		<div class="container">

			<div class="row">
				<div class="col-12 col-md-8">
					<div class="receipe-headline my-5">
						<span>${paramMap.recipeVO.writeDate}</span>
						<h2>${paramMap.recipeVO.recipeName}</h2>
						<div class="receipe-duration">
							<h3>카테고리: ${paramMap.recipeVO.category}</h3>
							<h6>작성자 : ${paramMap.recipeVO.memberVO.memberId}</h6>
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
					<c:forEach items="${paramMap.recipeContentVOList}" var="content">
						<div class="prepStep">

							<div class="single-preparation-step d-flex">
								<div class="preImgStep1 img mr-15">
									<img
										src="${pageContext.request.contextPath}/img/bg-img/insta2.jpg"
										alt="">
										${pageContext.request.contextPath}/${imagePath}
								</div>
								<h4>${content.stepNo}.</h4>
								<h5 class="mr-15">${content.stepTitle}</h5>
								<p>${content.content}</p>
								<%-- <p>${paramMap.recipeContentVOList}</p> --%>
							</div>
						</div>
                    	<hr>
					</c:forEach>
				</div>

				<!-- Ingredients -->
				<div class="col-12 col-lg-4">
					<div class="ingredients">
						<h4>Ingredients</h4>

						<!-- Custom Checkbox -->
						<c:forEach items="${paramMap.recipeItemVOList}" var="item" varStatus="order">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input"
								id="customCheck${order.count}"> <label class="custom-control-label"
								for="customCheck${order.count}">${item.itemName}, ${item.qty}</label>
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
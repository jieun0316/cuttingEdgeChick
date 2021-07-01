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
<!-- ##### Breadcumb Area End ##### -->
<!-- ##### Best Receipe Area Start ##### -->
<section class="best-receipe-area">
	<div class="container">
		<div class="receipe-post-search mb-50 mt-70">
            <div class="container">
                <form action="#" method="post">
                    <div class="row">
                        <div class="col-12 col-lg-3">
                            <select name="select1" id="select1">
                                <option value="1">전체보기</option>
                                <option value="1">한식</option>
                                <option value="1">중식</option>
                                <option value="1">일식</option>
                                <option value="1">양식</option>
                            </select>
                        </div>
                        <div class="col-12 col-lg-3">
                            <select name="select1" id="select2">
                                <option value="1">추천순</option>
                                <option value="1">최신순</option>
                                <option value="1">댓글순</option>
                            </select>
                        </div>
                        <div class="col-12 col-lg-3">
                            <input type="search" name="search" placeholder="검색어를 입력하세요">
                        </div>
                        <div class="col-12 col-lg-3 text-right">
                            <button type="submit" class="btn delicious-btn">검색</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
		<div class="row">
			<div id="totalCount">
				총 <span>43</span>개의 맛있는 레시피가 있습니다 !
			</div>
		</div>
		<div class="row">
			<!--
				class 하나당 recipe 하나 
				for 문 돌릴때 3의 배수로 돌려주세요
				ex ) 3, 6, 9 , 12 ....
			 -->
			<!-- Single Best Receipe Area -->
			<div class="col-12 col-sm-6 col-lg-4">
				<div class="single-best-receipe-area mb-30">
					<img src="${pageContext.request.contextPath}/img/bg-img/r1.jpg"
						alt="">
					<div class="receipe-content">
						<a href="receipe-post.html">
							<h5>Sushi Easy Receipy</h5>
						</a>
						<div class="ratings">
							<i class="fa fa-star" aria-hidden="true"></i> <i
								class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
								aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star-o" aria-hidden="true"></i>
						</div>
					</div>
				</div>
			</div>

			<!-- Single Best Receipe Area -->
			<div class="col-12 col-sm-6 col-lg-4">
				<div class="single-best-receipe-area mb-30">
					<img src="${pageContext.request.contextPath}/img/bg-img/r2.jpg"
						alt="">
					<div class="receipe-content">
						<a href="receipe-post.html">
							<h5>Homemade Burger</h5>
						</a>
						<div class="ratings">
							<i class="fa fa-star" aria-hidden="true"></i> <i
								class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
								aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star-o" aria-hidden="true"></i>
						</div>
					</div>
				</div>
			</div>

			<!-- Single Best Receipe Area -->
			<div class="col-12 col-sm-6 col-lg-4">
				<div class="single-best-receipe-area mb-30">
					<img src="img/bg-img/r3.jpg" alt="">
					<div class="receipe-content">
						<a href="receipe-post.html">
							<h5>Vegan Smoothie</h5>
						</a>
						<div class="ratings">
							<i class="fa fa-star" aria-hidden="true"></i> <i
								class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
								aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star-o" aria-hidden="true"></i>
						</div>
					</div>
				</div>
			</div>

			<!-- Single Best Receipe Area -->
			<div class="col-12 col-sm-6 col-lg-4">
				<div class="single-best-receipe-area mb-30">
					<img src="${pageContext.request.contextPath}/img/bg-img/r4.jpg"
						alt="">
					<div class="receipe-content">
						<a href="receipe-post.html">
							<h5>Calabasa soup</h5>
						</a>
						<div class="ratings">
							<i class="fa fa-star" aria-hidden="true"></i> <i
								class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
								aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star-o" aria-hidden="true"></i>
						</div>
					</div>
				</div>
			</div>

			<!-- Single Best Receipe Area -->
			<div class="col-12 col-sm-6 col-lg-4">
				<div class="single-best-receipe-area mb-30">
					<img src="img/bg-img/r5.jpg" alt="">
					<div class="receipe-content">
						<a href="receipe-post.html">
							<h5>Homemade Breakfast</h5>
						</a>
						<div class="ratings">
							<i class="fa fa-star" aria-hidden="true"></i> <i
								class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
								aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star-o" aria-hidden="true"></i>
						</div>
					</div>
				</div>
			</div>

			<!-- Single Best Receipe Area -->
			<div class="col-12 col-sm-6 col-lg-4">
				<div class="single-best-receipe-area mb-30">
					<img src="${pageContext.request.contextPath}/img/bg-img/r6.jpg"
						alt="">
					<div class="receipe-content">
						<a href="receipe-post.html">
							<h5>Healthy Fruit Desert</h5>
						</a>
						<div class="ratings">
							<i class="fa fa-star" aria-hidden="true"></i> <i
								class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
								aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star-o" aria-hidden="true"></i>
						</div>
					</div>
				</div>
			</div>
			<!-- Single Best Receipe Area -->
			<div class="col-12 col-sm-6 col-lg-4">
				<div class="single-best-receipe-area mb-30">
					<img src="${pageContext.request.contextPath}/img/bg-img/r4.jpg"
						alt="">
					<div class="receipe-content">
						<a href="receipe-post.html">
							<h5>Calabasa soup</h5>
						</a>
						<div class="ratings">
							<i class="fa fa-star" aria-hidden="true"></i> <i
								class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
								aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star-o" aria-hidden="true"></i>
						</div>
					</div>
				</div>
			</div>

			<!-- Single Best Receipe Area -->
			<div class="col-12 col-sm-6 col-lg-4">
				<div class="single-best-receipe-area mb-30">
					<img src="img/bg-img/r5.jpg" alt="">
					<div class="receipe-content">
						<a href="receipe-post.html">
							<h5>Homemade Breakfast</h5>
						</a>
						<div class="ratings">
							<i class="fa fa-star" aria-hidden="true"></i> <i
								class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
								aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star-o" aria-hidden="true"></i>
						</div>
					</div>
				</div>
			</div>

			<!-- Single Best Receipe Area -->
			<div class="col-12 col-sm-6 col-lg-4">
				<div class="single-best-receipe-area mb-30">
					<img src="${pageContext.request.contextPath}/img/bg-img/r6.jpg"
						alt="">
					<div class="receipe-content">
						<a href="receipe-post.html">
							<h5>Healthy Fruit Desert</h5>
						</a>
						<div class="ratings">
							<i class="fa fa-star" aria-hidden="true"></i> <i
								class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
								aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star-o" aria-hidden="true"></i>
						</div>
					</div>
				</div>
			</div>			
		</div>
	</div>
</section>
<!-- ##### Best Receipe Area End ##### -->

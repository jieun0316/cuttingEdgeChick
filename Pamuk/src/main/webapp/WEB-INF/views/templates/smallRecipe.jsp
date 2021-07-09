<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ##### Small Receipe Area Start ##### -->
<section class="small-receipe-area section-padding-80-0">
	<div class="container">
		<div class="row">

		<!-- Small Receipe Area -->
		<!-- 총 9개 출력 -->
		<c:forEach var="recipeVO" items="${RecentRecipeList}" begin="0" end="8" step="1">
			<div class="col-12 col-sm-6 col-lg-4">
				<div class="single-small-receipe-area d-flex">
					<!-- Receipe Thumb -->
					<div class="receipe-thumb">
						<img src="${pageContext.request.contextPath}/img/bg-img/sr1.jpg"
							alt="">
					</div>
					<!-- Receipe Content -->
					<div class="receipe-content">
						<span>${recipeVO.writeDate}</span> <a href="receipe-post.html">
							<h5>${recipeVO.recipeName}</h5>
						</a>
						<div class="ratings">
							<i class="fa fa-star" aria-hidden="true"></i> <i
								class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
								aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star-o" aria-hidden="true"></i>
						</div>
						<p>2 Comments</p>
					</div>
				</div>
			</div>
		</c:forEach>


		</div>
	</div>
</section>
<!-- ##### Small Receipe Area End ##### -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- Single Best Receipe Area -->
	<c:forEach var="recipeVO" items="${recipeList}">
		<div class="col-12 col-sm-6 col-lg-4">
			<div class="single-best-receipe-area mb-30">
				<img src="${pageContext.request.contextPath}/img/bg-img/r1.jpg"
					alt="">
				<div class="receipe-content">
					<a href="recipeBoardView?recipeNo=${recipeVO.recipeNo}">
						<h5>[${recipeVO.category}] ${recipeVO.recipeName}</h5>
					</a>
					<div class="ratings">
						<span>작성자 :
							${recipeVO.memberVO.nick}&nbsp;&nbsp;|&nbsp;&nbsp;</span> <span>조회수
							: ${recipeVO.hits}</span> <br> <i class="fa fa-star"
							aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
						<i class="fa fa-star" aria-hidden="true"></i> <i
							class="fa fa-star" aria-hidden="true"></i> <i
							class="fa fa-star-o" aria-hidden="true"></i>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<!-- // forEach -->
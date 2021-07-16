<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- ##### Small Receipe Area Start ##### -->
<section class="small-receipe-area section-padding-80-0">
	<div class="container">
		<div class="row">

		<!-- Small Receipe Area -->
		<!-- 총 9개 출력 -->
		<c:forEach var="recipeVO" items="${RecentRecipeList}" begin="0" end="8" step="1">
		<fmt:formatNumber  var="roundavgrating" value="${recipeVO.rating}" pattern="0" />
			<div class="col-12 col-sm-6 col-lg-4">
				<div class="single-small-receipe-area d-flex">
					<!-- Receipe Thumb -->
					<div class="receipe-thumb">
						<img src="${pageContext.request.contextPath}/upload/${recipeVO.recipeThumbnail}"
							alt="">
					</div>
					<!-- Receipe Content -->
					<div class="receipe-content">
						<span>${recipeVO.writeDate}</span> <a href="${pageContext.request.contextPath}/recipe/recipeBoardView?recipeNo=${recipeVO.recipeNo}">
							<h6>[${recipeVO.category}] ${recipeVO.recipeName}</h6>
						</a>
						<div class="ratings">
							<%-- 게시물 별점 평균 별 아이콘 갯수 지정 --%>
								<c:choose>
								<%-- 만점(5개)일때 --%>
									<c:when test="${roundavgrating == 5}">
										<c:forEach begin="1" end="${roundavgrating}" step="1">
											<i class="text-warning fa fa-star"></i>
										</c:forEach>
									</c:when>
								<%-- 1~4점 --%>
									<c:when test="${roundavgrating < 5 and roundavgrating >=1}"> 
										<c:forEach begin="1" end="${roundavgrating}" step="1">
											<i class="text-warning fa fa-star"></i>
										</c:forEach>
										<c:forEach begin="1" end="${5-roundavgrating}" step="1">
											<i class="text-warning fa fa-star-o"></i>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p>등록된 리뷰가 없습니다</p>
									</c:otherwise>
								</c:choose>
						</div>
						<p>조회수</p>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</section>
<!-- ##### Small Receipe Area End ##### -->
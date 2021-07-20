<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<!-- Single Best Receipe Area -->
	<c:forEach var="recipeVO" items="${recipeList}">
	<fmt:formatNumber  var="roundavgrating" value="${recipeVO.rating}" pattern="0" />
		<div class="col-12 col-sm-6 col-lg-4">
			<div class="single-best-receipe-area mb-30">
				<img src="${pageContext.request.contextPath}/upload/${recipeVO.recipeThumbnail}"
							alt="">
				<div class="receipe-content">
					<a href="recipeBoardView?recipeNo=${recipeVO.recipeNo}">
						<h5>[${recipeVO.category}] ${recipeVO.recipeName}</h5>
					</a>
					<div class="ratings">
						<span>작성자 :
							${recipeVO.memberVO.nick}<%--&nbsp;&nbsp;|&nbsp;&nbsp; </span> <span>조회수
							: ${recipeVO.hits}</span> --%>
							<br> 
							<%-- 게시물 별점 평균 별 아이콘 갯수 지정 --%>
								<c:choose>
								<%-- 만점(5개)일때 --%>
									<c:when test="${roundavgrating == 5}">
										<c:forEach begin="1" end="${roundavgrating}" step="1">
											<span class="float"><i class="text-warning fa fa-star"></i></span>
										</c:forEach>
									</c:when>
								<%-- 1~4점 --%>
									<c:when test="${roundavgrating < 5 and roundavgrating >=1}"> 
										<c:forEach begin="1" end="${roundavgrating}" step="1">
											<span class="float"><i class="text-warning fa fa-star"></i></span>
										</c:forEach>
										<c:forEach begin="1" end="${5-roundavgrating}" step="1">
											<span class="float"><i class="text-warning fa fa-star-o"></i></span>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p>등록된 리뷰가 없습니다</p>
									</c:otherwise>
								</c:choose>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<!-- // forEach -->
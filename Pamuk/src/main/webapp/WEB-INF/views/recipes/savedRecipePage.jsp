<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 
	레시피 게시판 목록 보기 페이지
 -->
<!-- ##### Breadcumb Area Start ##### -->
<div class="breadcumb-area bg-img bg-overlay"
	style="background-image: url(/img/bg-img/breadcumb3.jpg);">
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
<!-- ##### Small Receipe Area Start ##### -->
<section class="small-receipe-area section-padding-80-0">
	<div class="container">
		<div class="row">
			<!-- ##### Tabs ##### -->
			<div class="col-12">
				<div class="delicious-tabs-content">
					<div class="tab-content mb-80" id="myTabContent">
						<!-- // 레시피 -->
						<div class="tab-pane fade active show" id="tab1" role="tabpanel"
							aria-labelledby="tab--1">
							<div class="delicious-tab-content">
								<div class="resultWrap">
								<c:choose>
									<c:when test = "${empty savedRecipes}">
										<div id="totalCount">
											저장한 레시피가 없습니다.
										</div>
									</c:when>
									<c:otherwise>
										<div id="totalCount">
											당신이 저장한 레시피 목록
										</div>
										<div class="row">
											<c:forEach var="recipeVO" items="${savedRecipes}">
											<!-- Small Receipe Area -->
											<div class="col-12 col-sm-6 col-lg-4">
												<div class="single-small-receipe-area d-flex">
													<!-- Receipe Thumb -->
													<div class="receipe-thumb">
														<img
															src="${pageContext.request.contextPath}/upload/${recipeVO.recipeThumbnail}"
															alt="">
													</div>
													<!-- Receipe Content -->
													<div class="receipe-content">
														<span>${recipeVO.writeDate}</span> <a href="recipeBoardView?recipeNo=${recipeVO.recipeNo}">
															<h5>[${recipeVO.category}] ${recipeVO.recipeName}</h5>
														</a>
														저장일시 :
														<p>${recipeVO.savedDate}</p>
													</div>
												</div>
											</div>
											</c:forEach>
										</div>
									</c:otherwise>
								</c:choose>
								
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>

	</div>
</section>
<!-- ##### Small Receipe Area End ##### -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<!-- ##### Small Receipe Area Start ##### -->
<section class="small-receipe-area section-padding-80-0">
	<div class="container">
		<div class="row">
			<!-- ##### Tabs ##### -->
			<div class="col-12">
				<div class="delicious-tabs-content">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item"><a class="nav-link active" id="tab--2"
							data-toggle="tab" href="#tab1" role="tab" aria-controls="tab2"
							aria-selected="false">레시피</a></li>
						<li class="nav-item"><a class="nav-link" id="tab--3"
							data-toggle="tab" href="#tab2" role="tab" aria-controls="tab3"
							aria-selected="true">식재료</a></li>
						<li class="nav-item"><a class="nav-link" id="tab--4"
							data-toggle="tab" href="#tab3" role="tab" aria-controls="tab4"
							aria-selected="false">작성자</a></li>
					</ul>
					
					<div class="tab-content mb-80" id="myTabContent">
						<!-- // 레시피 -->
						<div class="tab-pane fade active show" id="tab1" role="tabpanel"
							aria-labelledby="tab--1">
							<div class="delicious-tab-content">
								<div class="resultWrap">
								<c:choose>
									<c:when test = "${empty ResultByRecipes}">
										<div id="totalCount">
											검색어 <span>${keyword}</span>에 대한 <span>레시피</span> 검색 결과 없습니다! <b style="color:red">검색어를 확인해주세요 !</b>
										</div>
									</c:when>
									<c:otherwise>
										<div id="totalCount">
											검색어 <span>${keyword}</span>에 대한 <span>레시피</span> 검색 결과 <span>${ResultByRecipesCount}</span>개의 검색결과가 있습니다!
										</div>
										<div class="row">
											<c:forEach var="recipeVO" items="${ResultByRecipes}">
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
														<span>${recipeVO.writeDate}</span> <a href="receipe-post.html">
															<h5>[${recipeVO.category}] ${recipeVO.recipeName}</h5>
														</a>
														<div class="ratings">
															<i class="fa fa-star" aria-hidden="true"></i> <i
																class="fa fa-star" aria-hidden="true"></i> <i
																class="fa fa-star" aria-hidden="true"></i> <i
																class="fa fa-star" aria-hidden="true"></i> <i
																class="fa fa-star-o" aria-hidden="true"></i>
														</div>
														<p>2 Comments</p>
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
						<!-- // 식재료 -->
						<div class="tab-pane fade" id="tab2" role="tabpanel"
							aria-labelledby="tab--2">
							<div class="delicious-tab-content">
								<div class="resultWrap">
								<c:choose>
									<c:when test = "${empty ResultByItems}">
										<div id="totalCount">
											검색어 <span>${keyword}</span>에 대한 <span>식재료</span> 검색 결과 없습니다! <b style="color:red">검색어를 확인해주세요 !</b>
										</div>
									</c:when>
									<c:otherwise>
										<div id="totalCount">
											검색어 <span>${keyword}</span>에 대한 <span>식재료</span> 검색 결과 <span>${ResultByItemsCount}</span>개의 검색결과가 있습니다!
										</div>
										<div class="row">
											<c:forEach var="recipeVO" items="${ResultByItems}">
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
														<span>${recipeVO.writeDate}</span> <a href="receipe-post.html">
															<h5>[${recipeVO.category}] ${recipeVO.recipeName}</h5>
														</a>
														<div class="ratings">
															<i class="fa fa-star" aria-hidden="true"></i> <i
																class="fa fa-star" aria-hidden="true"></i> <i
																class="fa fa-star" aria-hidden="true"></i> <i
																class="fa fa-star" aria-hidden="true"></i> <i
																class="fa fa-star-o" aria-hidden="true"></i>
														</div>
														<p>2 Comments</p>
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
						<div class="tab-pane fade" id="tab3" role="tabpanel"
							aria-labelledby="tab--3">
							<div class="delicious-tab-content">
								<div class="resultWrap">
								<c:choose>
									<c:when test = "${empty ResultByWriter}">
										<div id="totalCount">
											검색어 <span>${keyword}</span>에 대한 <span>작성자</span> 검색 결과 없습니다! <b style="color:red">검색어를 확인해주세요 !</b>
										</div>
									</c:when>
									<c:otherwise>
										<div id="totalCount">
											검색어 <span>${keyword}</span>에 대한 <span>작성자</span> 검색 결과 <span>${ResultByWriterCount}</span>개의 검색결과가 있습니다!
										</div>
										<div class="row">
											<c:forEach var="recipeVO" items="${ResultByWriter}">
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
														<span>${recipeVO.writeDate}</span> <a href="receipe-post.html">
															<h5>[${recipeVO.category}] ${recipeVO.recipeName}</h5>
														</a>
														<div class="ratings">
															<i class="fa fa-star" aria-hidden="true"></i> <i
																class="fa fa-star" aria-hidden="true"></i> <i
																class="fa fa-star" aria-hidden="true"></i> <i
																class="fa fa-star" aria-hidden="true"></i> <i
																class="fa fa-star-o" aria-hidden="true"></i>
														</div>
														<p>2 Comments</p>
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

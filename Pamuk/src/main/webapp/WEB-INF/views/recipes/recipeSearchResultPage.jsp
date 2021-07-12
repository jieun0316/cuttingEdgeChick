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
<!-- ##### Small Receipe Area Start ##### -->
<section class="small-receipe-area section-padding-80-0">
	<div class="container">
		<div class="row">
			<!-- ##### Tabs ##### -->
			<div class="col-12">
				<div class="delicious-tabs-content">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item"><a class="nav-link active" id="tab--1"
							data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1"
							aria-selected="false">전체</a></li>
						<li class="nav-item"><a class="nav-link" id="tab--2"
							data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2"
							aria-selected="false">레시피</a></li>
						<li class="nav-item"><a class="nav-link" id="tab--2"
							data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2"
							aria-selected="false">작성자</a></li>
						<li class="nav-item"><a class="nav-link" id="tab--3"
							data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3"
							aria-selected="true">식재료</a></li>
					</ul>

					<div class="tab-content mb-80" id="myTabContent">
						<div class="tab-pane fade show active" id="tab1" role="tabpanel"
							aria-labelledby="tab--1">
							<div class="resultWrap">
								<div id="totalCount">
									레시피 검색 결과 <span>100</span>개의 검색결과가 있습니다!
								</div>
								<div class="row">
									<!-- Small Receipe Area -->
									<div class="col-12 col-sm-6 col-lg-4">
										<div class="single-small-receipe-area d-flex">
											<!-- Receipe Thumb -->
											<div class="receipe-thumb">
												<img
													src="${pageContext.request.contextPath}/img/bg-img/sr1.jpg"
													alt="">
											</div>
											<!-- Receipe Content -->
											<div class="receipe-content">
												<span>January 04, 2018</span> <a href="receipe-post.html">
													<h5>Homemade italian pasta</h5>
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

									<!-- Small Receipe Area -->
									<div class="col-12 col-sm-6 col-lg-4">
										<div class="single-small-receipe-area d-flex">
											<!-- Receipe Thumb -->
											<div class="receipe-thumb">
												<img
													src="${pageContext.request.contextPath}/img/bg-img/sr2.jpg"
													alt="">
											</div>
											<!-- Receipe Content -->
											<div class="receipe-content">
												<span>January 04, 2018</span> <a href="receipe-post.html">
													<h5>Baked Bread</h5>
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

									<!-- Small Receipe Area -->
									<div class="col-12 col-sm-6 col-lg-4">
										<div class="single-small-receipe-area d-flex">
											<!-- Receipe Thumb -->
											<div class="receipe-thumb">
												<img
													src="${pageContext.request.contextPath}/img/bg-img/sr3.jpg"
													alt="">
											</div>
											<!-- Receipe Content -->
											<div class="receipe-content">
												<span>January 04, 2018</span> <a href="receipe-post.html">
													<h5>Scalops on salt</h5>
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
									<!-- Pagination -->
									<c:set var="pb" value="${requestScope.pagingBean}"></c:set>
									<ul class="pagination justify-content-center">
										<%--  이전 pageGroup 이 있으면 (<< 표시될 것이 있으면 ) --%>
										<c:if test="${pb.previousPageGroup}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/recipeBoardList?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
										</c:if>
										<c:forEach var="page" begin="${pb.startPageOfPageGroup}"
											end="${pb.endPageOfPageGroup}">
											<c:choose>
												<%-- 현재 페이지 표시 --%>
												<c:when test="${pb.nowPage==page }">
													<li class="page-item active"><a class="page-link"
														href="${pageContext.request.contextPath}/recipeBoardList?pageNo=${page}">${page}</a></li>
												</c:when>
												<c:otherwise>
													<li><a class="page-link"
														href="${pageContext.request.contextPath}/recipeBoardList?pageNo=${page}">${page}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${pb.nextPageGroup}">
											<li><a class="page-link"
												href="${pageContext.request.contextPath}/recipeBoardList?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
										</c:if>
									</ul>
									<!-- /.Pagination -->
								</div>
							</div>
							<hr>
							<div class="resultWrap">
								<div id="totalCount">
									식재료 검색 결과 <span>100</span>개의 검색결과가 있습니다!
								</div>
								<div class="row">
									<!-- Small Receipe Area -->
									<div class="col-12 col-sm-6 col-lg-4">
										<div class="single-small-receipe-area d-flex">
											<!-- Receipe Thumb -->
											<div class="receipe-thumb">
												<img
													src="${pageContext.request.contextPath}/img/bg-img/sr1.jpg"
													alt="">
											</div>
											<!-- Receipe Content -->
											<div class="receipe-content">
												<span>January 04, 2018</span> <a href="receipe-post.html">
													<h5>Homemade italian pasta</h5>
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

									<!-- Small Receipe Area -->
									<div class="col-12 col-sm-6 col-lg-4">
										<div class="single-small-receipe-area d-flex">
											<!-- Receipe Thumb -->
											<div class="receipe-thumb">
												<img
													src="${pageContext.request.contextPath}/img/bg-img/sr2.jpg"
													alt="">
											</div>
											<!-- Receipe Content -->
											<div class="receipe-content">
												<span>January 04, 2018</span> <a href="receipe-post.html">
													<h5>Baked Bread</h5>
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

									<!-- Small Receipe Area -->
									<div class="col-12 col-sm-6 col-lg-4">
										<div class="single-small-receipe-area d-flex">
											<!-- Receipe Thumb -->
											<div class="receipe-thumb">
												<img
													src="${pageContext.request.contextPath}/img/bg-img/sr3.jpg"
													alt="">
											</div>
											<!-- Receipe Content -->
											<div class="receipe-content">
												<span>January 04, 2018</span> <a href="receipe-post.html">
													<h5>Scalops on salt</h5>
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
									<!-- Pagination -->
									<c:set var="pb" value="${requestScope.pagingBean}"></c:set>
									<ul class="pagination justify-content-center">
										<%--  이전 pageGroup 이 있으면 (<< 표시될 것이 있으면 ) --%>
										<c:if test="${pb.previousPageGroup}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/recipeBoardList?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
										</c:if>
										<c:forEach var="page" begin="${pb.startPageOfPageGroup}"
											end="${pb.endPageOfPageGroup}">
											<c:choose>
												<%-- 현재 페이지 표시 --%>
												<c:when test="${pb.nowPage==page }">
													<li class="page-item active"><a class="page-link"
														href="${pageContext.request.contextPath}/recipeBoardList?pageNo=${page}">${page}</a></li>
												</c:when>
												<c:otherwise>
													<li><a class="page-link"
														href="${pageContext.request.contextPath}/recipeBoardList?pageNo=${page}">${page}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${pb.nextPageGroup}">
											<li><a class="page-link"
												href="${pageContext.request.contextPath}/recipeBoardList?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
										</c:if>
									</ul>
									<!-- /.Pagination -->
								</div>
							</div>
							<hr>
							<div class="resultWrap">
								<div id="totalCount">
									작성자 검색 결과 <span>100</span>개의 검색결과가 있습니다!
								</div>
								<div class="row">
									<!-- Small Receipe Area -->
									<div class="col-12 col-sm-6 col-lg-4">
										<div class="single-small-receipe-area d-flex">
											<!-- Receipe Thumb -->
											<div class="receipe-thumb">
												<img
													src="${pageContext.request.contextPath}/img/bg-img/sr1.jpg"
													alt="">
											</div>
											<!-- Receipe Content -->
											<div class="receipe-content">
												<span>January 04, 2018</span> <a href="receipe-post.html">
													<h5>Homemade italian pasta</h5>
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

									<!-- Small Receipe Area -->
									<div class="col-12 col-sm-6 col-lg-4">
										<div class="single-small-receipe-area d-flex">
											<!-- Receipe Thumb -->
											<div class="receipe-thumb">
												<img
													src="${pageContext.request.contextPath}/img/bg-img/sr2.jpg"
													alt="">
											</div>
											<!-- Receipe Content -->
											<div class="receipe-content">
												<span>January 04, 2018</span> <a href="receipe-post.html">
													<h5>Baked Bread</h5>
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

									<!-- Small Receipe Area -->
									<div class="col-12 col-sm-6 col-lg-4">
										<div class="single-small-receipe-area d-flex">
											<!-- Receipe Thumb -->
											<div class="receipe-thumb">
												<img
													src="${pageContext.request.contextPath}/img/bg-img/sr3.jpg"
													alt="">
											</div>
											<!-- Receipe Content -->
											<div class="receipe-content">
												<span>January 04, 2018</span> <a href="receipe-post.html">
													<h5>Scalops on salt</h5>
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
									<!-- Pagination -->
									<c:set var="pb" value="${requestScope.pagingBean}"></c:set>
									<ul class="pagination justify-content-center">
										<%--  이전 pageGroup 이 있으면 (<< 표시될 것이 있으면 ) --%>
										<c:if test="${pb.previousPageGroup}">
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/recipeBoardList?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
										</c:if>
										<c:forEach var="page" begin="${pb.startPageOfPageGroup}"
											end="${pb.endPageOfPageGroup}">
											<c:choose>
												<%-- 현재 페이지 표시 --%>
												<c:when test="${pb.nowPage==page }">
													<li class="page-item active"><a class="page-link"
														href="${pageContext.request.contextPath}/recipeBoardList?pageNo=${page}">${page}</a></li>
												</c:when>
												<c:otherwise>
													<li><a class="page-link"
														href="${pageContext.request.contextPath}/recipeBoardList?pageNo=${page}">${page}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${pb.nextPageGroup}">
											<li><a class="page-link"
												href="${pageContext.request.contextPath}/recipeBoardList?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
										</c:if>
									</ul>
									<!-- /.Pagination -->
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab2" role="tabpanel"
							aria-labelledby="tab--2">
							<div class="delicious-tab-content">
								<!-- Tab Text -->
								<div class="delicious-tab-text">
									<p>Integer nec bibendum lacus. Praesent malesuada congue,
										Suspendisse dictum enim sit amet libero malesu ada feugiat.
										Praesent malesuada congue magna at finibus. In hac habitasse
										platea dictumst. Curabitur rhoncus auctor eleifend. Praesent
										malesuada congue.</p>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="tab3" role="tabpanel"
							aria-labelledby="tab--3">
							<div class="delicious-tab-content">
								<!-- Tab Text -->
								<div class="delicious-tab-text">
									<p>Integer nec bibendum lacus. Praesent malesuada congue,
										Suspendisse dictum enim sit amet libero malesu ada feugiat.
										Praesent malesuada congue magna at finibus. In hac habitasse
										platea dictumst. Curabitur rhoncus auctor eleifend. Praesent
										malesuada congue.</p>
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

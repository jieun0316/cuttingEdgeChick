<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
					<h2>신고된 글</h2>
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
						<!-- 탭 -->
							<div class="delicious-tab-content">
								<div class="resultWrap">
									<div id="totalCount">
										신고된 결과를 보여드립니다
									</div>
									<div class="row">
										<!-- Small Receipe Area -->
										<div class="col-12">
											<form action="/admin/deleteRecipeByRecipeNo" method="post">
											 <sec:csrfInput />
											<table class="table table-bordered table-hover">
												<thead>
													<tr>
														<th></th>
														<th>썸네일</th>
														<th>게시물제목</th>
														<th>작성자</th>
														<th>신고내용</th>
														<th>최근신고일</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach items="${requestScope.rlist }" var="rvo" varStatus="status">
													<tr>
														<td><input type="radio" name="memberId" value="${rvo.recipeNo}"></td>
														<td><img src="${pageContext.request.contextPath}/upload/${rvo.recipeThumbnail}"	alt="" style="width:150px"></td>
														<td><a href="${pageContext.request.contextPath}/recipe/recipeBoardView?recipeNo=${rvo.recipeNo}">${rvo.recipeName}</a></td>
														<td>${rvo.memberId }</td>
														<td>${rvo.reportContent }</td>
														<td>${rvo.reportTime }</td>
													</tr>
												</c:forEach>
												</tbody>
											</table>
											<div class="col-12 text-center">
												<button class="btn delicious-btn mt-30" type="submit">신고된 게시물 삭제!</button>
											</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- !탭 -->
						<!-- 여기에다 탭 추가 -->
					</div>
				</div>
			</div>
		</div>
</section>
<!-- ##### Small Receipe Area End ##### -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script>
	$(document).ready( function(){
		$("#category").change( function(){
			var $category = $("#category").val();
			// 레시피 총 갯수 받아오는 ajax
			$.ajax({
				type:"get",
				url:"recipeCountByCategory",
				dataType:"json",
				data:"category=" + $category,
				success:function(totalRecipeCount){
					$("#totalCount").html("총 <span>" + totalRecipeCount +"</span>개의 맛있는 레시피가 있습니다 !");
				},// success
				error:function(request,status,error){
			        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }// error
			}); //ajax
			// 레시피 리스트 받아오는 ajax
			$.ajax({
				type:"get",
				url:"recipeListByCategoryAjax",
				data:"category=" + $category,
				success:function(result){
					console.log(result);
					$("#recipeListAjax").html(result);
				},// success
				error:function(request,status,error){
			        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       }// error
			}); //ajax
			
		}) // change
	});
</script>
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
<!-- ##### Best Receipe Area Start ##### -->
<section class="best-receipe-area">
	<div class="container">
		<div class="receipe-post-search mb-50 mt-70">
            <div class="container">
                <form action="#" method="post">
                    <div class="row">
                        <div class="col-12 col-lg-3">
                            <select name="category" id="category">
                                <option value="전체">전체보기</option>
                                <option value="한식">한식</option>
                                <option value="중식">중식</option>
                                <option value="일식">일식</option>
                                <option value="양식">양식</option>
                            </select>
                        </div>
                        <!--  
                        <div class="col-12 col-lg-3">
                            <select name="sort" id="sort">
                                <option value="추천순">추천순</option>
                                <option value="최근순">최신순</option>
                                <option value="댓글순">댓글순</option>
                            </select>
                        </div>
                        -->
                    </div>
                </form>
            </div>
        </div>
		<div class="row recipeWrap">
			<div id="totalCount">
				총 <span>${totalRecipeCount}</span>개의 맛있는 레시피가 있습니다 !
			</div>
		</div>
		<div class="row" id="recipeListAjax">
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
								<span>작성자 : ${recipeVO.memberVO.nick}<%-- <i class="fas fa fa-heart" style="color:tomato"></i>--><!--&nbsp;&nbsp;|&nbsp;&nbsp; </span>
								  <span>조회수 : ${recipeVO.hits}</span>--%>
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
			</c:forEach><!-- // forEach -->
		</div>
		<!-- Pagination -->
		<c:set var="pb" value="${requestScope.pagingBean}"></c:set>
		<ul class="pagination justify-content-center">
			<%--  이전 pageGroup 이 있으면 (<< 표시될 것이 있으면 ) --%>
			<c:if test="${pb.previousPageGroup}">
				<li class="page-item"><a class="page-link"
					href="${pageContext.request.contextPath}/recipe/recipeBoardList?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
			</c:if>
			<c:forEach var="page" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
				<c:choose>
					<%-- 현재 페이지 표시 --%>
					<c:when test="${pb.nowPage==page }">
						<li class="page-item active"><a class="page-link"
							href="${pageContext.request.contextPath}/recipe/recipeBoardList?pageNo=${page}">${page}</a></li>
					</c:when>
					<c:otherwise>
						<li><a class="page-link"
							href="${pageContext.request.contextPath}/recipe/recipeBoardList?pageNo=${page}">${page}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pb.nextPageGroup}">
				<li><a class="page-link"
					href="${pageContext.request.contextPath}/recipe/recipeBoardList?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
			</c:if>
		</ul>
		<!-- /.Pagination -->
		<sec:authorize access="isAuthenticated()">
		<div class="row mt-50">
			<button type="button" class="btn btn-outline-success" onclick="location.href='recipeBoardWriteForm'">레시피 작성</button>
		</div>
		</sec:authorize>
	</div>
</section>
<!-- ##### Best Receipe Area End ##### -->

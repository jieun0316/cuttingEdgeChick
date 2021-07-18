<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- ##### Best Receipe Area Start ##### -->
    <section class="best-receipe-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading">
                        <h3>The best Receipies</h3><br>
                        <h6>(작성일 기준으로 30일 이내만 표시됩니다)</h6>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Single Best Receipe Area -->
                <c:forEach var="recipeVO" items="${BestRecipeList}" begin="0" end="5" step="1">
                <fmt:formatNumber  var="roundavgrating" value="${recipeVO.rating}" pattern="0" />
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-best-receipe-area mb-30">
                        <img src="${pageContext.request.contextPath}/upload/${recipeVO.recipeThumbnail}" alt="">
                        <div class="receipe-content">
                            <a href="${pageContext.request.contextPath}/recipe/recipeBoardView?recipeNo=${recipeVO.recipeNo}">
                                <h5>[${recipeVO.category}] ${recipeVO.recipeName}</h5>
                            </a>
                            <div class="ratings">
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
								<!--  <br><span>조회수 : ${recipeVO.hits}</span>-->
							</div>
                        </div>
                    </div>
                </div>
			</c:forEach>
			<!-- // forEach -->

            </div>
        </div>
    </section>
    <!-- ##### Best Receipe Area End ##### -->
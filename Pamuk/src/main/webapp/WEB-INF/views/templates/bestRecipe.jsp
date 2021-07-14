<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!-- ##### Best Receipe Area Start ##### -->
    <section class="best-receipe-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading">
                        <h3>The best Receipies</h3>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Single Best Receipe Area -->
                <c:forEach var="recipeVO" items="${BestRecipeList}" begin="0" end="5" step="1">
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-best-receipe-area mb-30">
                        <img src="${pageContext.request.contextPath}/upload/${recipeVO.recipeThumbnail}" alt="">
                        <div class="receipe-content">
                            <a href="receipe-post.html">
                                <h5>[${recipeVO.category}] ${recipeVO.recipeName}</h5>
                            </a>
                            <div class="ratings">
								<span>조회수 : ${recipeVO.hits}</span>
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
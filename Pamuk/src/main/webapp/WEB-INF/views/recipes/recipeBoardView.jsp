<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication var="mvo" property="principal" /> 

<script type="text/javascript">
$(document).ready(function () {
	  function setRating(rating) {
	    $('#rating-input').val(rating);
	    // fill all the stars assigning the '.selected' class
	    $('.rating-star').removeClass('fa-star-o').addClass('selected');
	    // empty all the stars to the right of the mouse
	    $('.rating-star#rating-' + rating + ' ~ .rating-star').removeClass('selected').addClass('fa-star-o');
	  }
	  
	  $('.rating-star')
	  .on('mouseover', function(e) {
	    var rating = $(e.target).data('rating');
	    // fill all the stars
	    $('.rating-star').removeClass('fa-star-o').addClass('fa-star');
	    // empty all the stars to the right of the mouse
	    $('.rating-star#rating-' + rating + ' ~ .rating-star').removeClass('fa-star').addClass('fa-star-o');
	  })
	  .on('mouseleave', function (e) {
	    // empty all the stars except those with class .selected
	    $('.rating-star').removeClass('fa-star').addClass('fa-star-o');
	  })
	  .on('click', function(e) {
	    var rating = $(e.target).data('rating');
	    setRating(rating);
	  })
	  .on('keyup', function(e){
	    // if spacebar is pressed while selecting a star
	    if (e.keyCode === 32) {
	      // set rating (same as clicking on the star)
	      var rating = $(e.target).data('rating');
	      setRating(rating);
	    }
	  });
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
<div class="receipe-post-area section-padding-80">
	<div class="receipe-content-area">
		<div class="container">
			<div class="row">
				<div class="col-12 col-md-8">
					<div class="row mt-50">
						<form action="deleteRecipeForm" method="post">
							<sec:csrfInput />
							<button type="submit" class="btn btn-outline-success">레시피 삭제</button>
							<input type="hidden" name="recipeNo" value="${recipeVO.recipeNo}">
						</form>
					</div>
					<div class="breadcumb-area recipe bg-img receipe-headline my-5"
						style="background-image: url(${pageContext.request.contextPath}/upload/${recipeVO.recipeThumbnail});">
						<div class="recipeTitleWrap">
							<span>${recipeVO.writeDate}</span>
							<h2>${recipeVO.recipeName}</h2>
							<div class="receipe-duration">
								<h3>카테고리: ${recipeVO.category}</h3>
								<h6>작성자 : ${recipeVO.memberVO.memberId}</h6>
							</div>
						</div>
						
					</div>
				</div>

				<div class="col-12 col-md-4">
					<div class="receipe-ratings text-right my-5">
					
						<div class="ratings">
							<i class="fa fa-star" aria-hidden="true"></i> <i
								class="fa fa-star" aria-hidden="true"></i> <i class="fa fa-star"
								aria-hidden="true"></i> <i class="fa fa-star" aria-hidden="true"></i>
							<i class="fa fa-star-o" aria-hidden="true"></i>
						</div>
						
					</div>
					
				</div>
			</div>

			<div class="row">
				<div class="col-12 col-lg-8">
					<!-- Single Preparation Step -->
					<c:forEach items="${recipeVO.recipeContentList}" var="content">
						<div class="prepStep">

							<div class="single-preparation-step d-flex">
								<div class="preImgStep1 img mr-15">
									<img
										src="${pageContext.request.contextPath}/upload/${content.imagePath}"
										alt="">
								</div>
								<h4>${content.stepNo}.</h4>
								<h5 class="mr-15">${content.stepTitle}</h5>
								
								<%-- <p>${paramMap.recipeContentVOList}</p> --%>
							</div>
							<p class="mt-15">${content.content}</p>
						</div>
                    	<hr>
					</c:forEach>
				</div>

				<!-- Ingredients -->
				<div class="col-12 col-lg-4">
					<div class="ingredients">
						<h4>필요한 재료</h4>

						<!-- Custom Checkbox -->
						<c:forEach items="${recipeVO.recipeItemList}" var="item" varStatus="order">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input"
								id="customCheck${order.count}"> <label class="custom-control-label"
								for="customCheck${order.count}">${item.itemName}, ${item.qty}</label>
						</div>
						</c:forEach>

						
					</div>
					
				</div>
				
			</div>
			<div class="row col-6 text-left mb-15">
				<h3>리뷰</h3>
			</div>
			<!-- 댓글 리스트 -->
			<c:forEach items="${reviewList}" var="review">
			
			<div class="container">
				<div class="card">
				    <div class="card-body">
				        <div class="row">
			        	    <div class="col-md-12">
			        	        <p>
			        	        	<strong>${review.memberVO.nick}</strong>&nbsp;&nbsp;&nbsp;${review.reviewDate}&nbsp;&nbsp;&nbsp;
			        	        	<c:choose>
			        	        		<%-- 만점(5개)일때 --%>
										<c:when test="${review.rating == 5}">
											<c:forEach begin="1" end="${review.rating}" step="1">
				        	        	 	<span class="float"><i class="text-warning fa fa-star"></i></span>
				        	        		</c:forEach>
										</c:when>
										<%-- 1~4점 --%>
										<c:otherwise> 
											<c:forEach begin="1" end="${review.rating}" step="1">
				        	        		 <span class="float"><i class="text-warning fa fa-star"></i></span>
				        	        		</c:forEach>
				        	        		<c:forEach begin="1" end="${5-review.rating}" step="1">
				        	        		 <span class="float"><i class="text-warning fa fa-star-o"></i></span>
				        	        		</c:forEach>
										</c:otherwise>
										</c:choose>
			        	       </p>
			        	       <div class="clearfix"></div>
			        	        <p>${review.reviewComment}</p>
			        	        <p>
			        	        	<c:choose>
			        	        		<c:when test="${review.memberVO.memberId==mvo.memberId}">
			        	        			<a class="float-right btn btn-outline-primary ml-2"><i class="fa fa-trash"></i> 삭제</a>
			        	          			<a class="float-right btn btn-outline-primary ml-2"> <i class="fa fa-reply"></i> 수정</a>
			        	        		</c:when>
			        	        		<c:otherwise>
											 <a class="float-right btn text-white btn-danger"> <i class="fa fa-heart"></i> Like</a>
			        	        		</c:otherwise>
			        	        	</c:choose>
			        	       </p>
			        	    </div>
				        </div>
				    </div>
				</div>
			</div>
			<hr>
			</c:forEach>
			<!-- 댓글 작성 -->
			<section class="write-review-area">
			<sec:authorize access="hasRole('ROLE_MEMBER')">
			<div class="container">
				<div class="card">
				    <div class="card-body">
				        <div class="row">
			        	    <div class="col-md-12">
			        	    	<h4>리뷰 쓰기</h4>
			        	    	<form action="${pageContext.request.contextPath}/recipe/writeReview" method="post" id="postReview">
			        	    	<sec:csrfInput/>
			        	            <input type="hidden" name="recipeVO.recipeNo" value="${recipeVO.recipeNo}" id="recipeNo"/>
									<input type="hidden" name="rating" id="rating-input" min="1" max="5" />
										<div class="rating" role="optgroup">
											<i class="fa fa-star-o fa-2x rating-star" id="rating-1" data-rating="1" tabindex="0" aria-label="Rate as one out of 5 stars" role="radio"></i>
											<i class="fa fa-star-o fa-2x rating-star" id="rating-2" data-rating="2" tabindex="0" aria-label="Rate as two out of 5 stars" role="radio"></i>
											<i class="fa fa-star-o fa-2x rating-star" id="rating-3" data-rating="3" tabindex="0" aria-label="Rate as three out of 5 stars" role="radio"></i>
											<i class="fa fa-star-o fa-2x rating-star" id="rating-4" data-rating="4" tabindex="0" aria-label="Rate as four out of 5 stars" role="radio"></i>
											<i class="fa fa-star-o fa-2x rating-star" id="rating-5" data-rating="5" tabindex="0" aria-label="Rate as five out of 5 stars" role="radio"></i>
										</div>
			        	       <div class="clearfix"></div>
			        	       	<textarea name="reviewComment" style="width:100%; border:0 none; resize: none;" placeholder="작성해주세요" rows="5"></textarea>
			        	       	<button type="submit" class="float-right btn btn-outline-primary ml-2"> <i class="fa fa-reply"></i> 작성 </button>
			        	    	</form>
			        	    </div>
				        </div>
				    </div>
				</div>
			</div>
			</sec:authorize>
			</section>
		</div>
	</div>
</div>
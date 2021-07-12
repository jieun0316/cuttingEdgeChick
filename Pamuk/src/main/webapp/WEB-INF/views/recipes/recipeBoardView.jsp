<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
<%-- <script type="text/javascript">
	$(document).ready(function(){
		$("#postReview").click(function() {
			let r_content = $("#r_content").val();
			let member_
		})
	});
</script> --%>
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

	<!-- Receipe Post Search -->
	<div class="receipe-post-search mb-80">
		<div class="container">
			<form action="#" method="post">
				<div class="row">
					<div class="col-12 col-lg-3">
						<select name="select1" id="select1">
							<option value="1">All Receipies Categories</option>
							<option value="1">All Receipies Categories 2</option>
							<option value="1">All Receipies Categories 3</option>
							<option value="1">All Receipies Categories 4</option>
							<option value="1">All Receipies Categories 5</option>
						</select>
					</div>
					<div class="col-12 col-lg-3">
						<select name="select1" id="select2">
							<option value="1">All Receipies Categories</option>
							<option value="1">All Receipies Categories 2</option>
							<option value="1">All Receipies Categories 3</option>
							<option value="1">All Receipies Categories 4</option>
							<option value="1">All Receipies Categories 5</option>
						</select>
					</div>
					<div class="col-12 col-lg-3">
						<input type="search" name="search" placeholder="Search Receipies">
					</div>
					<div class="col-12 col-lg-3 text-right">
						<button type="submit" class="btn delicious-btn">Search</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- Receipe Slider -->
	<!--  
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="receipe-slider owl-carousel">
                        <img src="img/bg-img/bg5.jpg" alt="">
                        <img src="img/bg-img/bg5.jpg" alt="">
                        <img src="img/bg-img/bg5.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
        -->

	<!-- Receipe Content Area -->
	<div class="receipe-content-area">
		<div class="container">

			<div class="row">
				<div class="col-12 col-md-8">
					<div class="receipe-headline my-5">
						<span>${recipeVO.writeDate}</span>
						<h2>${recipeVO.recipeName}</h2>
						<div class="receipe-duration">
							<h3>카테고리: ${recipeVO.category}</h3>
							<h6>작성자 : ${recipeVO.memberVO.memberId}</h6>
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
										src="${pageContext.request.contextPath}/img/bg-img/insta2.jpg"
										alt="">
										${pageContext.request.contextPath}/${imagePath}
								</div>
								<h4>${content.stepNo}.</h4>
								<h5 class="mr-15">${content.stepTitle}</h5>
								<p>${content.content}</p>
								<%-- <p>${paramMap.recipeContentVOList}</p> --%>
							</div>
						</div>
                    	<hr>
					</c:forEach>
				</div>

				<!-- Ingredients -->
				<div class="col-12 col-lg-4">
					<div class="ingredients">
						<h4>Ingredients</h4>

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

			<div class="row">
				<div class="col-12">
					<div class="section-heading text-left">
						<h3>댓글</h3>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<div class="contact-form-area">
						<form action="" method="post" id="readReview">
						<sec:csrfInput/>
							<div>
							
							</div>
						</form>
					
						<sec:authorize access="hasRole('ROLE_MEMBER')">
						<form action="${pageContext.request.contextPath}/recipe/writeReview" method="post" id="postReview">
						
							<div class="row">
								<div class="col-12 col-lg-6">
									<h6> <sec:authentication property="principal.nick" /></h6>
								</div>
								<div>
								<h6>만족도를 별로 표현해보아요~&nbsp;&nbsp;</h6>
								</div>
								<input type="hidden" name="recipeVO.recipeNo" value="${recipeVO.recipeNo}" id="recipeNo"/>
								<input type="hidden" name="rating" id="rating-input" min="1" max="5" />
								<div class="rating" role="optgroup">
									<i class="fa fa-star-o fa-2x rating-star" id="rating-1" data-rating="1" tabindex="0" aria-label="Rate as one out of 5 stars" role="radio"></i>
									<i class="fa fa-star-o fa-2x rating-star" id="rating-2" data-rating="2" tabindex="0" aria-label="Rate as two out of 5 stars" role="radio"></i>
									<i class="fa fa-star-o fa-2x rating-star" id="rating-3" data-rating="3" tabindex="0" aria-label="Rate as three out of 5 stars" role="radio"></i>
									<i class="fa fa-star-o fa-2x rating-star" id="rating-4" data-rating="4" tabindex="0" aria-label="Rate as four out of 5 stars" role="radio"></i>
									<i class="fa fa-star-o fa-2x rating-star" id="rating-5" data-rating="5" tabindex="0" aria-label="Rate as five out of 5 stars" role="radio"></i>
								</div>
								<div class="col-12">
									<textarea name="reviewComment" class="form-control" id="reviewComment"
										cols="30" rows="10" placeholder="작성하실 댓글을 입력해주세요~"></textarea>
								</div>
								<div class="col-12">
									<button class="btn delicious-btn mt-30" type="submit">댓글 등록</button>
								</div>
							</div>
						</form>
						</sec:authorize>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
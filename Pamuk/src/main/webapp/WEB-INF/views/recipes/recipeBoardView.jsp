<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication var="mvo" property="principal" /> 


<script type="text/javascript">
//모든 Ajax Post 요청에 대해 Http 헤더에 CSRF 토큰을 설정

$.ajaxPrefilter(function(options) {

   let headerName = '${_csrf.headerName}';

   let token = '${_csrf.token}';

   if (options.type.toLowerCase() === 'post') {
      options.headers = {};
      options.headers[headerName] = token;
   }
});
// 다른 곳에서 사용하기 위해 전역변수로 선언
let $step;
let $index;
let $stepTitle;
let $recipeContent;
$(document).ready(function () {
	// 수정 버튼 클릭
	$('.prepStep').on('click', ".modifyBtn", function() {
		//console.log($('.prepStep').children() );
		// 여러개 한번에 수정하는거 방지
		if( $('.prepStep').find('.btn').hasClass('modifyOkBtn') ){
			alert("한번에 한 스탭만 수정 할 수 있습니다!");
			return;
		}
		AddModifyForm(this);
		
	}); // modifyBtn on
	// 완료 버튼 클릭
	$('.prepStep').on("click", ".modifyOkBtn", function(){
		$stepTitle = $("input[name='recipeContentList[" + $index +"].stepTitle']").val();
		$recipeContent = $("textarea[name='recipeContentList[" + $index +"].content']").val();
		// 현재 수정중인 step 을 바꾸기 위해 this 객체 넘겨주기
		let $this = this;
		// ajax 처리
		$.ajax({
			type:"post",
			url:"recipeUpdateByRecipeContent",
			data:{'recipeNo':${recipeVO.recipeNo},'stepNo':$step, 'index':$index, 'stepTitle':$stepTitle, 'content':$recipeContent},
			dataType :"json", 
			async: false,
			success:function(recipeContentVO){
				ModifyOkAction(recipeContentVO, $this);
			},//callback
			error:function(request,status,error){
			    console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}// error
		});//ajax
	});

	var isSaved = "<c:out value='${isSaved}'/>";
	if(isSaved == 1) {
		//저장된것은 1
		$(".saveBtn.off").hide();
		$(".saveBtn.on").show(); 
	}
	
	// recipe 수정 버튼
	// 레시피 저장 X -> 저장 O
	$(".saveBtn.off").on("click", function() {
		$.ajax({
			type: "post",
			url: "saveRecipe",
			data: {"recipeNo": $("#recipeNo").val()},
			dataType:"json",
			async: false,
			success: function(result) {
				$(".saveBtn.off").hide();
				$(".saveBtn.on").show(); 
			},
			error: function(err){
				console.log(err);    //에러가 발생하면 콘솔 로그를 찍어준다. 
			}
		});
		
	});
	
	// 레시피 저장 O -> 저장 x
	$(".saveBtn.on").on("click", function() {
		$.ajax({
			type: "post",
			url: "deleteSaveRecipe",
			data: {"recipeNo": $("#recipeNo").val()},
			dataType:"json",
			success: function(result) {
				$(".saveBtn.on").hide();
				$(".saveBtn.off").show();
			},
			error: function(err){
				console.log(err);    //에러가 발생하면 콘솔 로그를 찍어준다. 
			}
		});
		
	});

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
	  $("#deleteReviewBtn").click(function() {
		 let result = confirm("댓글을 삭제하시겠습니까?");
		 if(result){
		 	$("#deleteReview").submit();
		 } 
		  return;
		});
	  
	  $("#report").on("click",function(){
		window.open("/recipe/report-recipe?recipeNo="+${recipeVO.recipeNo}, 'report',"width = 600, height = 580, toolbar=0, top = 300, left = 700, location = no")
		});
	}); // ready
	
	// 수정하기 버튼 (수정폼 생성)
	function AddModifyForm($this){
		// 값 받아오기
		$stepTitle = $($this).parents(".prepStep").children("h4").html();
		$step = parseInt($stepTitle.substring(0, 1));
		$stepTitle = $stepTitle.substring(3, $stepTitle.length);
		$index = $step-1;
		$recipeContent  = $($this).parents(".prepStep").children("p").html();
		
		// 수정폼으로 바꾸기
		let modifyForm = '<div class="prepStep">';
		modifyForm += '<h4><input type="text" name="recipeContentList['+ $index +'].stepTitle" style="padding:10px;box-sizing:border-box;border: 1px solid #40ba37;border-radius: 15px; color:#40ba37; width:100%" value="';
		modifyForm += $stepTitle + '" required="required"></h4>';
		modifyForm += '<p class="mt-15">';
		modifyForm += '<textarea rows="5" name="recipeContentList['+ $index +'].content" style="width:100%;padding:10px;box-sizing:border-box;border: 1px solid #40ba37;border-radius: 15px; color:#40ba37" required="required">';
		modifyForm += $recipeContent ;
		modifyForm += '</textarea></p>';
		modifyForm += '<div class="d-flex justify-content-end">';
		modifyForm += '<button type="submit" class="btn btn-success btn-sm modifyOkBtn">수정완료</button>';
		modifyForm += '</div></div>';
		
		// 수정폼 add
		$($this).parents(".prepStep").html(modifyForm);
	}
	// 수정 완료 버튼 (수정완료 처리)
	function ModifyOkAction(recipeContentVO, $this){
		let modifyOkForm = '<div class="prepStep">';
		modifyOkForm += '<h4>' + $step +'. ' + recipeContentVO.stepTitle + '</h4>';
		modifyOkForm += '<div class="single-preparation-step d-flex">';
		modifyOkForm += '<div class="preImgStep1 img mr-15"><img src="/upload/' + recipeContentVO.imagePath + '" alt="">';
		modifyOkForm += '</div></div>';
		modifyOkForm += '<p class="mt-15">' + recipeContentVO.content + '</p>';
		modifyOkForm += '<div class="d-flex justify-content-end">';
		modifyOkForm += '<button type="submit" class="btn btn-outline-success btn-sm modifyBtn">수정하기</button>';
		modifyOkForm += '</div></div>';
		
		//console.log(modifyOkForm);
		// 완료폼 add
		$($this).parents(".prepStep").html(modifyOkForm);
	}

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
						<!--<form action="#">  -->
							<button class="float-right btn text-white btn-danger reportBtn" type="button" id="report"> <i class="fa fa-flag"></i> 신고하기</button>
							<!--  <input type="hidden" name="reportRecipeNo" value="${recipeVO.recipeNo}">
						</form>-->
					</div>
					<div class="breadcumb-area recipe bg-img receipe-headline my-5"
						style="background-image: url(${pageContext.request.contextPath}/upload/${recipeVO.recipeThumbnail});">
						<div class="recipeTitleWrap">
							<span>${recipeVO.writeDate}</span>
							<h2>${recipeVO.recipeName}</h2>
							<div class="receipe-duration">
								<h3>카테고리: ${recipeVO.category}</h3>
								<h6>작성자 : ${recipeVO.memberVO.nick}</h6>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-md-4">
					<%-- 게시물 별점 평균 --%>
					<div class="receipe-ratings text-right my-5">
						<c:set var="total" value="0"/>
						<c:forEach items="${reviewList}" var="review" varStatus="status">
							<c:set var="total" value="${total + review.rating}"/>
							<c:set var="avgrating" value="${total / status.count }"/>
						</c:forEach>
						<fmt:formatNumber value="${avgrating}" pattern=".0"/>
						<fmt:formatNumber  var="roundavgrating" value="${avgrating}" pattern="0" />
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
					<sec:authorize access="hasRole('ROLE_MEMBER')">					<!-- 저장되기 전 -->
					<button class="float-right btn text-danger btn-outline-danger saveBtn off" type="button"> <i class="fa fa-heart"></i> My Recipe Save</button>
					<!-- 저장완료 -->
					<button class="float-right btn text-white btn-danger saveBtn on" type="button"> <i class="fa fa-heart"></i> My Recipe Save</button>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
					<a class="float-right btn text-danger btn-outline-danger saveBtn off" href="/user/loginForm"> <i class="fa fa-heart"></i> My Recipe Save</a>
					</sec:authorize>
				</div>
			</div>

			<div class="row">
				<div class="col-12 col-lg-8">
					<!-- Single Preparation Step -->
					<c:forEach items="${recipeVO.recipeContentList}" var="content">
						<div class="prepStep">
							<h4>${content.stepNo}. ${content.stepTitle}</h4>
							

							<div class="single-preparation-step d-flex">
								<div class="preImgStep1 img mr-15">
									<img
										src="${pageContext.request.contextPath}/upload/${content.imagePath}"
										alt="">
								</div>
								<%-- <p>${paramMap.recipeContentVOList}</p> --%>
							</div>

							<p class="mt-15">${content.content}</p>
							<div class="d-flex justify-content-end">
								<button type="submit" class="btn btn-outline-success btn-sm modifyBtn">수정하기</button>
							</div>
						</div>
						<hr>
					</c:forEach>
				</div>

				<!-- Ingredients -->
				<div class="col-12 col-lg-4">
					<div class="ingredients">
						<h4>필요한 재료</h4>

						<!-- Custom Checkbox -->
						<c:forEach items="${recipeVO.recipeItemList}" var="item"
							varStatus="order">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customCheck${order.count}"> <label
									class="custom-control-label" for="customCheck${order.count}">${item.itemName},
									${item.qty}</label>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="row col-6 text-left mb-15">
				<h3>리뷰( ${countReview}개 )</h3>
			</div>
			<!-- 댓글 리스트 -->
			<c:forEach items="${reviewList}" var="review" varStatus="status">
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
			        	        <%-- 타인의 댓글은 좋아요가 보이고,  본인의 댓글은 수정, 삭제버튼이 보임 --%>
			        	        	<sec:authorize access="isAuthenticated()">
			        	        	<sec:authentication var="mvo" property="principal" />
			        	        	<c:choose>
			        	        		<c:when test="${review.memberVO.memberId==mvo.memberId}">
				        	        		<form action="${pageContext.request.contextPath}/recipe/deleteReview" method="post" name="deleteReview" id="deleteReview">
				        	        			<sec:csrfInput />
				        	        			<input type="hidden" name="recipeVO.recipeNo" value="${recipeVO.recipeNo}" id="recipeNo"/>
				        	        			<button type="button" id="deleteReviewBtn" class="float-right btn btn-outline-primary ml-2"><i class="fa fa-trash"></i> 삭제</button>
				        	        		</form>
				        	        		<form action="${pageContext.request.contextPath}/recipe/updateReview" method="post" id="updateReview">
				        	        			<sec:csrfInput />
				        	        			<input type="hidden" name="recipeVO.recipeNo" value="${recipeVO.recipeNo}" id="recipeNo"/>
				        	          			<button type="submit" class="float-right btn btn-outline-primary ml-2"><i class="fa fa-reply"></i> 수정</button>
				        	          		</form>
			        	        		</c:when>
			        	        		<c:otherwise>
											 <a class="float-right btn text-white btn-danger"> <i class="fa fa-heart"></i> 깐지용버튼</a>
			        	        		</c:otherwise>
			        	        	</c:choose>
			        	        	</sec:authorize>
			        	        	<sec:authorize access="hasRole('ROLE_ADMIN')">
										<form action="${pageContext.request.contextPath}/recipe/deleteReviewByAdmin" method="post" class="deleteReviewByAdmin">
				        	        		<sec:csrfInput />
				        	        		<input type="hidden" name="memberId" value="${review.memberVO.memberId}">
				        	        		<input type="hidden" name="recipeNo" value="${recipeVO.recipeNo}"/>
				        	        		<button type="submit" class="float-right btn btn-outline-primary ml-2"><i class="fa fa-trash"></i> 관리자 삭제</button>
				        	        	</form>				        	        	
									</sec:authorize> 
			        	       </p>
			        	    </div>
				        </div>
				    </div>
				</div>
			</div>
			<hr>
			</c:forEach>
			<script type="text/javascript">
				$(document).ready(function() {
					$(".deleteReviewByAdmin").submit(function() {
						return confirm("관리자 영역 : 삭제하시겠습니까?");
					});
				});
			</script>
			
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
			        	       	<textarea name="reviewComment" style="width:100%; border:0 none; resize: none;" placeholder="작성해주세요" rows="5" required="required"></textarea>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- Preloader -->
<div id="preloader">
	<i class="circle-preloader"></i> <img
		src="${pageContext.request.contextPath}/img/core-img/salad.png" alt="">
</div>
<!-- Scroll Banner -->
<div id="scrollBanner">
	<a href="#"><img
		src="${pageContext.request.contextPath}/img/core-img/scroll.png"
		alt="당신의 냉장고에 접속하세요!"></a>
	<p>냉장고 보기</p>
</div>

<!-- Search Wrapper -->
<div class="search-wrapper">
	<!-- Close Btn -->
	<div class="close-btn">
		<i class="fa fa-times" aria-hidden="true"></i>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<form action="#" method="post">
					<input type="search" name="search" placeholder="검색어를 입력해주세요">
					<button type="submit">
						<i class="fa fa-search" aria-hidden="true"></i>
					</button>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- ##### Header Area Start ##### -->
<header class="header-area">
	<!-- Navbar Area -->
	<div class="delicious-main-menu">
		<div class="classy-nav-container breakpoint-off">
			<div class="container">
				<!-- Menu -->
				<nav class="classy-navbar justify-content-between" id="deliciousNav">

					<!-- Logo -->
					<a class="nav-brand" href="/home"><img
						src="${pageContext.request.contextPath}/img/core-img/logo.png"
						alt=""></a>

					<!-- Navbar Toggler -->
					<div class="classy-navbar-toggler">
						<span class="navbarToggler"><span></span><span></span><span></span></span>
					</div>

					<!-- Menu -->
					<div class="classy-menu">

						<!-- close btn -->
						<div class="classycloseIcon">
							<div class="cross-wrap">
								<span class="top"></span><span class="bottom"></span>
							</div>
						</div>

						<!-- Nav Start -->
						<div class="classynav">
							<ul>
								<li><a href="index.html">Home</a></li>
								<li><a href="recipeBoardList">레시피</a>
									<ul class="dropdown">
										<li><a href="index.html">한식</a></li>
										<li><a href="blog-post.html">일식</a></li>
										<li><a href="about.html">중식</a></li>
										<li><a href="receipe-post.html">양식</a></li>
									</ul></li>
								<li><a href="#">냉장고</a>
									<ul class="dropdown">
										<li><a href="#">나의 냉장고 관리</a>
											<ul class="dropdown">
												<li><a href="index.html">냉장고 정보 등록</a></li>
												<li><a href="about.html">냉장고 정보 수정</a></li>
												<li><a href="receipe-post.html">재료 검색</a></li>
												<li><a href="blog-post.html">유통기한 임박재료</a></li>
											</ul></li>
										<li><a href="about.html">재료별 레시피 추천 </a></li>
									</ul></li>
								<li><a
									href="${pageContext.request.contextPath}/user/myInfo">내정보</a> <!-- <ul class="dropdown">
                                            <li><a href="index.html">내정보수정</a></li>
                                            <li><a href="blog-post.html">일식</a></li>
                                            <li><a href="about.html">중식</a></li>
                                            <li><a href="receipe-post.html">양식</a></li>
                                        </ul> --></li>
							</ul>

							<!-- Newsletter Form -->
							<div class="search-btn">
								<i class="fa fa-search" aria-hidden="true"></i>
							</div>
							&nbsp;&nbsp;&nbsp;
							<sec:authorize access="isAuthenticated()==false">
								<div class="login-btn">
									<span id="loginLink">Login&nbsp;&nbsp;</span><i
										class="fa fa-user" aria-hidden="true"></i>
								</div>
								<!-- <script src="/js/jquery/jquery-2.2.4.min.js"></script> -->
								<script type="text/javascript">
									$(document).ready(function() {
										$(".login-btn").click(function() {
											location.href = "/user/loginForm";
										});
									});
								</script>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<div>
									<sec:authentication property="principal.name" />
									님 안녕하세용&nbsp;&nbsp;&nbsp;
								</div>
								<div class="logout-btn">
									<a href="#" id="logoutAction">Logout&nbsp;&nbsp;<i
										class="fa fa-user" aria-hidden="true"></i></a>
								</div>
								<script type="text/javascript">
									$(document).ready(function() {
										$(".logout-btn").click(function() {
											$("#logoutForm").submit();
										});
									})
								</script>
								<form id="logoutForm"
									action="${pageContext.request.contextPath}/logout"
									method="post" style="display: none">
									<sec:csrfInput />
								</form>
							</sec:authorize>
						</div>
						<!-- Nav End -->
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>
<!-- ##### Header Area End ##### -->

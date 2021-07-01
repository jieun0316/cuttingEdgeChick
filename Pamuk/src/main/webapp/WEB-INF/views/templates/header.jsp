<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- Preloader -->
    <div id="preloader">
        <i class="circle-preloader"></i>
        <img src="${pageContext.request.contextPath}/img/core-img/salad.png" alt="">
    </div>
    <!-- Scroll Banner -->
    <div id="scrollBanner">
    	<a href="#"><img src="${pageContext.request.contextPath}/img/core-img/scroll.png" alt="당신의 냉장고에 접속하세요!"></a>
    	<p>냉장고 보기</p>
    </div>

    <!-- Search Wrapper -->
    <div class="search-wrapper">
        <!-- Close Btn -->
        <div class="close-btn"><i class="fa fa-times" aria-hidden="true"></i></div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <form action="#" method="post">
                        <input type="search" name="search" placeholder="검색어를 입력해주세요">
                        <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
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
                        <a class="nav-brand" href="index.html"><img src="${pageContext.request.contextPath}/img/core-img/logo.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- close btn -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    <li class="active"><a href="index.html">Home</a></li>
                                    <li><a href="#">레시피</a>
                                        <ul class="dropdown">
                                            <li><a href="index.html">한식</a></li>
                                            <li><a href="blog-post.html">일식</a></li>
                                            <li><a href="about.html">중식</a></li>
                                            <li><a href="receipe-post.html">양식</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">냉장고</a>
                                        <ul class="dropdown">
                                            <li><a href="#">나의 냉장고 관리</a>
                                                <ul class="dropdown">
                                                    <li><a href="index.html">냉장고 정보 등록</a></li>
                                                    <li><a href="about.html">냉장고 정보 수정</a></li>
                                                    <li><a href="receipe-post.html">재료 검색</a></li>
                                                    <li><a href="blog-post.html">유통기한 임박재료</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="about.html">재료별 레시피 추천 </a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">내정보</a>
                                        <!-- <ul class="dropdown">
                                            <li><a href="index.html">내정보수정</a></li>
                                            <li><a href="blog-post.html">일식</a></li>
                                            <li><a href="about.html">중식</a></li>
                                            <li><a href="receipe-post.html">양식</a></li>
                                        </ul> -->
                                    </li>
                                </ul>

                                <!-- Newsletter Form -->
                                <div class="search-btn">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </div>
                                <div class="login-btn">
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                </div>
                                

                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->

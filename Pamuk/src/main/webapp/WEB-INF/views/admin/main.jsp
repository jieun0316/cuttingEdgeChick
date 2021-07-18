<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%> 
<sec:authorize access="hasRole('ROLE_ADMIN')">
<sec:authentication var="mvo" property="principal" /> 

<script type="text/javascript">
	$(document).ready(function() {
		$("#manageMember").click(function() {
			alert("아직 미구현된 항목입니다.");
			return;
		});
		$("#manageBoard").click(function() {
			alert("아직 미구현된 항목입니다.");
			return;
		});
		$("#manageCategory").click(function() {
			alert("아직 미구현된 항목입니다.");
			return;
		});
	});
</script>
<div class="breadcumb-area bg-img bg-overlay"
	style="background-image: url(/img/bg-img/breadcumb4.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcumb-text text-center">
					<h2> ${mvo.name} 님 관리자 메인화면입니다 </h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ##### Breadcumb Area End ##### -->
    <!-- ##### Contact Form Area Start ##### -->
    <div class="contact-area section-padding-0-80">
        <div class="container">
	
            <div class="row mt-100">
                <div class="col-12">
                    <div class="contact-form-area">
                    	<div class="breadcumb-text text-center">
                            <h4>관리하실 정보를 선택해주세요</h4>
                        </div>
                       <div class="row mt-70">
							<div class="row" style="margin:0 auto">
							<form action="#" method="get">
								<div class="col-6 text-center">
									<button class="btn delicious-btn mt-30" type="submit" id="manageMember">유저 관리</button>
								</div>
							</form>
							<form action="/admin/starChefList" method="get">
								<div class="col-6 text-center">
									<button class="btn delicious-btn mt-30" type="submit">스타쉐프 관리</button>
								</div>
							</form>
							<form action="#" method="get">
								<div class="col-6 text-center">
									<button class="btn delicious-btn mt-30" type="submit" id="manageBoard">게시글 관리</button>
								</div>
							</form>
							<form action="#" method="get">
								<div class="col-6 text-center">
									<button class="btn delicious-btn mt-30" type="submit">신고된 글 보기</button>
								</div>
							</form>
							<form action="#" method="get">
								<div class="col-6 text-center">
									<button class="btn delicious-btn mt-30" type="submit" id="manageCategory">재료 카테고리 관리</button>
								</div>
							</form>
							<div class="row" style="margin:0 auto">
							<sec:authorize access="hasRole('ROLE_MASTER') and hasRole('ROLE_ADMIN') and hasRole('ROLE_MEMBER')">
							<form action="/master/findMemberAll" method="post">
							<sec:csrfInput />
								<div class="col-6 text-center">
									<button class="btn delicious-btn mt-30" type="submit">관리자 권한부여</button>
								</div>
							</form>
							<form action="/master/adminList" method="post">
							<sec:csrfInput />
								<div class="col-6 text-center">
									<button class="btn delicious-btn mt-30" type="submit">관리자 리스트조회</button>
								</div>
							</form>
							</sec:authorize> 
						</div>
					</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</sec:authorize>
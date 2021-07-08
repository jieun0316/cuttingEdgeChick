<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<div class="breadcumb-area bg-img bg-overlay"
	style="background-image: url(/img/bg-img/breadcumb4.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcumb-text text-center">
					<h2>내 정보</h2>
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
					  					<%-- <sec:authorize access="isAuthenticated()"> --%>
					<div class="breadcumb-text text-center">
						<h6>
						 <sec:authentication property="principal" var="mvo"/>
							아이디:	<sec:authentication property="principal.memberId" />
							<br> 이름:
							<sec:authentication property="principal.name" />
							<br> 별명:
							<sec:authentication property="principal.nick" />
							<br> email:
							<sec:authentication property="principal.email" />
							<br> 생일:
							<sec:authentication property="principal.birth" />
							<br> 성별:
							<sec:authentication property="principal.gender" />
							<br>

							<c:choose>
								<c:when test="${mvo.gender=='M'}">
								남성
								</c:when>
								<c:otherwise>
								여성
								</c:otherwise>						

							</c:choose>

						</h6>
					</div>

					<div class="row mt-70">
						<div class="row" style="margin: 0 auto">
							<form action="user/loginForm" method="get">
								<div class="col-6 text-center">
									<button class="btn delicious-btn mt-30" type="submit">회원정보
										수정하기</button>
								</div>
							</form>
							<!-- 
							<form action="user/findMemberPasswordForm" method="get">
								<div class="col-6 text-center">
									<button class="btn delicious-btn mt-30" type="submit">비밀번호 찾기</button>
								</div>
							</form>
							 -->
						</div>
					</div>
					<%-- </sec:authorize> --%>
				</div>
			</div>
		</div>
	</div>
</div>
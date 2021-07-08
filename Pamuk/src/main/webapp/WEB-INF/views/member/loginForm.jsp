<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!-- ##### Breadcumb Area Start ##### -->
<div class="breadcumb-area bg-img bg-overlay"
	style="background-image: url(/img/bg-img/breadcumb4.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcumb-text text-center">
					<h2>Login</h2>
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
							<form action="${pageContext.request.contextPath}/login"	method="post" id="login">
								<div class="row mt-70">
								
									<sec:csrfInput />
									<div class="col-12 col-lg-7  ml-auto mr-auto">
										<input type="text" class="form-control" name="memberId"
											placeholder="아이디">
									</div>
									<div class="col-12 col-lg-7  ml-auto mr-auto mb-30">
										<input type="password" class="form-control" name="password"
											placeholder="패스워드">
									</div>
									<div class="col-12 text-center">
										<button class="btn delicious-btn mt-30" type="submit">로그인</button>
									</div>
								
								<div class="col-12 col-lg-12 mt-30" align="center">
									<a href="registerForm">회원가입</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
									<a href="findMemberIdForm">아이디 찾기</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
									<a href="findMemberPasswordForm">비밀번호 찾기</a>
								</div>
							</div>
							</form>
						</div>
					</div>
            </div>
        </div>
    </div>
    <!-- ##### Contact Form Area End ##### -->
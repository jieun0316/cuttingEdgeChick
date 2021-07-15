<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<div class="breadcumb-area bg-img bg-overlay"
	style="background-image: url(/img/bg-img/breadcumb4.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcumb-text text-center">
					<h2>회원정보 수정(닉네임만 변경 가능)</h2>
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
					<form
						action="${pageContext.request.contextPath}/user/updateMemberInfo"
						method="post" id="updForm">
						<sec:authentication property="principal" var="mvo" />
						<sec:csrfInput />
						<div class="row mt-70">
							<div class="col-12 col-lg-7  ml-auto mr-auto mb-30">
								아이디 <input type="text" class="form-control" id="memberId"
									name="memberId" placeholder="${mvo.memberId}"
									readonly="readonly" value="${mvo.memberId }">
							</div>
							<div class="col-12 col-lg-7  ml-auto mr-auto">
								비밀번호 <input type="password" class="form-control" name="password"
									placeholder="*******" readonly="readonly">
							</div>
							<div class="col-12 col-lg-7  ml-auto mr-auto">
								이름 <input type="text" class="form-control" name="name"
									placeholder="${mvo.name}" readonly="readonly">
							</div>
							<div class="col-12 col-lg-7  ml-auto mr-auto">
								이메일 <input type="email" class="form-control" name="email"
									placeholder="${mvo.email }" readonly="readonly">
							</div>
							<div class="col-12 col-lg-7  ml-auto mr-auto">
								닉네임 <input type="text" class="form-control" name="nick"
									placeholder="${mvo.nick}" required="required">
							</div>
							<div class="col-12 col-lg-7  ml-auto mr-auto">
								생년월일 <input type="date" class="form-control" name="birth"
									placeholder="${mvo.birth}" readonly="readonly">
							</div>
							<div class="col-12 col-lg-7 ml-auto mr-auto mb-30">
								성별 <input type="text" class="form-control" name="gender" readonly="readonly" placeholder="${mvo.gender }">
							</div>
							<div class="col-12 text-center">
								<button class="btn delicious-btn mt-30" type="submit">수정하기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
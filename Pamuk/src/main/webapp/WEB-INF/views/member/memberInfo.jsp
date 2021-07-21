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

					<sec:authentication property="principal" var="mvo" />
					<sec:csrfInput />
					<div class="row mt-70">
						<div class="col-12 col-lg-7  ml-auto mr-auto mb-30">
							아이디 <input type="text" class="form-control" id="memberId"
								name="memberId" placeholder="${mvo.memberId}"
								readonly="readonly">
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
								placeholder="${mvo.nick}" readonly="readonly">
						</div>
						<div class="col-12 col-lg-7  ml-auto mr-auto">
							생년월일 <input type="text" class="form-control" name="birth"
								placeholder="${mvo.birth}" readonly="readonly">
						</div>
						<div class="col-12 col-lg-7 ml-auto mr-auto mb-30">
							성별
							<c:choose>
								<c:when test="${mvo.gender=='M'}">
									<input type="text" class="form-control" name="gender"
										readonly="readonly" placeholder="남성">
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" name="gender"
										readonly="readonly" placeholder="여성">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-12 col-lg-7 ml-auto mr-auto mb-30">
							<div class="row">
							<sec:authorize access="hasRole('ROLE_MEMBER')">

								<form
									action="${pageContext.request.contextPath}/user/updateMemberInfoForm"
									method="post">
									<div class="col-6 text-center " style="float: left;">
										<sec:csrfInput />
										<button class="btn delicious-btn mt-30" type="submit">닉네임
											수정하러가기</button>
									</div>
								</form>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_MEMBER')">

								<form
									action="${pageContext.request.contextPath}/user/quitMember"
									method="post">
									<%-- /<input type="hidden" value="${mvo.memberId}" id="memberId" --%>
									<div class="col-10 text-center" style="float: left;">
										<sec:csrfInput />
										<button class="btn delicious-btn mt-30" type="submit">회원
											탈퇴</button>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
	$(document).ready(
		function() {
			var checkResultId = "";
			$("#regForm").submit(function() {
			if (checkResultId == "") {
				alert("아이디 중복확인을 하세요");
				return false;
			}//if
		}//function
	);//ready
	$("#regForm :input[name=id]").keyup(
		function() {
			var id = $(this).val().trim();
			if (id.length<4 || id.length>190) {
				$("#idCheckView").html("아이디는 4자 이상이여야 합니다.").css("background","pink");
				checkResultId = "";
				return;
			}
		// spring security 적용시 ajax post 방식은 아래와 같이 beforeSend property에서 csrf 값을 셋팅해야 함 
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/user/idcheckAjax",
		data : "memberId=" + memberId,
		beforeSend : function(xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
						xhr.setRequestHeader(
							"${_csrf.headerName}",
							"${_csrf.token}");
					},
					success : function(data) {
								if (data == "fail") {
									$("#idCheckView").html(id+ " 사용불가!").css("background","red");
									checkResultId = "";
								} else {
									$("#idCheckView").html(id
																						+ " 사용가능!")
																		.css(
																				"background",
																				"yellow");
																checkResultId = id;
															}
														}//callback			
													});//ajax
										});//keyup
					});//ready
</script>

<div class="breadcumb-area bg-img bg-overlay"
	style="background-image: url(/img/bg-img/breadcumb4.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcumb-text text-center">
					<h2>회원가입</h2>
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
						action="${pageContext.request.contextPath}/user/registerMember"
						method="post" id="regForm">
						<sec:csrfInput />
						<div class="row mt-70">
							<div class="col-12 col-lg-7  ml-auto mr-auto mb-30">
								아이디 <input type="text" class="form-control" id="memberId"
									name="id" placeholder="아이디를 입력해주세요" required="required">
								<span id="idCheckView" class="ml-15"></span>
							</div>

							<div class="col-12 col-lg-7  ml-auto mr-auto">
								비밀번호 <input type="password" class="form-control" name="password"
									placeholder="패스워드를 입력해주세요" required="required">
							</div>

							<div class="col-12 col-lg-7  ml-auto mr-auto">
								이름 <input type="text" class="form-control" name="name"
									placeholder="이름을 입력해주세요" required="required">
							</div>

							<div class="col-12 col-lg-7  ml-auto mr-auto">
								이메일 <input type="email" class="form-control" name="email"
									placeholder="이메일을 입력해주세요" required="required">
							</div>

							<div class="col-12 col-lg-7  ml-auto mr-auto">
								닉네임 <input type="text" class="form-control" name="nick"
									placeholder="닉네임을 입력해주세요" required="required">
							</div>

							<div class="col-12 col-lg-7  ml-auto mr-auto">
								생년월일 <input type="date" class="form-control" name="birth"
									placeholder="생년월일을 입력해주세요" required="required">
							</div>

							<div class="col-12 col-lg-7 ml-auto mr-auto mb-30">
								성별 <select name="gender">
									<option value="">성별</option>
									<option value="M">남자</option>
									<option value="F">여자</option>
								</select>
							</div>

							<div class="col-12 text-center">
								<input type="submit" class="btn delicious-btn mt-30"
									value="가입하기">
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
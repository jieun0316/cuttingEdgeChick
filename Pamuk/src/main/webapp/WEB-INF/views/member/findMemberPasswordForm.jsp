<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="breadcumb-area bg-img bg-overlay"
	style="background-image: url(img/bg-img/breadcumb4.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcumb-text text-center">
					<h2>회원님의 비밀번호를 찾습니다</h2>
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
                        <form action="#" method="post">
                            <div class="row mt-70">
                                <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	아이디
                                    <input type="text" class="form-control" id="memberId" placeholder="가입하신 회원님의 아이디를 입력해주세요">
                                </div>
                                 <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	이름
                                    <input type="text" class="form-control" id="name" placeholder="가입하신 분의 이름을 넣어주세요">
                                </div>
                                 <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	이메일
                                    <input type="email" class="form-control" id="email" placeholder="가입할 때 입력한 이메일을 넣어주세요">
                                </div>
                                <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	생년월일
                                    <input type="date" class="form-control" id="birth" placeholder="가입하신 분의 생년월일을 넣어주세요">
                                </div>
                                <div class="col-12 text-center">
                                    <button class="btn delicious-btn mt-30" type="submit">비밀번호 찾기</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
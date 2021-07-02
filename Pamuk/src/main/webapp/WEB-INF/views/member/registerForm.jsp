<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="breadcumb-area bg-img bg-overlay"
	style="background-image: url(img/bg-img/breadcumb4.jpg);">
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
                        <form action="#" method="post">
                            <div class="row mt-70">
                                <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	아이디
                                    <input type="text" class="form-control" id="memberId" placeholder="사용하실 아이디를 입력해주세요">
                                </div>
                                <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	비밀번호
                                    <input type="password" class="form-control" id="password" placeholder="사용하실 패스워드를 입력해주세요">
                                </div>
                                 <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	이름
                                    <input type="text" class="form-control" id="name" placeholder="이름을 넣어주세요">
                                </div>
                                 <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	이메일
                                    <input type="email" class="form-control" id="email" placeholder="사용하실 이메일을 입력해주세요">
                                </div>
                                <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	닉네임
                                    <input type="text" class="form-control" id="nick" placeholder="사용하실 닉네임을 입력해주세요">
                                </div>
                                <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	생년월일
                                    <input type="date" class="form-control" id="birth" placeholder="가입하시는 분의 생년월일을 입력해주세요">
                                </div>
                                <div class="col-12 col-lg-7 ml-auto mr-auto mb-30">
                                성별
                            		<select name="select1" id="select1">
                              			<option value="1">성별</option>
                               			<option value="1">남자</option>
                         		    	<option value="1">여자</option>
                            </select>
                        </div>
                                <div class="col-12 text-center">
                                    <button class="btn delicious-btn mt-30" type="submit">가입하기</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
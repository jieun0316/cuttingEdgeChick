<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="breadcumb-area bg-img bg-overlay"
	style="background-image: url(/img/bg-img/breadcumb4.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcumb-text text-center">
					<h2>회원님의 아이디를 찾습니다</h2>
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
                            <h6>해당하는 아이디를 찾을 수 없습니다</h6>
                        </div>
                       <div class="row mt-70">
							<div class="row" style="margin:0 auto">
							<form action="findMemberId" method="get">
								<div class="col-6 text-center">
									<button class="btn delicious-btn mt-30" type="submit">로그인 하러가기</button>
								</div>
							</form>
							<form action="findMemberId" method="get">
								<div class="col-6 text-center">
									<button class="btn delicious-btn mt-30" type="submit">비밀번호 찾기</button>
								</div>
							</form>
						</div>
					</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
	레시피 게시판 목록 보기 페이지
 -->
<!-- ##### Breadcumb Area Start ##### -->
<div class="breadcumb-area bg-img bg-overlay"
	style="background-image: url(img/bg-img/breadcumb3.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcumb-text text-center">
					<h2>Recipes</h2>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ##### Contact Form Area Start ##### -->
<div class="contact-area section-padding-0-80">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section-heading">
					<h3>레시피 등록하기</h3>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-12">
				<div class="contact-form-area">
					<form action="#" method="post">
						<div class="row">
							<div class="col-12 col-lg-6">
								<input type="text" class="form-control" id="name"
									placeholder="Name">
							</div>
							<div class="col-12 col-lg-6">
								<input type="email" class="form-control" id="email"
									placeholder="E-mail">
							</div>
							<div class="col-12">
								<input type="text" class="form-control" id="subject"
									placeholder="Subject">
							</div>
							<div class="col-12">
								<textarea name="message" class="form-control" id="message"
									cols="30" rows="10" placeholder="Message"></textarea>
							</div>
							<div class="col-12 text-center">
								<button class="btn delicious-btn mt-30" type="submit">Send</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ##### Contact Form Area End ##### -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#findId").submit(function(){
			if($("#findId :input[name=name]").val()==""){
				alert("이름을 입력해주세요");
				return false;
			} else if ($("#findId :input[name=name]").val().trim()=="") {
				alert("이름 입력란에 공백을 지워주세요");
				return false;
			} 
			
			if($("#findId :input[name=email]").val()==""){
				alert("이메일을 입력해주세요");
				return false;
			} else if ($("#findId :input[name=email]").val().trim()=="") {
				alert("이메일 입력란에 공백을 지워주세요");
				return false;
			} 
			
			if($("#findId :input[name=birth]").val()==""){
				alert("생일을 입력해주세요");
				return false;
			} 
		});
	});
</script>


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
                            <h6>가입할 때 사용하신 이메일로 아이디를 찾아요</h6>
                        </div>
                        <form action="${pageContext.request.contextPath}/user/findMemberId" method="post" id="findId">
                        <sec:csrfInput />
                            <div class="row mt-70">
                                 <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	이름
                                    <input type="text" class="form-control" name="name" placeholder="가입하신 분의 이름을 넣어주세요">
                                </div>
                                 <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	이메일
                                    <input type="email" class="form-control" name="email" placeholder="가입할 때 입력한 이메일을 넣어주세요">
                                </div>
                                <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	생년월일
                                    <input type="date" class="form-control" name="birth" placeholder="가입하신 분의 생년월일을 넣어주세요">
                                </div>
                                <div class="col-12 text-center">
                                    <button class="btn delicious-btn mt-30" type="submit">아이디 찾기</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
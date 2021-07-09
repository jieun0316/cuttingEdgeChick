<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
$(document).ready(function(){
	let checkResultId="";
	let gender=$("select[name=gender]").val();
	
	$("#regForm").submit(function(){
		if(checkResultId==""){
			alert("아이디 중복확인을 하세요");
			return false;
		}
		if(gender==""){
			alert("성별을 넣어주세요");
			return false;
		}
	});
		// spring security 적용시 ajax post 방식은 아래와 같이 beforeSend property에서 csrf 값을 셋팅해야 함 
	$("#idCheck").click(function() {
		let memberId=$("#memberId").val().trim();
		
		if(memberId==""){
			alert("아이디를 넣어주세요");
			return;
		}
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/user/idCheckAjax",				
			data:"memberId="+memberId,
			beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
		        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	    },
		success:function(data){						
			if(data=="fail"){
			$("#idCheckView").text("사용불가!").css("background","red");
				checkResultId="";
			}else {						
				$("#idCheckView").text("사용가능!").css(
					"background","green");		
				checkResultId="1";
				}	//else					
			} // success		
		});//ajax
	}) //click
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
                        <form action="${pageContext.request.contextPath}/user/registerMember" method="post" id="regForm">
                        	<sec:csrfInput />
                            <div class="row mt-70">
                                <div class="col-12 col-lg-7  ml-auto mr-auto mb-30">
                                	아이디
                                    	<input type="text" class="form-control" id="memberId" name="memberId"  placeholder="사용하실 아이디를 입력해주세요" required="required">
                                    	<button id="idCheck" class="btn btn-outline-success" type="button" style="width:80%">중복확인</button>
                                    	<span id="idCheckView" class="ml-15"></span>
                                </div>
                                
                                <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	비밀번호
                                    <input type="password" class="form-control" name="password" placeholder="사용하실 패스워드를 입력해주세요" required="required">
                                </div>
                                 <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	이름
                                    <input type="text" class="form-control" name="name" placeholder="이름을 넣어주세요" required="required">
                                </div>
                                 <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	이메일
                                    <input type="email" class="form-control" name="email" placeholder="사용하실 이메일을 입력해주세요" required="required">
                                </div>
                                <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	닉네임
                                    <input type="text" class="form-control" name="nick" placeholder="사용하실 닉네임을 입력해주세요" required="required">
                                </div>
                                <div class="col-12 col-lg-7  ml-auto mr-auto">
                                	생년월일
                                    <input type="date" class="form-control" name="birth" placeholder="가입하시는 분의 생년월일을 입력해주세요" required="required">
                                </div>
                                <div class="col-12 col-lg-7 ml-auto mr-auto mb-30">
                                성별
                            		<select name="gender">
                              			<option value="">성별</option>
                               			<option value="M">남자</option>
                         		    	<option value="F">여자</option>
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
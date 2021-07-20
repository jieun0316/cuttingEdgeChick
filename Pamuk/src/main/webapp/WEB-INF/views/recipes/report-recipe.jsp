<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<style>
		body { padding:30px }
		.dd_type {
			background-color: whitesmoke;
			padding:10px 20px;
			margin-top:10px;
		}
		#pop_footer {
			text-align:center;
		}
	</style>
	
<title>게시글 신고하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
<form action="${pageContext.request.contextPath}/recipe/reportRecipe" method="post" id="reportRecipe">
<sec:csrfInput/>
<input type="hidden" name="recipeNo" value="${recipeVO.recipeNo}">
<div id="pop_wrap" style="width:530px;">
    <div id="pop_header">
        <h1 style="text-align:center">신고하기</h1>
    </div>
    <hr>
    <div id="pop_container">
        <div id="pop_content">
            <dl class="list_report">
                <dt class="first">제&nbsp;&nbsp;&nbsp;목 :</dt>
                <dd class="first">${recipeVO.recipeName}</dd>
                <dt class="dt_type2">작성자 :</dt>
                <dd class="dd_type3">${recipeVO.memberVO.nick}</dd>
			<hr>
                <dt><span>사유선택</span> :</dt>
                <dd class="dd_type">
                    <p class="desc5">여러 사유에 해당되는 경우, 대표적인 사유 1개를 선택해 주세요
                    </p>
                    <ul class="list_type">
                        <li>
                            <input type="radio" name="reportContent" value="홍보물"><label for="rdo_illegal">&nbsp;부적절한 홍보 게시글</label>
                        </li> 
                        <li>
                            <input type="radio" name="reportContent" value="음란물"> <label for="rdo_obscenity">음란성 또는 청소년에게 부적합한 내용</label>
                        </li>
                        <li>
                            <input type="radio" name="reportContent" value="명예훼손/사생활/저작권침해"> <label for="rdo_libel">명예훼손/사생활 침해 및 저작권침해등</label>
                        </li>
                        <li>
                            <input type="radio" name="reportContent"  value="불법촬영물"> <label for="rdo_illegal_photographs">불법촬영물등 신고</label>
                        </li>
                        <li>
                            <input type="radio" name="reportContent" value="기타"> <label for="rdo_etc">기타</label>
                        </li>
                    </ul>
                </dd>
            </dl>
        </div>
    </div>
    <hr>
    <div id="pop_footer">
       <img alt="신고하기" title="신고하기" id="reportBtn" src="https://ssl.pstatic.net/static/common/popup/btn_report2.gif" style="cursor:pointer" class="reportBtn">
         <img alt="취소" src="https://ssl.pstatic.net/static/common/popup/btn_cancel2.gif" onclick="window.close()" style="cursor:pointer"> 
         
    </div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		$(document).on("click", "#reportBtn", function() {
			 if($('input[name=reportContent]').is(':checked') ){
				let result = confirm("해당 게시물을 신고 하시겠습니까?");
				if(result==true){
					alert("신고가 완료되었습니다!"); 
					$("#reportRecipe").submit(); 
				} else {
					return false;
				}
			} else {
				alert("신고사유를 체크해주세요!");
				return false;
			}  
		});
	});
</script>
</form>
</body>
</html>
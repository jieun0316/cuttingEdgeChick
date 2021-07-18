<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
</head>
<body>
<div id="pop_wrap" style="width:530px;">
    <div id="pop_header">
        <h1 style="text-align:center">신고하기</h1>
    </div>
    <hr>
    <div id="pop_container">
        <div id="pop_content">
            <dl class="list_report">
			<c:forEach items="${recipeVO.recipeName}">
                <dt class="first">제&nbsp;&nbsp;&nbsp;목 :</dt>
                <dd class="first">${recipeVO.recipeName}</dd>
                <dt class="dt_type2">작성자 :</dt>
                <dd class="dd_type3">${recipeVO.memberVO.nick}</dd>
			</c:forEach>
			<hr>
                <dt><span>사유선택</span> :</dt>
                <dd class="dd_type">
                    <p class="desc5">여러 사유에 해당되는 경우, 대표적인 사유 1개를 선택해 주세요
                    </p>
                    <ul class="list_type">
                        <li>
                            <input type="radio" name="badArticleReport.badType" id="rdo_illegal" value="AA03" class="input_rdo"><label for="rdo_illegal">&nbsp;부적절한 홍보 게시글</label>
                        </li>
                        <li>
                            <input type="radio" name="badArticleReport.badType" id="rdo_obscenity" value="AA33" class="input_rdo"> <label for="rdo_obscenity">음란성 또는 청소년에게 부적합한 내용</label>
                        </li>
                        <li>
                            <input type="radio" name="badArticleReport.badType" id="rdo_libel" value="NOT_SUBMIT" class="input_rdo"> <label for="rdo_libel">명예훼손/사생활 침해 및 저작권침해등</label>
                        </li>
                        <li>
                            <input type="radio" name="badArticleReport.badType" id="rdo_illegal_photographs" value="NOT_SUBMIT" class="input_rdo"> <label for="rdo_illegal_photographs">불법촬영물등 신고</label>
                        </li>
                        <li>
                            <input type="radio" name="badArticleReport.badType" id="rdo_etc" value="AA34" class="input_rdo"> <label for="rdo_etc">기타</label>
                        </li>
                    </ul>
                </dd>
            </dl>
        </div>
    </div>
    <hr>
    <div id="pop_footer">
        <input type="image" id="btnReport" src="https://ssl.pstatic.net/static/common/popup/btn_report2.gif" alt="신고하기" title="신고하기" onMouseOver="this.src='https://ssl.pstatic.net/static/common/popup/btn_report2_over.gif'" onMouseOut="this.src='https://ssl.pstatic.net/static/common/popup/btn_report2.gif'" onclick="return submitForm();">
         <input type="image" id="btnCancel" src="https://ssl.pstatic.net/static/common/popup/btn_cancel2.gif" alt="취소" title="취소">
    </div>
</div>
</body>
</html>
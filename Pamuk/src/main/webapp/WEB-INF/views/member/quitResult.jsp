<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="${pageContext.request.contextPath}/js/jquery/jquery-2.2.4.min.js"></script>
</head>
<body>
	<form id="logoutForm"
		action="${pageContext.request.contextPath}/logout" method="post"
		style="display: none">
		<sec:csrfInput />
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			alert("탈퇴 되었습니다.");

			$("#logoutForm").submit();

		});
	</script>
</body>
</html>
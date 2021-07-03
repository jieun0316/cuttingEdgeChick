<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>   
 <a href="${pageContext.request.contextPath}/main2">두번째 메인 보기</a><br>
 <a href="${pageContext.request.contextPath}/main3">세번째 메인 보기</a><br>
 <a href="${pageContext.request.contextPath}/noneTiles">Tiles 적용안되는 jsp 보기</a><br>
<a href="${pageContext.request.contextPath}/findbyid-form">회원검색</a>
<br>
<%-- 주소로 회원검색 폼 링크 --%>
<a href="${pageContext.request.contextPath}/findbyaddress-form">
주소로 회원검색
</a>
<br><br>

















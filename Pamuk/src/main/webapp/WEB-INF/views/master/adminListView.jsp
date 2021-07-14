<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%> 
<sec:authorize access="hasRole('ROLE_MASTER')">
<%-- <sec:authentication var="mvo" property="principal" /> --%>
<div class="breadcumb-area bg-img bg-overlay"
	style="background-image: url(/img/bg-img/breadcumb4.jpg);">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-12">
				<div class="breadcumb-text text-center">
					<h2> ADMIN 리스트</h2>
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
                            <h4>관리하실 정보를 선택해주세요</h4>
						</div>
					<div class="row mt-70">
						<div class="table-responsive">
							<form action="${pageContext.request.contextPath}/master/disaccredit" method="post">
							<sec:csrfInput />
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th></th>
										<th>아이디</th>
										<th>닉네임</th>
										<th>이메일</th>
										<th>생일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${requestScope.list }" var="mvo" varStatus="status">
									<tr>
										<td><input type="radio" name="memberId" value="${mvo.memberId}"></td>
										<td>${mvo.memberId }</td>
										<td>${mvo.nick }</td>
										<td>${mvo.email }</td>
										<td>${mvo.birth }</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
								 <div class="col-12 text-center">
                                    <button class="btn delicious-btn mt-30" type="submit">권한 박탈하기</button>
                                </div>
							</form>
						</div>
					</div>
                </div>
            </div>
        </div>
    </div>
</div>
</sec:authorize>
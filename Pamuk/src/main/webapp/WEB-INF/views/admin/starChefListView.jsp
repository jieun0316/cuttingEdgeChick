<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%> 

				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<!--  <script type="text/javascript">
					$(document).ready(function(){
						$("#authorize").click(function() {
							let result = confirm("권한을 부여하시겠습니까?");
							if(result){
								
							}
						})
					})
				</script> -->
				<%-- <sec:authentication var="mvo" property="principal" /> --%>
				<div class="breadcumb-area bg-img bg-overlay"
					style="background-image: url(/img/bg-img/breadcumb4.jpg);">
					<div class="container h-100">
						<div class="row h-100 align-items-center">
							<div class="col-12">
								<div class="breadcumb-text text-center">
									<h2>스타쉐프 관리</h2>
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
				                    		<ul class="nav nav-tabs" id="myTab" role="tablist">
												<li class="nav-item"><a class="nav-link active" id="tab--1"
													data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1"
													aria-selected="false">스타쉐프 권한부여하기</a>
												</li>
												<li class="nav-item"><a class="nav-link" id="tab--2"
													data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2"
													aria-selected="true">스타쉐프 권한뺏기</a>
												</li>
											</ul>
										</div>
									<div class="tab-content mb-80" id="myTabContent">	
										<div class="tab-pane fade active show" id="tab1" role="tabpanel" aria-labelledby="tab--1">
											<div class="row mt-70">
											 <h4>스타쉐프를 부여하실 닉네임을 찾아주세요</h4>
												<div class="table-responsive">
												 <form action="${pageContext.request.contextPath}/admin/authorizeStarChef" method="post">
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
															<c:forEach items="${requestScope.mlist }" var="mvo" varStatus="status">
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
						                                    <button class="btn delicious-btn mt-30" type="submit" id="authorize">스타쉐프 임명!</button>
						                                </div>
												</form>	
												</div>
											</div>
										</div>
										
										<div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab--2">
											<div class="row mt-70">
											<h4>스타쉐프를 뺏으실 닉네임을 찾아주세요</h4>
												<div class="table-responsive">
													<form action="${pageContext.request.contextPath}/admin/disaccreditStarChef" method="post">
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
						                                    <button class="btn delicious-btn mt-30" type="submit">스타쉐프 뺏기!</button>
						                                </div>
													</form>
												</div>
											</div>
										</div>
									</div>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
				</sec:authorize>


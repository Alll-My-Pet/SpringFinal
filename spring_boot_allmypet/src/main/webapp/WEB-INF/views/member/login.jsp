<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<!-- head -->
		<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/member/login.css">
		<script src="<%= request.getContextPath() %>/js/member/login.js"></script>
	</head>
	<body>
		<!-- top -->
		<section class="login">
			<div class="loginTitleWrap">
				<div class="loginTitle">
					<b>로그인</b>
				</div>
			</div>
			<div class="loginBox">
				<div class="loginLeft">
					<div class="leftContext">
						<form id="loginForm" class="loginForm" method="post" action="#">
							<input type="text" name="memID" placeholder="아이디" required>
							<input type="password" name="memPwd" placeholder="비밀번호" required>
							<!-- <div class="rememberId">
								<label><input type="checkbox">아이디 저장</label>
							</div> -->
							<a class="forgot" href="/forgotID" onclick="openForgotWindow(event, 0)">아이디 찾기</a><br>
							<a class="forgot" href="/forgotPW" onclick="openForgotWindow(event, 1)">비밀번호 찾기</a>
							<button class="loginBtn" type="submit">로그인</button>
						</form>
					</div>
				</div>
				<div class="loginRight">
					<div class="rightContext">
						<b>회원이 아니신가요?</b>
						<button class="moveJoin" type="button" onclick="location.href='<%= request.getContextPath() %>/join'">회원가입</button>
					</div>
				</div>
			</div>
		</section>
		<!-- bottom -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>
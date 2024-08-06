<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<!-- head -->
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/member/login.css">
		<!-- <script src="<%= request.getContextPath() %>/js/login.js"></script> -->
	</head>
	<body>
		<!-- top -->
		<div class="login">
			<div class="loginTitle">
				<strong>로그인</strong>
			</div>
			<div class="loginPage">
				<form id="loginForm" class="wrapBox" method="post" action="#">
					<input type="text" placeholder="아이디" required>
					<input type="password" placeholder="비밀번호" required>
					<!-- <div class="rememberId">
						<label><input type="checkbox">아이디 저장</label>
					</div> -->
					<a class="forgot" href="/forgotID">아이디 찾기</a>
					<a class="forgot" href="/forgotPW">비밀번호 찾기</a>
					<button class="loginBtn" type="submit">로그인</button>
				</form>
			</div>
			<div class="loginJoin">
				<div>
					<p>회원이 아니신가요?</p>
					<button type="button" onclick="location.href='<%= request.getContextPath() %>/join'">회원가입</button>
				</div>
			</div>
		</div>
		<!-- bottom -->
	</body>
</html>
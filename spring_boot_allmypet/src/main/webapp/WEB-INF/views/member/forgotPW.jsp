<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/member/forgot.css'/>">
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
	</head>
	<body>
	<section class="find">
		<div class="findTitleWrap">
			<div class="findTitle">
				<b>비밀번호 찾기</b>
			</div>
		</div>
		<div class="findInput">
		<form id="findPWForm" class="findPWForm" method="post" action="#">
			<table>
				<tr><td><label for="id">아이디</label></td>
					<td><input type="text" id="id" name="id" class="id" required>
					<span class="error-message" id="idError"></span></td></tr>
				<tr><td><label for="email">이메일</label></td>
					<td><input type = "email" id="email" name="email" class="email" placeholder="이메일 입력" required>
					<input type="button" value="인증"onClick="sendEmail()" class="checkBtn">
					<span class="error-message" id="emailError"></span></td></tr>
				<tr><td><label for="hp1">연락처</label></td>
					<td><input type="text" id="phone" name="memHP" class="email" size="11" placeholder="숫자만 입력" required>
					<span class="error-message" id="hpError"></span></td></tr>
			</table>
			</form>
			</div>
			<div id="findPWsubmit">
				<button class="findBtn" type="submit">확인</button>
			</div>
		</section>
		<!-- bottom -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>
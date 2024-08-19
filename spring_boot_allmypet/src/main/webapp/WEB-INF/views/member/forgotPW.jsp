<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/member/forgot.css">
	</head>
	<body>
	<section class="find">
		<div class="findTitleWrap">
			<div class="findTitle">
				<b>비밀번호 찾기</b>
				<!-- asdfasdf -->
			</div>
		</div>
		<div class="findInput">
		<form id="findPWForm" class="findPWForm" method="post" action="#">
			<table>
				<tr><td><label for="id">아이디</label></td>
					<td><input type="text" id="id" name="id" class="id" required>
					<span class="error-message" id="idError"></span></td></tr>
				<tr><td><label for="email">이메일</label></td>
					<td><input type = "email" id="email" name="email" placeholder="이메일 주소 입력" class="email" required>
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
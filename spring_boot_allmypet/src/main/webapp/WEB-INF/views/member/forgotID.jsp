<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/member/forgot.css">
	</head>
	<body>
	<section class="find">
		<div class="findTitleWrap">
			<div class="findTitle">
				<b>아이디 찾기</b>
			</div>
		</div>
		<div class="findInput">
		<form id="findIDForm" class="findIDForm" method="post" action="#">
			<table>
				<tr><td><label for="name">성명</label></td>
					<td><input type="text" id="name" name="name" class="id" required>
					<span class="error-message" id="nameError"></span></td></tr>
				<tr><td><label for="email">이메일</label></td>
					<td><input type = "email" id="email" name="email" placeholder="이메일 주소 입력" class="email" required>
					<input type="button" value="인증"onClick="sendEmail()" class="checkBtn">
					<span class="error-message" id="emailError"></span></td></tr>
				<tr><td><label for="hp1">연락처</label></td><td><input type="text" id="hp1" size="3" name="hp1" class="hp" required>
									 - <input type="text" id="hp2" size="4" name="hp2" class="hp" required>
									 - <input type="text" id="hp3" size="4" name="hp3" class="hp" required>
					<span class="error-message" id="hpError"></span></td></tr>
				</table>
			</form>
			</div>
			<div id="findIDsubmit">
				<button class="findBtn" type="submit">확인</button>
			</div>
		</section>
		<!-- bottom -->
	</body>
</html>
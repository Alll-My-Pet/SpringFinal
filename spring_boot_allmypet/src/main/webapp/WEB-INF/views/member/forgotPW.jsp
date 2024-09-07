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
		<script src="<c:url value='/js/member/findPwd.js'/>"></script>
		<script src="<c:url value='/js/member/sendMail.js'/>"></script>
	</head>
	<body>
		<section class="find">
			<div class="findTitleWrap">
				<div class="findTitle">
					<b>비밀번호 찾기</b>
				</div>
			</div>
			<div class="findInput">
				<form id="findPWForm" class="findPWForm" method="post">
					<table>
						<tr><td><label for="memId">아이디</label></td>
							<td><input type="text" id="memId" name="memId" class="id" required>
							<span class="error-message" id="idError"></span></td></tr>
						<tr><td><label for="memEmail">이메일</label></td>
							<td><input type="email" id="memEmail" name="memEmail" class="email" placeholder="이메일 입력" required>
							<input id="mailCheck" type="button" value="발송" onClick="sendEmail()" class="checkBtn">
							<span class="error-message" id="emailError"></span></td></tr>
						<tr><td><label for="chnum">인증번호</label></td>
							<td><input type="text" id="chnum" name="chnum" class="id" required>
							<input id="confirm" type="button" value="인증" onClick="confirmNumber()" class="checkBtn">
							<span class="error-message" id="chnumError"></span></td></tr>
					</table>
					<div id="findSubmit">
						<input type="submit" id="findBtn" class="findBtn" value="확인">
					</div>
				</form>
			</div>
		</section>
		<!-- bottom -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>
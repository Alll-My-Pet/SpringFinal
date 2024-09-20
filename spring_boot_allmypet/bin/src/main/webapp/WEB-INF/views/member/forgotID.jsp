<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/member/forgot.css'/>">
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/member/findId.js'/>"></script>
	</head>
	<body>
		<section class="find">
			<div class="findTitleWrap">
				<div class="findTitle">
					<b>아이디 찾기</b>
				</div>
			</div>
			<div class="findInput">
				<form id="findIDForm" class="findIDForm" method="post">
					<table>
						<tr><td><label for="memName">성명</label></td>
							<td><input type="text" id="memName" name="memName" class="id" required>
							<span class="error-message" id="nameError"></span></td></tr>
						<tr><td><label for="memEmail">이메일</label></td>
							<td><input type = "email" id="memEmail" name="memEmail" class="email" placeholder="이메일 입력" required>
							<span class="error-message" id="emailError"></span></td></tr>
						<tr><td><label for="memHP">연락처</label></td>
						<td><input type="text" id="memHP" name="memHP" class="email" size="11" placeholder="숫자만 입력" required>
							<span class="error-message" id="hpError"></span></td></tr>
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
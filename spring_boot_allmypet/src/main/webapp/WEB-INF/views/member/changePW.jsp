<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기</title>
		<!-- head -->
		<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/member/change.css'/>">
	</head>
	<body>
	<section class="changePW">
		<div class="changePWTitleWrap">
			<div class="changePWTitle">
				<b>비밀번호 변경</b>
			</div>
		</div>
		<div class="changePWBox">
			<div class="changePWInput">
				<form id="changePWForm" class="changePWForm" method="post" action="#">
				<table>
					<tr><td><label for="id">아이디</label></td>
						<td><input type="text" id="id" name="id" class="id" readonly>
						<span class="error-message" id="idError"></span></td></tr>
					<tr><td><label for="pw">비밀번호</label></td>
						<td><input type="password" id="pw" name="pw" class="text">
						<span class="error-message" id="pwError"></span></td></tr>
					<tr><td><label for="pwcheck">비밀번호 확인</label></td>
						<td><input type="password" id="pwcheck" name="pwcheck" class="text">
						<span class="error-message" id="pwcheckError"></span></td></tr>
				</table>
				</form>
			</div>
		</div>
		<div id="changePWsubmit">
			<button class="changePWBtn" type="submit">변경</button>
		</div>
	</section>
	<!-- bottom -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>
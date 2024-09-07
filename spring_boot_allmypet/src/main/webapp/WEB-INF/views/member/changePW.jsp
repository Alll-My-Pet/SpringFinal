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
			<form id="changePWForm" class="changePWForm" method="post" action="#">
				<div class="changePWBox">
					<div class="changePWInput">
						<table>
							<tr><td><label for="memId">아이디</label></td>
								<td><input type="text" id="memId" name="memId" class="id" readonly>
								<span class="error-message" id="idError"></span></td></tr>
							<tr><td><label for="memPwd">비밀번호</label></td>
								<td><input type="password" id="memPwd" name="memPwd" class="text">
								<span class="error-message" id="pwError"></span></td></tr>
							<tr><td><label for="pwcheck">비밀번호 확인</label></td>
								<td><input type="password" id="pwcheck" name="pwcheck" class="text">
								<span class="error-message" id="pwcheckError"></span></td></tr>
						</table>
					</div>
				</div>
				<div id="changePWsubmit">
					<input type="submit" id="changePWBtn" class="changePWBtn" value="변경">
				</div>
			</form>
		</section>
	<!-- bottom -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>
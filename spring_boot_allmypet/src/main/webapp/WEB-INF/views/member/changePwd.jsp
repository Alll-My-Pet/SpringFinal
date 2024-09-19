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
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/member/changePwd.js'/>"></script>
	</head>
	<body>
		<section class="changePwd">
			<div class="changePwdTitleWrap">
				<div class="changePwdTitle">
					<b>비밀번호 변경</b><!-- ㅁㄴㅇㄹ -->
				</div>
			</div>
			<form id="changePwdForm" class="changePwdForm" method="post" action="#">
				<div class="changePwdBox">
					<div class="changePwdInput">
						<table>
							<tr><td><label for="memId">아이디</label></td>
								<td><input type="text" id="memId" name="memId" class="id" required>
								<span class="error-message" id="idError"></span></td></tr>
							<tr><td><label for="memPwd">비밀번호</label></td>
								<td><input type="password" id="newMemPwd" name="newMemPwd" class="text">
								<span class="error-message" id="pwError"></span></td></tr>
							<tr><td><label for="pwcheck">비밀번호 확인</label></td>
								<td><input type="password" id="pwcheck" name="pwcheck" class="text">
								<span class="error-message" id="pwcheckError"></span></td></tr>
						</table>
					</div>
				</div>
				<div id="changePwdsubmit">
					<input type="submit" id="changePwdBtn" class="changePwdBtn" value="변경">
				</div>
			</form>
		</section>
	<!-- bottom -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>
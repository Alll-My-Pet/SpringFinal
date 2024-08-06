<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기</title>
	</head>
	<body>
	<div id="findID">
		<div id="findIDinput">
		<h1>아이디 찾기</h1>
		<form id="findIDFrom" method="post" action="#">
			<table>
				<tr><td>성명</td>
					<td><input type="text" id="name" name="name" class="name">
					<span class="error-message" id="nameError"></span></td></tr>
				<tr><td>이메일</td>
					<td><input type = "email" placeholder="이메일 주소 입력">
					<span class="error-message" id="emailError"></span></td></tr>
				<tr><td>연락처</td><td><input type="text" id="hp1" size="3" name="hp1" class="name">
									 - <input type="text" id="hp2" size="4" name="hp2" class="name">
									 - <input type="text" id="hp3" size="4" name="hp3" class="name">
					<span class="error-message" id="hpError"></span></td></tr>
				</table>
			</form>
			</div>
			<div id="findIDsubmit">
				<button class="findIDbtn" type="submit">확인</button>
			</div>
		</div>
		<!-- bottom -->
	</body>
</html>
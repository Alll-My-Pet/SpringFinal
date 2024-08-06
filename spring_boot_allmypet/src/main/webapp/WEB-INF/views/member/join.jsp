<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<!-- head -->
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/join.css">
		<!-- <script src="<%= request.getContextPath() %>/js/join.js"></script> -->
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/searchAddress.js'/> "></script>
	</head>
	<body>
		<!-- top -->
		<div id="joinWrap">
			<div id="joinInput">
			<h1>회원가입</h1>
			<form id="JoinFrom" method="post" action="#">
				<table>
					<tr><td> ID</td>
						<td><input type="text" id="id" name="id" class="id">
						<input type="button" value="중복확인" class="checkBtn" onClick="checkId()">
						<span class="error-message" id="idError"></span></td></tr>
					<tr><td>비밀번호</td>
						<td><input type="password" id="pw" name="pw" class="text">
						<span class="error-message" id="pwError"></span></td></tr>
					<tr><td>비밀번호 확인</td>
						<td><input type="password" id="pwcheck" name="pwcheck" class="text">
						<span class="error-message" id="pwcheckError"></span></td></tr>
					<tr><td>닉네임</td>
						<td><input type="text" id="nickname" name="nickname" class="id">
						<input type="button" value="중복확인" class="checkBtn" onClick="checkName()">
						<span class="error-message" id="nicknameError"></span></td></tr>
				</table>
				<table>
					<tr><th>회원 정보</th></tr>
					<tr><td>성명</td>
						<td><input type="text" id="name" name="name" class="name">
						<span class="error-message" id="nameError"></span></td></tr>
					<tr><td>성별</td><td>
						 <input type="radio" id="gender1" value="male" name="gender">남
						 <input type="radio" id="gender2" value="female" name="gender">여
						 <input type="radio" id="gender3" value="not" name="gender">해당 없음
						 <span class="error-message" id="genderError"></span></td></tr>
					<tr><td>생일</td>
						<td><input type="date" id="birth" name="birth" class="id">
                          <span class="error-message" id="birthError"></span></td></tr>
					<tr><td>이메일</td>
						<td><input type = "email" placeholder="이메일 주소 입력">
						<input type="button" value="인증"   onClick="sendEmail()" class="checkbtn">
						<span class="error-message" id="emailError"></span></td></tr>
					<tr><td>주소</td>
						<td><input type="text" id="adress1" name="adress1" placeholder="우편 번호" size="5" class="id" readonly>
						<input type="button" id="searchAddressBtn" name="searchAddressBtn" value="우편번호 찾기" class="addressBtn"></td></tr>
						<tr><td></td><td><input type="text" id="adress2" name="adress2" class="text" readonly></td></tr>
						<tr><td></td><td><input type="text" id="adress3" placeholder="상세주소 입력" name="adress3" class="text">
						<span class="error-message" id="adressError"></span></td></tr>
					<tr><td>연락처</td>
						<td><input type="text" id="hp1" size="3" name="hp1" class="name">
						  - <input type="text" id="hp2" size="4" name="hp2" class="name">
						  - <input type="text" id="hp3" size="4" name="hp3" class="name">
						  <span class="error-message" id="hpError"></span></td></tr>
				</table>
			</form>
			</div>
			<!-- 이용 약관 -->
			
			<div id="joinSubmit">
				<button class="joinbtn" type="submit">완료</button>
			</div>
		</div>
		<!-- bottom -->
	</body>
</html>
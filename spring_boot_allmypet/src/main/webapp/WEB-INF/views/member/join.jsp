<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<!-- head -->
		<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/member/join.css">
		<script src="<%= request.getContextPath() %>/js/member/join.js"></script>
		<script src="<c:url value='/js/member/joinPage.js'/>"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/member/searchAddress.js'/> "></script>
	</head>
	<body>
		<!-- top -->
		<section class="join">
			<div class="joinTitleWrap">
				<div class="joinTitle">
					<b>회원가입</b>
				</div>
			</div>
			<div class="joinBox">
				<div class="joinUpper">
					<div class="upperContext">
						<form id="joinForm" class="joinForm" method="post" action="/member/insertmem">
							<table>
								<tr>
									<td><label for="id">아이디</label></td>
									<td><input type="text" id="id" name="memId" class="id">
										<input type="button" value="중복확인" class="checkBtn"  id="searchId">
										<span class="error-message" id="idError"></span>
									</td>
								</tr>
								<tr>
									<td><label for="pw">비밀번호</label></td>
									<td><input type="password" id="pw" name="memPwd" class="text">
										<span class="error-message" id="pwError"></span>
									</td>
								</tr>
								<tr>
									<td><label for="pwcheck">비밀번호 확인</label></td>
									<td><input type="password" id="pwcheck" name="pwcheck" class="text">
										<span class="error-message" id="pwcheckError"></span>
									</td>
								</tr>
								<tr>
									<td><label for="nickname">닉네임</label></td>
									<td><input type="text" id="nickname" name="memNickName" class="id">
										<input type="button" value="중복확인" class="checkBtn" id="searchNN">
										<span class="error-message" id="nicknameError"></span>
									</td>
								</tr>
								<tr>
									<th>회원 정보</th>
								</tr>
								<tr>
									<td><label for="name">성명</label></td>
									<td><input type="text" id="name" name="memName" class="id">
										<span class="error-message" id="nameError"></span>
									</td>
								</tr>
								<tr>
									<td><label>성별</label></td>
									<td><input type="radio" id="gender1" value="male" name="memGen">남
										<input type="radio" id="gender2" value="female" name="memGen">여
										<input type="radio" id="gender3" value="not" name="memGen">해당 없음
										<span class="error-message" id="genderError"></span>
									</td>
								</tr>
								<tr>
									<td><label for="birth">생일</label></td>
									<td><input type="date" id="birth" name="memBirth" class="id">
                        		 		<span class="error-message" id="birthError"></span>
                        		 	</td>
                        		 </tr>
								<tr>
									<td><label for="email">이메일</label></td>
									<td><input type = "email" id="email" name="memEmail" placeholder="이메일 주소 입력" class="email" required>
										<input type="button" value="인증"onClick="sendEmail()" class="checkBtn">
										<span class="error-message" id="emailError"></span>
									</td>
								</tr>
								<tr>
									<td>주소</td>
									<td><input type="text" id="adress1" name="memZipcode" placeholder="우편 번호" size="5" class="id" readonly>
										<input type="button" id="searchAddressBtn" name="searchAddressBtn" value="우편번호 찾기" class="addressBtn">
									</td>
								</tr>
								<tr>
									<td></td>
									<td><input type="text" id="adress2" name="memAddress1" class="adress" readonly>
										<span class="error-message" id="adressError"></span>
									</td>
								</tr>
								<tr>
									<td></td>
									<td><input type="text" id="adress3" placeholder="상세주소 입력" name="memAddress2" class="adress">
										<span class="error-message" id="adressError"></span>
									</td>
								</tr>
								<tr>
									<td><label for="hp1">연락처</label></td>
									<td><input type="tel" id="phone" name="memHP" class="email" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="전화번호는 숫자만 입력해주세요" required>
						  			<span class="error-message" id="hpError"></span>
						  			</td>
						  		</tr>
							</table>
						</form>
					</div>
				</div>
				<div class="joinBottom">
					<div class="bottomContext">
						<b>이용약관</b>
						<!-- 이용 약관 -->
					</div>
				</div>
			</div>
			<div class="joinSubmit">
				<div id="submitBtn" class="joinBtn" >완료</button>
			</div>
		</section>
		<!-- bottom -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<!-- head -->
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/member/join.css">
		<%-- <script src="<%= request.getContextPath() %>/js/join.js"></script>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/searchAddress.js'/> "></script> --%>
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
						<form id="joinForm" class="wrapJoin" method="post" action="#">
							<table>
								<tr>
									<td><label for="id">ID</label></td>
									<td><input type="text" id="id" name="id" class="id">
										<input type="button" value="중복확인" class="checkBtn" onClick="checkId()">
										<span class="error-message" id="idError"></span>
									</td>
								</tr>
								<tr>
									<td><label for="pw">비밀번호</label></td>
									<td><input type="password" id="pw" name="pw" class="text">
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
									<td><input type="text" id="nickname" name="nickname" class="id">
										<input type="button" value="중복확인" class="checkBtn" onClick="checkName()">
										<span class="error-message" id="nicknameError"></span>
									</td>
								</tr>
								<tr>
									<th>회원 정보</th>
								</tr>
								<tr>
									<td><label for="name">성명</label></td>
									<td><input type="text" id="name" name="name" class="id">
										<span class="error-message" id="nameError"></span>
									</td>
								</tr>
								<tr>
									<td><label>성별</label></td>
									<td><input type="radio" id="gender1" value="male" name="gender">남
										<input type="radio" id="gender2" value="female" name="gender">여
										<input type="radio" id="gender3" value="not" name="gender">해당 없음
										<span class="error-message" id="genderError"></span>
									</td>
								</tr>
								<tr>
									<td><label for="birth">생일</label></td>
									<td><input type="date" id="birth" name="birth" class="id">
                        		 		<span class="error-message" id="birthError"></span>
                        		 	</td>
                        		 </tr>
								<tr>
									<td><label for="email">이메일</label></td>
									<td><input type = "email" id="email" name="email" placeholder="이메일 주소 입력" class="text" required>
										<input type="button" value="인증"   onClick="sendEmail()" class="checkBtn">
										<span class="error-message" id="emailError"></span>
									</td>
								</tr>
								<tr>
									<td>주소</td>
									<td><input type="text" id="adress1" name="adress1" placeholder="우편 번호" size="5" class="id" readonly>
										<input type="button" id="searchAddressBtn" name="searchAddressBtn" value="우편번호 찾기" class="addressBtn">
									</td>
								</tr>
								<tr>
									<td></td>
									<td><input type="text" id="adress2" name="adress2" class="text" readonly>
										<span class="error-message" id="adressError"></span>
									</td>
								</tr>
								<tr>
									<td></td>
									<td><input type="text" id="adress3" placeholder="상세주소 입력" name="adress3" class="text">
										<span class="error-message" id="adressError"></span>
									</td>
								</tr>
								<tr>
									<td><label for="hp1">연락처</label></td>
									<td><input type="text" id="hp1" size="3" name="hp1" class="hp" required>
								 	  - <input type="text" id="hp2" size="4" name="hp2" class="hp" required>
									  - <input type="text" id="hp3" size="4" name="hp3" class="hp" required>
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
				<button class="joinBtn" type="submit">완료</button>
			</div>
		</section>
		<!-- bottom -->
	</body>
</html>
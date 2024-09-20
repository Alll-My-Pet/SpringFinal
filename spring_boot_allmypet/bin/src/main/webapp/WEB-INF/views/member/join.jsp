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
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/member/join.css'/>">
		<script src="<c:url value='/js/member/joinPage.js'/>"></script>
		<script src="<c:url value='/js/member/sendMail.js'/>"></script>
		<script src="<c:url value='/js/member/checkNum.js'/>"></script>
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
			<form id="joinForm" class="joinForm" method="post" action="<c:url value='/member/insertmem'/>">
				<div class="joinBox">
					<div class="joinUpper">
						<div class="upperContext">
							<table>
								<tr>
									<td><label for="memId">아이디</label></td>
									<td><input type="text" id="memId" name="memId" class="id">
										<input type="button" value="중복확인" class="checkBtn" id="searchId">
										<span class="error-message" id="idError"></span>
									</td>
								</tr>
								<tr>
									<td><label for="memPwd">비밀번호</label></td>
									<td><input type="password" id="memPwd" name="memPwd" class="text">
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
									<td><label for="memNickName">닉네임</label></td>
									<td><input type="text" id="memNickName" name="memNickName" class="id">
										<input type="button" value="중복확인" class="checkBtn" id="searchNN">
										<span class="error-message" id="nicknameError"></span>
									</td>
								</tr>
								<tr>
									<th>회원 정보</th>
								</tr>
								<tr>
									<td><label for="memName">성명</label></td>
									<td><input type="text" id="memName" name="memName" class="id">
										<span class="error-message" id="nameError"></span>
									</td>
								</tr>
								<tr>
									<td><label>성별</label></td>
									<td><label class="radio"><input type="radio" id="gender1" value="male" name="memGen"> 남</label>
										<label class="radio"><input type="radio" id="gender2" value="female" name="memGen"> 여</label>
										<label class="radio"><input type="radio" id="gender3" value="none" name="memGen"> 해당 없음</label>
										<span class="error-message" id="genderError"></span>
									</td>
								</tr>
								<tr>
									<td><label for="memBirth">생일</label></td>
									<td><input type="date" id="memBirth" name="memBirth" class="id">
                        		 		<span class="error-message" id="birthError"></span>
                        		 	</td>
                        		 </tr>
								<tr>
									<td><label for="memEmail">이메일</label></td>
									<td><input type="email" id="memEmail" name="memEmail" placeholder="이메일 주소 입력" class="email" required>
										<input id="mailCheck" type="button" name="mailCheck" value="발송" onClick="sendNum()" class="checkBtn">
										<span class="error-message" id="emailError"></span>
									</td>
								</tr>
								<tr>
									<td><label for="chnum">인증번호</label></td>
									<td><input type="text" id="chnum" name="chnum" class="id" required>
										<input id="numCheck" type="button" name="numCheck" value="인증" onClick="checkNum()" class="checkBtn">
										<input type="text" id="confirm" name="confirm" style="display: none" value="">
										<span class="error-message" id="chnumError"></span>
									</td>
								</tr>
								<tr>
									<td>주소</td>
									<td><input type="text" id="memZipcode" name="memZipcode" placeholder="우편 번호" size="5" class="id" readonly>
										<input type="button" id="searchAddressBtn" name="searchAddressBtn" value="우편번호 찾기" class="addressBtn">
									</td>
								</tr>
								<tr>
									<td></td>
									<td><input type="text" id="memAddress1" name="memAddress1" class="adress" readonly>
										<span class="error-message" id="adressError"></span>
									</td>
								</tr>
								<tr>
									<td></td>
									<td><input type="text" id="memAddress2" placeholder="상세주소 입력" name="memAddress2" class="email" required>
										<span class="error-message" id="adressError"></span>
									</td>
								</tr>
								<tr>
									<td><label for="memHP">연락처</label></td>
									<td><input type="text" id="memHP" name="memHP" class="email" size="11" placeholder="전화번호는 숫자만 입력해주세요" required>
										<span class="error-message" id="hpError"></span>
						  			</td>
						  		</tr>
						  	</table>
						  	<div class="position">
						  		<b>회원 종류</b>
						  		<div class="label-container">
							  		<label><input type="checkbox" id="position" name="position" class="position" onclick="restrictPositionSelection(this)" value="0">일반 회원</label>
							  		<label><input type="checkbox" id="position" name="position" class="position" onclick="restrictPositionSelection(this)" value="1">브리더</label>
						  		</div>
						  	</div>
						  	<div class="filtering">
								<b>보고 싶지 않아요</b>
								<p>반드시 선택하지 않으셔도 됩니다.</p>
								<div class="label-container">
									<label><input type="checkbox" id="filtering" name="filtering" class="filtering" onclick="restrictFilteringSelection()" value="1">강아지</label>
									<label><input type="checkbox" id="filtering" name="filtering" class="filtering" onclick="restrictFilteringSelection()" value="2">고양이</label>
									<label><input type="checkbox" id="filtering" name="filtering" class="filtering" onclick="restrictFilteringSelection()" value="3">기타 포유류</label>
									<label><input type="checkbox" id="filtering" name="filtering" class="filtering" onclick="restrictFilteringSelection()" value="4">파충류/양서류</label>
									<label><input type="checkbox" id="filtering" name="filtering" class="filtering" onclick="restrictFilteringSelection()" value="5">어류</label>
									<label><input type="checkbox" id="filtering" name="filtering" class="filtering" onclick="restrictFilteringSelection()" value="6">조류</label>
									<label><input type="checkbox" id="filtering" name="filtering" class="filtering" onclick="restrictFilteringSelection()" value="7">설치류</label>
									<label><input type="checkbox" id="filtering" name="filtering" class="filtering" onclick="restrictFilteringSelection()" value="8">절지류/곤충류</label>
								</div>
							</div>
						</div>
					</div>
					<div class="joinBottom">
						<div class="bottomContext">
							<b>이용약관</b>
							<%-- <div class="useterms">
								<c:out value="${termsContent}"></c:out>
							</div> --%>
						</div>
					</div>
				</div>
				<div class="joinSubmit">
					<input type="submit" id="joinBtn" class="joinBtn" value="완료">
				</div>
			</form>
		</section>
		<!-- bottom -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>
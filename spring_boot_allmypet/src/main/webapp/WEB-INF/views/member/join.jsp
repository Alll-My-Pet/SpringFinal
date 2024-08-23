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
				<form id="joinForm" class="joinForm" method="post" action="<c:url value='/member/insertmem'/>">
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
									<td><input type="radio" id="gender1" value="male" name="memGen"> 남
										<input type="radio" id="gender2" value="female" name="memGen"> 여
										<input type="radio" id="gender3" value="not" name="memGen"> 해당 없음
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
									<td><input type = "email" id="memEmail" name="memEmail" placeholder="이메일 주소 입력" class="email" required>
										<input type="button" value="인증" onClick="sendEmail()" class="checkBtn">
										<span class="error-message" id="emailError"></span>
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
									<td><input type="text" id="phone" name="memHP" class="email" size="11" placeholder="전화번호는 숫자만 입력해주세요" required>
										<span class="error-message" id="hpError"></span>
						  			</td>
						  		</tr>
						  		<!-- <tr>
									<th>보고 싶지 않아요</th>
								</tr>
						  		<tr>
									<td>첫번째</td>
									<td><select id="filtering1" name="filtering" class="filtering">
										<option value="">선택</option>
			                            <option value="강아지">강아지</option>
			                            <option value="고양이">고양이</option>
			                            <option value="기타포유류">기타포유류</option>
			                            <option value="파충류/양서류">파충류/양서류</option>
			                            <option value="어류">어류</option>
			                            <option value="조류">조류</option>
			                            <option value="설치류">설치류</option>
			                            <option value="절지류/곤충류">절지류/곤충류</option>
                        				</select></td>
						  		</tr>
						  		<tr>
						  			<td>두번째</td>
									<td><select id="filtering2" name="filtering" class="filtering">
										<option value="">선택</option>
			                            <option value="강아지">강아지</option>
			                            <option value="고양이">고양이</option>
			                            <option value="기타포유류">기타포유류</option>
			                            <option value="파충류/양서류">파충류/양서류</option>
			                            <option value="어류">어류</option>
			                            <option value="조류">조류</option>
			                            <option value="설치류">설치류</option>
			                            <option value="절지류/곤충류">절지류/곤충류</option>
                        				</select></td>
						  		</tr>
						  		<tr>
						  			<td>세번째</td>
									<td><select id="filtering3" name="filtering" class="filtering">
										<option value="">선택</option>
			                            <option value="강아지">강아지</option>
			                            <option value="고양이">고양이</option>
			                            <option value="기타포유류">기타포유류</option>
			                            <option value="파충류/양서류">파충류/양서류</option>
			                            <option value="어류">어류</option>
			                            <option value="조류">조류</option>
			                            <option value="설치류">설치류</option>
			                            <option value="절지류/곤충류">절지류/곤충류</option>
                        				</select></td>
						  		</tr>
						  		<tr>
						  			<td>네번째</td>
									<td><select id="filtering4" name="filtering" class="filtering">
										<option value="">선택</option>
			                            <option value="강아지">강아지</option>
			                            <option value="고양이">고양이</option>
			                            <option value="기타포유류">기타포유류</option>
			                            <option value="파충류/양서류">파충류/양서류</option>
			                            <option value="어류">어류</option>
			                            <option value="조류">조류</option>
			                            <option value="설치류">설치류</option>
			                            <option value="절지류/곤충류">절지류/곤충류</option>
                        				</select></td>
						  		</tr>
						  		<tr>
						  			<td>다섯번째</td>
									<td><select id="filtering4" name="filtering" class="filtering">
										<option value="">선택</option>
			                            <option value="강아지">강아지</option>
			                            <option value="고양이">고양이</option>
			                            <option value="기타포유류">기타포유류</option>
			                            <option value="파충류/양서류">파충류/양서류</option>
			                            <option value="어류">어류</option>
			                            <option value="조류">조류</option>
			                            <option value="설치류">설치류</option>
			                            <option value="절지류/곤충류">절지류/곤충류</option>
                        				</select></td>
						  		</tr> -->
							</table>
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
					<div class="joinSubmit">
						<input type="submit" id="submitBtn" class="joinBtn" value="완료">
					</div>
				</form>
			</div>
		</section>
		<!-- bottom -->
		<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>
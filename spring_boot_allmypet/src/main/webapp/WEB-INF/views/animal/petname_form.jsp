<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>all my pet | 작명소</title>
<link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/animal/petname.css'/>">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/animal/petname.js'/>"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</head>
<body>
	<div class="desktop-1">
		<div class="frame-1">
			<div class="frame-2">
				<!-- header -->
				<div id="header">
					<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
				</div>
				<div class="contents">
					<br><br>
					<div class="pageInfo">
						<div class="bracket">
							<img src="/image/index/bracket-light-left.svg" class="bLeft" alt="..." style="height: 128px;">
						</div>
						<div class="page-title">
							<div class="titleInfo">반려동물 이름짓기 어려울땐?</div>
							<span class="ctgTitle"> 반려동물 작명소 </span>
						</div>
						<div class="bracket">
							<img src="/image/index/bracket-light-right.svg" class="bRight" alt="..." style="height: 128px;">
						</div>
					</div>
					<!-- pageInfo끝 -->
					<div class="petname-container">
						<div class="petname-genbox">
							<div class="formBtn" id="formBtn">
							<!-- form-container + generateBtn -->
								<div class="form-container" id="formContainer">
									<table>
                                        <tr>
                                            <td><label for="petType">🌟 종류:</label></td>
                                            <td>
                                                <input type="text" id="petType" placeholder="예: 개, 도마뱀, 미어캣..."><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><label for="petColor">🌟 색깔:</label></td>
                                            <td>
                                                <input type="text" id="petColor" placeholder="예: 초록색, 적갈색, 모래색..."><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><label for="petGender">🌟 성별:</label></td>
                                            <td>
                                                <button class="gender-button male" value="수컷">
                                                    <img src="/image/petname/male.png" width="20px" alt="수컷">
                                                </button>
                                                <button class="gender-button female" value="암컷">
                                                    <img src="image/petname/female.png" width="20px" alt="암컷">
                                                </button>
                                                <button class="gender-button unknown" value="무성/모름">
                                                    <img src="image/petname/question.png" width="20px" alt="무성/모름">
                                                </button>
                                            </td>
                                        </tr>
                                    </table>
                                    <div id="genderOutput">💫 선택된 성별:없음 💫</div>
								</div>
								<!-- form-container끝 -->
								<button class="generateBtn btn-hover">작명 시작!</button>
							</div>
							<!-- formBtn 끝(form-container + generateBtn) -->
							
							<div class="spinner-container" id="spinnerContainer" style="display:none;">
                                <div class="d-flex justify-content-center">
                                    <div class="spinner-border text-secondary" role="status">
                                        <span class="visually-hidden">Loading</span>
                                    </div>
                                </div>
                                <br>
                                <span>열심히 이름을 고르고 있어요!</span>
                            </div>
                            <!-- spinner-container 끝 -->
                            
                            <div class="resultContainer" id="resultContainer" style="display:none;">
                                <!-- 작명소 결과 확인 -->
                                <div class="nameOutput" id="nameOutput">
                                    <span>✨ 이름 후보 ✨</span>
                                    <div class="name-result">

                                    </div>
                                </div>
                                <div class="btn-area">
                                    <button class="resetBtn btn-hover">다시하기</button>
                                    <button class="generateNewBtn btn-hover">새로운 작명
                                        시작</button>
                                </div>
                            </div>
                            <!-- resultContainer끝 -->
						</div>
						<!-- petname-genbox 끝 -->
					</div>
					<!-- petname-container 끝 -->
				</div>
			</div>
			<!-- frame-2끝 -->
			<!-- 플로팅버튼(탑버튼 포함) -->
			<div id="floatingBtn">
				<c:import url="/WEB-INF/views/layout/floating_btn.jsp"></c:import>
			</div>
		</div>
		<!-- frame-1끝  -->
		<br> <br>
		<!-- footer부착 -->
		<div id="footer">
			<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
		</div>
	</div>
	<!-- desktop-1끝 -->
</body>
</html>
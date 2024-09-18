<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이모지 게시판</title>
<link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/emojiWrite.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/paging.css'/>">
<script src="<c:url value='/js/board/emojiWrite.js'/> "></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<div class="desktop-1">
		<!-- 중앙 전체 프레임 -->
		<div class="frame-1">
			<div class="frame-2">
				<!-- header 위치 부착 -->
				<div id="header">
					<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
				</div>
				<div class="contents">
					<br> <br>
	         		
	         		<section class="emojiWrite">
		        		<form method="post" >
		        			<div class="emoTitle">
			        			<label for="emoName">이모지 이름</label>
			        			<input type="text" class="emoName" id="emoName" name="emoName">
		        			</div>
		        			<div class="emoUpload">
			        			<label for="emoPic">이모지 업로드</label>
			        			<input type="file" class="emoPic" id="emoPic" name="emoPic" accept="image/*" onchange="previewImage(event)">
		        			</div>
		        			<div class="emoUploadPreview">
			        			<img class="emoImgPreview" id="emoImgPreview" name="emoImgPreview" src="">
		        			</div>
		        			<div class="emoAiCreation">
			        			<label for="emoAI">AI 이모지 생성</label>
			        			<input type="file" class="emoAI" id="emoAI" name="emoAI" accept="image/*" onchange="previewImage(event)">
		        			</div>
		        			<div class="emoAIPreview">
			        			<img class="emoAiPreview" id="emoAiPreview" name="emoAiPreview" src="">
		        			</div>
		        			<div class="emoContent">
			        			<label for="emoDescription">이모지 설명</label>
			        			<textarea placeholder="장작·뇌절·기만·도배 금지" class="emoDescription" id="emoDescription" name="emoDescription"></textarea>
		        			</div>
		        			<div>
		        				<input type="submit" value="업로드">
		        			</div>
		        		</form>
		        	</section>
				<!-- contents 끝 -->
			</div>
			<!-- frame-2 끝 -->
		</div>
		<!-- frame-1 끝 -->
		<br> <br>
		<!-- footer부착 -->
		<div id="floatingBtn">
			<c:import url="/WEB-INF/views/layout/floating_btn.jsp"></c:import>
		</div>
		<!-- sidebar 부착 -->
		<div id="sidebar">
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
		</div>
		<div id="footer">
		<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
		</div>
	</div>
	<!-- desktop-1 끝 -->
</body>
</html>
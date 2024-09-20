<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성 페이지</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/Board/mainBoardText.css' />" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/Board/mainBoardText.js'/>"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic&display=swap');
</style>
</head>
<body>
	<div class="All">
		<section class="writeTextArea">
			<!-- header -->
			<div id="header">
				<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
			</div>
			<h1 id="mainWriteFont">게시글 작성</h1>
			
			<form id="mainSubmitFrm" method="post" action="<c:url value='/insertBoard'/>">
				<div class="writeBox">
				<!-- select 필드 -->
					
					<select class="mainWriteFilter" name="boardCtgNo" id="boardCtgNo">
						<option value="0">게시판 종류</option>
						<option value="1">자유 게시판</option>
						<option value="2">분양홍보 게시판</option>
						<option value="3">반려동물 보호게시판</option>
						<option value="4">소모임 게시판</option>
						<option value="5">양육팁 게시판</option>
						<option value="6">갤러리 게시판</option>
						<option value="7">이모지 제작게시판</option>
						<option value="8">중고거래 게시판</option>
					</select>
					
					<select class="postTypeFilter" name="postTypeNo" id="postTypeNo">
						<option value="0">[머리글]</option>
						<option value="1">[자유]</option>
						<option value="2">[분양홍보 게시판]</option>
						<option value="3">[반려동물 보호게시판]</option>
						<option value="4">[소모임 게시판]</option>
						<option value="5">[양육팁 게시판]</option>
						<option value="6">[갤러리 게시판]</option>
						<option value="7">[이모지 제작게시판]</option>
						<option value="8">[중고거래 게시판]</option>
					</select>
					
					<!-- 작성자 필드 -->
					<div class="author">
						작성자:<input type="text" name="memid" value="${userId }" readonly style="width:100px;">
					</div>
					
					<!-- 이미지 업로드 -->
					<div class="mainPhotoBox">
						<label for="fileUpload">
						<img src="<c:url value='/project_images/free-icon-photo-2984403.png'/>" />
						</label>
						
						<div class="fileUpload">
						<input type="file" class="fileUpload" id="fileUpload" name="postImg" multiple>
						</div>
					</div>
					
				<!-- 제목 입력 필드 -->
				<div class="mainDetailTitleBox">
					<input type="text" class="MainDetailTitle" id="postTitle"name="postTitle" placeholder="글 제목">
				</div>


				<!-- 내용 입력 필드 -->
				<div class="mainDetailBodyBox">
					<textarea class="mainDetailBody" id="postContent" name="postContent"placeholder="글 내용"></textarea>
				</div>
				
				<!-- 작성 버튼 -->
				<button type="submit" class="FreeBoardBtn">작성하기</button>
				
				</div>
				
			</form> <!-- frm끝 -->
	</section>
	</div>


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
	<!-- FreeDetail 끝 -->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성 페이지</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/Board/mainBoardText.css' />" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/Board/mainBoardText.js'/>"></script>
<%-- <script src="<c:url value='/js/Board/mainBoardWrite.js'/>"></script> --%>
</head>
<body>
	<div class="All">
		<section class="writeTextArea">
			<!-- header -->
			<div id="header">
				<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
			</div>
			<h1 id="mainWriteFont">게시글 작성</h1>
			
			<form id="mainSubmitFrm" method="post" action="<c:url value='/board/insertBoard'/>">
				<div class="writeBox">
				<!-- select 필드 -->
					<select class="mainWriteFilter" name="boardCtgNo">
						<option value="1">[QnA]</option>
						<option value="2">[자유게시판]</option>
						<option value="3">[양육 팁]</option>
						<option value="4">[분양홍보]</option>
						<option value="5">[반려동물 보호]</option>
						<option value="6">[이모지]</option>
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
					<input type="text" class="MainDetailTitle" name="postTitle" placeholder="글 제목">
				</div>


				<!-- 내용 입력 필드 -->
				<div class="mainDetailBodyBox">
					<textarea class="mainDetailBody" name="postContent"placeholder="글 내용"></textarea>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 작성페이지</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/FreeBoardWrite.css'/>" />
</head>
<body>
	<div class="All">

		<div class="FreeDetailFont">
			<h1>자유게시판 작성</h1>
		</div>

		<div class="FreeDetail">
			<section class="FreeDetailHeader">

				
				<form action="/upload" method="post" enctype="multipart/form-data">
					<div class="FreePhotoBox">
					 <label for="fileUpload"><img src="<c:url value='/pet_images/free-icon-photo-2984403.png'/>" /></label>
					  <input type="file" id="fileUpload" name="fileUpload" multiple>
						<button type="submit" class="FPhotoBtn">자료 첨부</button>
					</div>
				</form>
					
                    <form class="FreeBoardForm">
					<div class="FreeDetailTitleBox">
						<input type="text" class="FreeDetailTitle" placeholder="글 제목">
					</div>
					
					
					<div class="FreeDetailBodyBox">
						<textarea class="FreeDetailBody" placeholder="글 내용"></textarea>
					</div>

				</form>
			</section>
		</div> <!-- FreeDetail 끝 -->
		
			<form class="">
			  <button class="FreeBoardBtn">작성하기</button>
			</form>
			
	</div> <!-- All 끝 -->
</body>
</html>
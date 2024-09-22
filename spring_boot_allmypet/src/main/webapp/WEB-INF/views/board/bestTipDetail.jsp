<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/board/TipDetail.css' />" />
</head>
<body>
	<div class="All">
		<section class="TipText">
		<div class="TipPostBox">

			<div class="title">
				<label for="title">제목</label> 
				<span id="bodTitle">${board.bodTitle}</span>
			</div>
			
			<div class="author">
				<label for="author">작성자</label> 
				<span id="bodMemId">${board.memId}</span>
			</div>
			
			<div class="like">
				<label for="like">추천수</label> 
				<span id="bodlike">${board.memId}</span>
			</div>
			
			
			
			<div class="content">
				<label for="content">내용</label>
				<pre id="bodText">${board.bodText}</pre>
			</div>
			
			<div class="comments">
				<label for="Comments">댓글</label> 
				<span id="bodComments">${board.memId}</span>
			</div>
			
		</div>

		</section>

	</div>
</body>
</html>
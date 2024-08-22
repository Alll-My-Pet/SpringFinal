<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세</title>
</head>
<body>
	<div class="All">
		<section class="freeText">

			<div class="form-group">
				<label for="title">제목</label> 
				<span id="bodTitle">${board.bodTitle}</span>
			</div>
			<div class="form-group">
				<label for="author">작성자</label> 
				<span id="bodMemId">${board.memId}</span>
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<pre id="bodText">${board.bodText}</pre>
			</div>
			<div class="buttons">
				<a href="<c:url value='/customer/updateBoardForm/${board.bodNo }'/>"
					class="btn">수정</a> <a
					href="<c:url value='/customer/deleteBoard/${board.bodNo}'/>"
					class="btn" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
			</div>


		</section>

	</div>
</body>
</html>
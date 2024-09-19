<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/Board/MainDetail.css' />" />
</head>
<body>
	<div class="All">
		<section class="MainText">
		<!-- header -->
			<div id="header">
				<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
			</div>
		<div class="PostBox">

			<div class="detailTitle">
				<span id="bodTitle">${board.postTitle}</span>
			</div>
			
			<div class="author">
				<span id="bodMemId"><img src="<c:url value='${board.postImg}'/>"></span>
			</div>
			
			<div class="like">
				<label for="like">추천수:</label> 
				<span id="bodlike">${board.postLike}</span>
			</div>
			
			<div class="ctg">
				<label for="ctg">분류:</label> 
				<span id="bodctg">${board.boardCtgNo}</span>
			</div>
			
			
			
			<div class="content">
				<pre id="bodText">${board.postContent}</pre>
			</div>
			
			<div class="comments">
				<span id="bodComments">${board.memId}</span>
			</div>
			
		</div>

		</section>
		
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
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물 보호 게시판</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/PetProtectBoard.css'/>" />
</head>
<body>
	<div class="All">
		<section class="protect">

			<div class="MainFont">
				<h1 id="PPBoardFont">반려동물 보호 게시판</h1>
				<button class="reportBtn">신고하기</button>
			</div>

			<div class="abandoned">
				<p id="reportFont">유기동물 신고</p>
				<div class="abandonedPic">
					<div class="abandonedFont"></div>
				    <div class="description">설명</div>
				</div>
				<div class="abandonedPic">
					<div class="abandonedFont"></div>
					<div class="description">설명</div>
				</div>
				<div class="abandonedPic">
					<div class="abandonedFont"></div>
					<div class="description">설명</div>
				</div>
				<div class="abandonedPic">
					<div class="abandonedFont"></div>
					<div class="description">설명</div>
				</div>


			</div>
			<!-- abandoned 끝 -->

			<button class="ProtectBtn">게시글 작성</button>

			<div class="ProtectBrd">

				<form class="boardListForm">
					<select class="searchOption">
						<option value="AllList">전체 게시글</option>
						<option value="option1">옵션1</option>
						<option value="option2">옵션2</option>
					</select> 
					
					<input type="text" class="searchBar" placeholder="게시판 내 검색">
					
					<button class="ProtectSearchBtn">
						<img src="<c:url value='/pet_images/free-icon-search-interface-symbol-54481.png'/>" />
					</button>
				</form>
                
                
				<table class="PttTable">
					<tbody>

						<tr>
							<td>1</td>
							<td><a href="#">[공지사항] 개인정보 처리방침 변경안내처리방침</a></td>
							<td>작성자1</td>
							<td>2017.07.13</td>
							<td>31</td>
							<td>6</td>
						</tr>
						<tr>
							<td>1</td>
							<td><a href="#">[공지사항] 개인정보 처리방침 변경안내처리방침</a></td>
							<td>작성자1</td>
							<td>2017.07.13</td>
							<td>31</td>
							<td>6</td>
						</tr>
				</table>
				


			</div> <!-- ProtectBrd끝 -->

         
		</section>
		<nav class="boardCtg">
		  <div class="PetCtgBrd">
		  <p>카테고리별</p>
		  <p>▶전체게시판</p>
		  <p>▶양육 팁 게시판</p>
		  <p>▶반려동물 갤러리</p>
		  <br>
		  <p>전체 커뮤니티</p>
		  <p>▶자유게시판</p>
		  <p>▶분양홍보 게시판</p>
		  <p>▶반려동물 보호 게시판</p>
		  <p>▶이모지 게시판</p>
		  <br>
		  <p>반려동물 이름짓기가 어렵다면?</p>
		  <a href="#">작명소</a>
		  </div>
		  </nav>
	</div>
	<!-- All끝 -->
</body>
</html>
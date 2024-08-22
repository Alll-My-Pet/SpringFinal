<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 게시판</title>
<link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/NoticeBoard.css'/>" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
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
					<div class="pageInfo">
						<div class="page-title">
							<div class="titleInfo"> 커뮤니티 이용 전에 확인해주세요!</div>
							<span class="ctgTitle"> 공지 / 이벤트</span>
						</div>
					</div>
					<!-- pageInfo 끝 -->
				</div>
				<!-- contents 끝 -->
			</div>
			<!-- frame-2 끝 -->
		</div>
		<!-- frame-1끝 -->
	</div>
	<!-- desktop-1 끝 -->
	
	<section class="noticeBoard">
		<h1 id="noticeFont">공지 게시판</h1>

		<div class="NBoardBox">
			<table class="noticeBoardTB">
				<tbody>

					<tr>
						<td><a href="#">[공지사항] 개인정보 처리방침 변경안내처리방침</a></td>
						<td>작성자1</td>
						<td>2017.07.13</td>
					</tr>

					<tr>
						<td><a href="#">아무거나아무거나1</a></td>
						<td>작성자2</td>
						<td>2017.07.14</td>
					</tr>

					<tr>
						<td><a href="#">아무거나아무거나2</a></td>
						<td>작성자3</td>
						<td>2017.07.15</td>
					</tr>

					<tr>
						<td><a href="#">아무거나아무거나3</a></td>
						<td>작성자4</td>
						<td>2017.07.16</td>
					</tr>
				</tbody>
			</table>
		</div>
	</section>
	<!-- noticeBoard 끝 -->
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
	<!-- boardCtg 끝 -->
</body>
</html>
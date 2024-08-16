<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 게시판</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/Board/MainBoard.css'/>" />
<script src="/js/Board/paging.js"></script>
</head>
<body>
	<div class="All">
		<section class="MainBoard">
			<h1 id="MainFont">전체 게시판</h1>


			<form id="BoardSearchBar">
				<select id="BFilter" name="type">
					<option value="BWriter">작성자</option>
					<option value="BTitle">글 제목</option>
					<option value="BPlus">제목 + 내용</option>
				</select> <input type="text" id="SearchBox" name="SearchBox"
					placeholder="게시판 내 검색" />

				<button class="BoardSearchBtn">
					<img
						src="<c:url value='/pet_images/free-icon-search-interface-symbol-54481.png'/>" />
				</button>

			</form>
			<!-- form 끝 -->


			<div class="hotBoard">
				<h3 style="margin-left: 2%;">실시간 인기글</h3>
				<div class="hot1">
					<p style="text-indent: 30px;">제목1</p>
					<p style="text-indent: 500px;">닉네임</p>
					<p style="text-indent: 50px;">2021-10-12</p>
				</div>
				<div class="hot2">
					<p style="text-indent: 30px;">제목1</p>
					<p style="text-indent: 500px;">닉네임</p>
					<p style="text-indent: 50px;">2021-10-12</p>
				</div>
			</div>

			<table class="boardTB">

				<thead>
					<tr>
						<th>구분
							<button class="TbDropdownBtn" onclick="toggleDropdown(this)">▼</button>
						</th>
						<th scope="col" class="th-title">글 제목</th>
						<th scope="col" class="th-writer">작성자</th>
						<th scope="col" class="th-date">날짜</th>
						<th scope="col" class="th-view">조회</th>
						<th scope="col" class="th-good">추천</th>
					</tr>
				</thead>

				<tbody>
					    <c:forEach var="board" items="${boardList }">
							<%-- <tr onclick="location.href='<c:url value='/customer/detailViewBoard/${board.bodNo}'/>'" id="boardRow"> --%>
								<td>${board.bodNo}</td>
								<td>${board.bodTitle}</td>
								<td>${board.memId}</td>
								<td><fmt:formatDate value="${board.bodDate }" pattern="YYYY-MM-dd" /></td>
							</tr>
						</c:forEach> 
					

					<tr>
						<td>2</td>
						<td><a href="#">아무거나아무거나1</a></td>
						<td>작성자2</td>
						<td>2017.07.14</td>
						<td>32</td>
						<td>7</td>
					</tr>

					<tr>
						<td>3</td>
						<td><a href="#">아무거나아무거나2</a></td>
						<td>작성자3</td>
						<td>2017.07.15</td>
						<td>33</td>
						<td>8</td>
					</tr>

					<tr>
						<td>4</td>
						<td><a href="#">아무거나아무거나3</a></td>
						<td>작성자4</td>
						<td>2017.07.16</td>
						<td>34</td>
						<td>9</td>
					</tr>
				</tbody>
			</table>

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
	<!-- all끝 -->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양육 게시판</title>
<link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/animal/tipBoard.css'/>" />
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
					<br> <br>
					<div class="pageInfo">
						<div class="bracket">
							<img src="/image/index/bracket-light-left.svg" class="bLeft"
								alt="..." style="height: 128px;">
						</div>
						<div class="page-title">
							<div class="titleInfo">&nbsp;동물별 커뮤니티</div>
							<span class="ctgTitle"> ${petCtgName} 양육 팁💡</span>
						</div>
						<div class="bracket">
							<img src="/image/index/bracket-light-right.svg" class="bRight"
								alt="..." style="height: 128px;">
						</div>
					</div>
					<!-- pageInfo 끝 -->
					<div class="board-contents">
						<!-- 게시판 관련 컨텐츠 시작 -->
						<div class="searchBar">
							<form action="${pageContext.request.contextPath}/search"
								method="get">
								<input type="text" name="keyword" placeholder="게시글 검색" required />
								<button class="searchBtn" type="submit">
									<img src="/image/search.png" alt="검색" />
								</button>
							</form>
						</div>
						<!-- searchBar 끝 -->
						<div class="bestTip-box">
							<span>베스트 양육 팁🌟</span>
							<table class="bestTip-table">
								<tr>
									<td><a href="#">[공지사항] 개인정보 처리방침 변경안내처리방침</a></td>
									<td>작성자1</td>
									<td>2017.07.13</td>
									<td>300</td>
									<td>100</td>
								</tr>
								<td colspan="5">
									<div class="separator"></div>
								</td>
								<tr>
									<td><a href="#">[공지사항] 개인정보 처리방침 변경안내처리방침</a></td>
									<td>작성자1</td>
									<td>2017.07.13</td>
									<td>300</td>
									<td>100</td>
								</tr>
								<td colspan="5">
									<div class="separator"></div>
								</td>
								<tr>
									<td><a href="#">[공지사항] 개인정보 처리방침 변경안내처리방침</a></td>
									<td>작성자1</td>
									<td>2017.07.13</td>
									<td>300</td>
									<td>100</td>
								</tr>
							</table>
						</div>
						<!-- bestTip-box끝 -->
						<div class="notice-box">
							<table class="notice-table">
								<thead>
									<tr>
										<th>글 제목</th>
										<th>작성자</th>
										<th>날짜</th>
										<th>조회</th>
										<th>추천</th>
									</tr>
								</thead>
								<tbody>
									<!-- tbody와 thead간의 공백 -->
									<tr>
										<td colspan="5"
											style="height: 3px; background-color: transparent;"></td>
									</tr>
									<c:forEach var="mytip" items="${myTipList }">
										<tr>
											<td><a href="#">${mytip.postTitle}</a></td>
											<td>${mytip.memId}</td>
											<td>
												<fmt:formatDate value="${mytip.postDate}"
														pattern="M/dd HH:mm" />
											</td>
											<td>${mytip.postView}</td>
											<td>${mytip.postLike}</td>
										</tr>
										<td colspan="5">
											<div class="separator"></div>
										</td>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- board-contents끝 -->
				</div>
				<!-- contents 끝 -->
			</div>
			<!-- frame-2 끝 -->
			<!-- 플로팅버튼(탑버튼 포함) -->
			<div id="floatingBtn">
				<c:import url="/WEB-INF/views/layout/floating_btn.jsp"></c:import>
			</div>
			<!-- sidebar 부착 -->
			<div id="sidebar">
				<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			</div>
		</div>
		<!-- frame-1끝 -->
		<br> <br>
		<!-- footer부착 -->
		<div id="footer">
			<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
		</div>
	</div>
	<!-- desktop-1 끝 -->
</body>
</html>
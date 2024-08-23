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
	href="<c:url value='/css/board/noticeBoard.css'/>" />
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
							<img src="/image/index/bracket-light-left.svg" class="bLeft" alt="..." style="height: 128px;">
						</div>
						<div class="page-title">
							<div class="titleInfo">&nbsp;공지/이벤트</div>
							<span class="ctgTitle">공지사항</span>
						</div>
						<div class="bracket">
							<img src="/image/index/bracket-light-right.svg" class="bRight" alt="..." style="height: 128px;">
						</div>
					</div>
					<!-- pageInfo 끝 -->
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
								<td colspan="5">
									<div class="separator"></div>
								</td>
							</tbody>
						</table>
					</div>
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
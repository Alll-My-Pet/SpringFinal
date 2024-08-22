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
					<br>
					<br>
					<div class="pageInfo">
						<div class="page-title">
							<div class="titleInfo">&nbsp;공지/이벤트</div>
							<span class="ctgTitle">공지사항</span>
						</div>
					</div>
					<!-- pageInfo 끝 -->
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
				</div>
				<!-- contents 끝 -->
			</div>
			<!-- frame-2 끝 -->
		</div>
		<!-- frame-1끝 -->
	</div>
	<!-- desktop-1 끝 -->
</body>
</html>
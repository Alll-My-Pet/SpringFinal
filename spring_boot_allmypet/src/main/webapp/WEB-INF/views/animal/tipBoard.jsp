<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/paging.css'/>" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/Board/paging.js'/>"></script>
<script src="<c:url value='/js/animal/tipBoard.js'/>"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic&display=swap');
</style>
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
						<div class="bestTip-title">🌟베스트 양육 팁🌟</div>
						<div class="bestTip-box">
							<table class="bestTip-table">
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
									<c:forEach var="top3" items="${topLikedTips }">
										<tr>
											<td><a href="#">${top3.postTitle}</a></td>
											<td>${top3.memNickName}</td>
											<td><fmt:formatDate value="${top3.postDate}"
													pattern="M/dd HH:mm" /></td>
											<td>${top3.postView}</td>
											<td>${top3.postLike}</td>
										</tr>
										<c:if test="${!status.last}">
											<tr>
												<td colspan="5">
													<div class="separator"></div>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- bestTip-box끝 -->
						<div class="board-title">&nbsp;전체 게시글</div>
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
											<td>${mytip.memNickName}</td>
											<td><fmt:formatDate value="${mytip.postDate}"
													pattern="M/dd HH:mm" /></td>
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
						<!-- noticebox 끝 -->
						<div class="mainWriteBox">
							<!-- <button class="mainWriteBtn">글 작성</button> -->
							<!-- 로그인 한 경우  -->
							<c:if test="${not empty sessionScope.mid }">
								<button class="mainWriteBtn">
									<a href="<c:url value='/animal_home/${petCtgNo}/tipBoard_form'/>">글 작성</a>
								</button>
							</c:if>
							<%-- <button class="mainWriteBtn">
								<a href="<c:url value='/animal/bulletin_form'/>">글 작성</a>
							</button> --%>

							<!-- 로그인 하지 않은 경우-->
							<c:if test="${empty sessionScope.mid }">
								<button id="notLoginBtn" class="mainWriteBtn">글 작성</button>
							</c:if>
						</div>
						<br> <br> <br>
						<div class="bottom-box">
							<!-- 페이징 -->
							<div class="paging" style="text-align: center;">
								<a onclick="javascript:goPage(1)">&lt;&lt;</a> <a
									onclick="javascript:goPage('prev')">이전</a>

								<c:forEach var="i" begin="${pageVo.startPage }"
									end="${pageVo.endPage }">
									<%-- <a onclick="javascript:goPage('${i}')">${i }</a> --%>
									<a onclick="javascript:goPage('${i}')"
										class="${i == pageVo.pageNo ? 'current' : ''}">${i}</a>
								</c:forEach>

								<a onclick="javascript:goPage('next')">다음</a> <a
									onclick="javascript:goPage('${pageVo.totalPage }')">
									&gt;&gt;</a>
							</div>
							<form name="pageFrm">
								<input type="hidden" name="pageNo" value="${pageVo.pageNo }">
							</form>
							<br>
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
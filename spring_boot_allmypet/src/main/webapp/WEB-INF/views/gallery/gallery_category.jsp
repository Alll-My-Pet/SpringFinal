<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 별 갤러리</title>
<link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/gallery/gallery_category.css'/>" />
<style>
@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic&display=swap');
</style>
</head>
<body>
	<div class="desktop-1">
		<div class="frame-1">
			<div class="frame-2">
				<!-- header -->
				<div id="header">
					<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
				</div>
				<div class="contents">
					<div class="gallery-container">
						<c:set var="categoryName">
							<c:choose>
								<c:when test="${petCtgNo == 1}">강아지</c:when>
								<c:when test="${petCtgNo == 2}">고양이</c:when>
								<c:when test="${petCtgNo == 3}">기타 포유류</c:when>
								<c:when test="${petCtgNo == 4}">파충류/양서류</c:when>
								<c:when test="${petCtgNo == 5}">어류</c:when>
								<c:when test="${petCtgNo == 6}">조류</c:when>
								<c:when test="${petCtgNo == 7}">설치류</c:when>
								<c:when test="${petCtgNo == 8}">절지류/곤충</c:when>
								<c:otherwise>Unknown Category</c:otherwise>
							</c:choose>
						</c:set>

						<div id="category-${petCtgNo}" class="pageInfo">
							<div class="bracket">
								<img src="/image/index/bracket-light-left.svg" class="bLeft"
									alt="..." style="height: 128px;">
							</div>
							<div class="page-title">
								<div class="titleInfo">동물별 커뮤니티</div>
								<span class="ctgTitle"> ${categoryName} 갤러리 </span>
							</div>
							<div class="bracket">
								<img src="/image/index/bracket-light-right.svg" class="bRight"
									alt="..." style="height: 128px;">
							</div>
						</div>
						<!-- pageInfo끝 -->
						<!-- 검색 폼 -->
						<form action="/gallery/category/${petCtgNo}" method="get">
							<input type="text" name="keyword" placeholder="검색어를 입력하세요"
								value="${param.keyword}">
							<button type="submit">검색</button>
						</form>
						<br> <br>
						<div class="gallery">
							<!-- 게시물 출력 -->
							<c:forEach var="post" items="${categoryPosts}">
								<div class="gallery-item">
									<a href="/gallery/detail/${post.postNo}">
										<div class="image-container">
											<img class="gallery-image"
												src="<c:url value='/gallery_images/${post.postImg}'/>"
												alt="${post.postTitle}" />
											<div class="overlay">
												<div class="like-count">
													<span>&hearts; ${post.postLike}</span>
												</div>
												<div class="profile-icon">
													<img
														src="<c:url value='/member_images/${profileImages[post.postNo]}'/>" />
												</div>
											</div>
										</div>
										<div class="info">
											<p class="title">${post.postTitle}</p>
											<p class="comment-count">코멘트 수:
												${commentCounts[post.postNo]}</p>
										</div>
									</a>
								</div>
							</c:forEach>

							<!-- 게시물이 없는 경우 -->
							<c:if test="${empty categoryPosts}">
								<p>해당 카테고리에 게시물이 없습니다.</p>
							</c:if>
						</div>

						<!-- 페이지네이션 -->
						<div class="pagination">
							<c:forEach var="i" begin="1" end="${totalPages}">
								<a href="?page=${i}&keyword=${param.keyword}"
									class="${page == i ? 'active' : ''}">${i}</a>
							</c:forEach>
						</div>

						<div class="mainWriteBox">
							<!-- 로그인 한 경우  -->
							<c:if test="${not empty sessionScope.mid }">
								<button class="mainWriteBtn">
									<a href="<c:url value='/gallery/${petCtgNo}/gallery_form'/>">글
										작성</a>
								</button>
							</c:if>

							<!-- 로그인 하지 않은 경우-->
							<c:if test="${empty sessionScope.mid }">
								<button id="notLoginBtn" class="mainWriteBtn">
									<a>글 작성</a>
								</button>
							</c:if>
						</div>
					</div>
					<!-- gallery-container 끝 -->
				</div>
				<!-- contents끝 -->
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
		<!-- frame-1 끝 -->
		<br> <br>
		<!-- footer부착 -->
		<div id="footer">
			<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
		</div>
	</div>
	<!-- desktop-1 끝 -->
</body>
</html>

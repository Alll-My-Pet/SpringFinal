<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동물별 카테고리 메인</title>
<link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/animal/animal_index.css'/>">
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/animal/animal_index.js'/>"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
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
					<div class="card-container">
						<div class="row">
							<!-- 첫 번째 행 시작 -->
							<div class="col-md-3">
								<!-- 첫 번째 카드 -->
								<a href="<c:url value='/animal_home/${1}'/>" class="card-link">
									<div class="card">
										<div class="card-content">
											<img src="/image/animal_ctg/ctg_강아지.png" class="card-img"
												alt="..." style="width: 35px; height: 35px;">
											<h5 class="card-title">강아지</h5>
										</div>
									</div>
								</a>
							</div>
							<div class="col-md-3">
								<!-- 두 번째 카드 -->
								<a href="<c:url value='/animal_home/${2}'/>" class="card-link">
									<div class="card">
										<div class="card-content">
											<img src="/image/animal_ctg/ctg_고양이.png" class="card-img"
												alt="..." style="width: 25px; height: 25px;">
											<h5 class="card-title">고양이</h5>
										</div>
									</div>
								</a>
							</div>
							<div class="col-md-3">
								<!-- 세 번째 카드 -->
								<a href="<c:url value='/animal_home/${3}'/>" class="card-link">
									<div class="card">
										<div class="card-content">
											<img src="/image/animal_ctg/ctg_기타1.png" class="card-img"
												alt="..." style="width: 30px; height: 30px;">
											<h5 class="card-title">기타 포유류</h5>
										</div>
									</div>
								</a>
							</div>
							<div class="col-md-3">
								<!-- 네 번째 카드 -->
								<a href="<c:url value='/animal_home/${4}'/>" class="card-link">
									<div class="card">
										<div class="card-content">
											<img src="/image/animal_ctg/ctg_파충류.png" class="card-img"
												alt="..." style="width: 30px; height: 30px;">
											<h5 class="card-title">파충류/양서류</h5>
										</div>
									</div>
								</a>
							</div>
						</div>
						<!-- 첫 번째 행 끝 -->

						<div class="row">
							<!-- 두 번째 행 시작 -->
							<div class="col-md-3">
								<!-- 첫 번째 카드 -->
								<a href="<c:url value='/animal_home/${5}'/>" class="card-link">
									<div class="card">
										<div class="card-content">
											<img src="/image/animal_ctg/ctg_어류.png" class="card-img"
												alt="..." style="width: 30px; height: 30px;">
											<h5 class="card-title">어류</h5>
										</div>
									</div>
								</a>
							</div>
							<div class="col-md-3">
								<!-- 두 번째 카드 -->
								<a href="<c:url value='/animal_home/${6}'/>" class="card-link">
									<div class="card">
										<div class="card-content">
											<img src="/image/animal_ctg/ctg_조류.png" class="card-img"
												alt="..." style="width: 25px; height: 25px;">
											<h5 class="card-title">조류</h5>
										</div>
									</div>
								</a>
							</div>
							<div class="col-md-3">
								<!-- 세 번째 카드 -->
								<a href="<c:url value='/animal_home/${7}'/>" class="card-link">
									<div class="card">
										<div class="card-content">
											<img src="/image/animal_ctg/ctg_설치류.png" class="card-img"
												alt="..." style="width: 30px; height: 30px;">
											<h5 class="card-title">설치류</h5>
										</div>
									</div>
								</a>
							</div>
							<div class="col-md-3">
								<!-- 네 번째 카드 -->
								<a href="<c:url value='/animal_home/${8}'/>" class="card-link">
									<div class="card">
										<div class="card-content">
											<img src="/image/animal_ctg/ctg_절지류.png" class="card-img"
												alt="..." style="width: 30px; height: 30px;">
											<h5 class="card-title">절지류/곤충류</h5>
										</div>
									</div>
								</a>
							</div>
						</div>
						<!-- 두 번째 행 끝 -->
					</div>
					<!-- 동물별 카테고리 끝 -->
					<div class="pageInfo">
						<div class="bracket">
							<img src="/image/index/bracket-light-left.svg" class="bLeft" alt="..." style="height: 128px;">
						</div>
						<div class="page-title">
							<div class="titleInfo">동물별 커뮤니티</div>
							<span class="ctgTitle"> ${petCtgName} 커뮤니티 </span>
						</div>
						<div class="bracket">
							<img src="/image/index/bracket-light-right.svg" class="bRight" alt="..." style="height: 128px;">
						</div>
					</div>
					<!-- pageInfo끝 -->
					<div class="all-board">
						<div class="best-photos">
							<a href="/gallery/category/${petCtgNo }" class="board-title">
								<div>반려동물 갤러리 +</div>
							</a>
							<div class="best-slideshow">
								<!-- 베스트 사진 슬라이드쇼 -->
								<button class="chevron-left">
									<img class="icon" src="/image/index/chevron_left.svg" alt="왼"
										width="40px" height="45px" />
								</button>
								<div class="photo-container">
									<a href="갤러리_상세.html" class="photo"></a> <a href="갤러리_상세.html"
										class="photo"></a> <a href="갤러리_상세.html" class="photo"></a> <a
										href="갤러리_상세.html" class="photo"></a> <a href="갤러리_상세.html"
										class="photo"></a>
								</div>
								<button class="chevron-right">
									<img class="icon" src="/image/index/chevron_right.svg" alt="오"
										width="40px" height="45px" />
								</button>
							</div>
						</div>
						<!-- best-photos 끝 -->
						<div class="post-board">
							<div class="bulletin-board">
								<a href="<c:url value='/animal_home/${petCtgNo}/bulletin'/>" class="board-title">
									<div>전체 게시판 +</div>
								</a>
								<div class="post-list">
									<c:forEach var="bulletin" items="${bulletinList }">
										<a href="<c:url value='/bulletin/${petCtgNo}/detailViewBoard/${bulletin.postNo}'/>" class="post">
											<div class="post-title">${bulletin.postTitle}</div>
											<div class="post-author">${bulletin.memNickName}</div> 
											<div class="post-date">
												<fmt:formatDate value="${bulletin.postDate}"
													pattern="M/dd HH:mm" />
											</div>
										</a>
									</c:forEach>
								</div>
							</div>
							<div class="board-container">
								<div class="naming-board">
									<img class="board-img" src="/image/index/작명소.png" alt="작명소"
										style="width: 130px; height: 130px;" /> 
										<a href="<c:url value='/petname'/>" class="naming-link">작명소로 이동🔜</a>
								</div>
								<div class="mytip-board">
									<a href="<c:url value='/animal_home/${petCtgNo}/tip'/>" class="board-title">
										<div>양육 팁💡 게시판 +</div>
									</a>
									<div class="post-list">
										<c:forEach var="mytip" items="${myTipList }">
											<a href="게시판_상세.html" class="post">
												<div class="post-title">${mytip.postTitle}</div>
												<div class="post-author">${mytip.memNickName}</div>
												<div class="post-date">
													<fmt:formatDate value="${mytip.postDate}"
														pattern="M/dd HH:mm" />
												</div>
											</a>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<!-- post-board끝 -->
					</div>
					<!-- all-board끝 -->
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
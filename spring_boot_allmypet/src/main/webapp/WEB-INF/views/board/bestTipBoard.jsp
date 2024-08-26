<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양육팁 게시판</title>
<link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/bestTipBoard.css'/>" />
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
							<div class="titleInfo">&nbsp;반려동물을 키우는 집사들의 팁 모음집!</div>
							<span class="ctgTitle">베스트 양육 팁💡</span>
						</div>
						<div class="bracket">
							<img src="/image/index/bracket-light-right.svg" class="bRight"
								alt="..." style="height: 128px;">
						</div>
					</div>
					<!-- pageInfo 끝 -->
					<section class="bestTip">
						<div class="bestBox">
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
										<a href="<c:url value=''/>" class="card-link">
											<div class="card-post">
												<img src="/image/board/noimg_2.jpg" class="post-img" alt="게시글 사진" >
												<div class="post-body">
													<h5 class="post-title">게시글 제목(댓글수)</h5>
													<p class="post-text">추천수 | 작성자</p>
													<p class="post-text">
														<small class="text-muted">20XX.XX.XX</small>
													</p>
												</div>
											</div>
										</a>
									</div>
									<div class="col-md-3">
										<!-- 두 번째 카드 -->
										<a href="<c:url value=''/>" class="card-link">
											<div class="card-post">
												<img src="/image/board/noimg_2.jpg" class="post-img" alt="게시글 사진">
												<div class="post-body">
													<h5 class="post-title">게시글 제목(댓글수)</h5>
													<p class="post-text">추천수 | 작성자</p>
													<p class="post-text">
														<small class="text-muted">20XX.XX.XX</small>
													</p>
												</div>
											</div>
										</a>
									</div>
									<div class="col-md-3">
										<!-- 두 번째 카드 -->
										<a href="<c:url value=''/>" class="card-link">
											<div class="card-post">
												<img src="/image/board/noimg_2.jpg" class="post-img" alt="게시글 사진">
												<div class="post-body">
													<h5 class="post-title">게시글 제목(댓글수)</h5>
													<p class="post-text">추천수 | 작성자</p>
													<p class="post-text">
														<small class="text-muted">20XX.XX.XX</small>
													</p>
												</div>
											</div>
										</a>
									</div>
									<div class="col-md-3">
										<!-- 두 번째 카드 -->
										<a href="<c:url value=''/>" class="card-link">
											<div class="card-post">
												<img src="/image/board/noimg_2.jpg" class="post-img" alt="게시글 사진">
												<div class="post-body">
													<h5 class="post-title">게시글 제목(댓글수)</h5>
													<p class="post-text">추천수 | 작성자</p>
													<p class="post-text">
														<small class="text-muted">20XX.XX.XX</small>
													</p>
												</div>
											</div>
										</a>
									</div>
									<div class="col-md-3">
										<!-- 두 번째 카드 -->
										<a href="<c:url value=''/>" class="card-link">
											<div class="card-post">
												<img src="/image/board/noimg_2.jpg" class="post-img" alt="게시글 사진">
												<div class="post-body">
													<h5 class="post-title">게시글 제목(댓글수)</h5>
													<p class="post-text">추천수 | 작성자</p>
													<p class="post-text">
														<small class="text-muted">20XX.XX.XX</small>
													</p>
												</div>
											</div>
										</a>
									</div>
								</div>
								<!-- 첫 번째 행 끝 -->

								<div class="row">
									<!-- 두 번째 행 시작 -->
								</div>
								<!-- 두 번째 행 끝 -->
							</div>
							<!-- 동물별 카테고리 끝 -->
						</div>
					</section>

					<section class="tipSec"></section>
				</div>
				<!-- contents 끝 -->
			</div>
			<!-- frame-2 끝 -->
		</div>
		<!-- frame-1 끝 -->
	</div>
	<!-- desktop-1 끝 -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양육팁 게시판</title>
<link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/Board/bestTipBoard.css'/>" />
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
							<!-- <div class="bestPhoto"></div>
							<div class="bestPhoto"></div>
							<div class="bestPhoto"></div>
							<div class="bestPhoto"></div>
							<div class="bestPhoto"></div> -->
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
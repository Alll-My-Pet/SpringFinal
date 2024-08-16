<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
<link rel="icon" type="image/png" href="#" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/index/index.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/index/all_board.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/index/slideshow.css'/>">
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/index.js'/>"></script>
</head>
<body>
	<div class="desktop-1">
		<!-- 중앙 전체 프레임 -->
		<div class="frame-1">
			<!-- header 위치 부착 -->
			<div id="header">
				<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
			</div>
			<div class="contents">
				<div class="pageInfo">
					<div class="page-title">
						<div class="titleInfo">다양한 반려동물 커뮤니티를 한 눈에!</div>
						<span class="ctgTitle"> 동물별 커뮤니티 </span>
					</div>
					<button type="button" class="button" id="userguideBtn"
						data-bs-toggle="modal" data-bs-target="#userguideModal">
						이용 가이드</button>
					<!-- Modal 부착 -->
					<div id="modal">
						<c:import url="/WEB-INF/views/layout/modal.jsp"></c:import>
					</div>
				</div>
				<!-- pageInfo 끝 -->
				<div class="card-container">
					<div class="row">
						<!-- 행 시작 -->
						<div class="col-sm-3 mb-3">
							<!-- 첫 번째 카드 -->
							<a href="#" class="card-link">
								<div class="card">
									<img src="image/animal_ctg/ctg_강아지.png" class="card-img-top"
										alt="..." style="width: 80px; height: 80px;">
									<div class="card-body">
										<h5 class="card-title">강아지</h5>
									</div>
								</div>
							</a>
						</div>

						<div class="col-sm-3 mb-3">
							<!-- 두 번째 카드 -->
							<a href="#" class="card-link">
								<div class="card">
									<img src="image/animal_ctg/ctg_고양이.png" class="card-img-top"
										alt="..." style="width: 60px; height: 60px;">
									<div class="card-body">
										<h5 class="card-title">고양이</h5>
									</div>
								</div>
							</a>
						</div>

						<div class="col-sm-3 mb-3">
							<!-- 세 번째 카드 -->
							<a href="#" class="card-link">
								<div class="card">
									<img src="image/animal_ctg/ctg_기타포유류.png" class="card-img-top"
										alt="..." style="width: 80px; height: 61.65px;">
									<div class="card-body">
										<h5 class="card-title">기타 포유류</h5>
									</div>
								</div>
							</a>
						</div>

						<div class="col-sm-3 mb-3">
							<!-- 네 번째 카드 -->
							<a href="#" class="card-link">
								<div class="card">
									<img src="image/animal_ctg/ctg_파충양서류.png" class="card-img-top"
										alt="..." style="width: 80px; height: 61.65px;" />
									<div class="card-body">
										<h5 class="card-title">파충류/양서류</h5>
									</div>
								</div>
							</a>
						</div>
					</div>
					<!-- 첫 번째 행 끝 -->
					<div class="row">
						<!-- 두 번째 행 시작 -->
						<div class="col-sm-3 mb-3">
							<!-- 다섯 번째 카드 -->
							<a href="#" class="card-link">
								<div class="card">
									<img src="image/animal_ctg/ctg_어류.png" class="card-img-top"
										alt="..." style="width: 80px; height: 80px;">
									<div class="card-body">
										<h5 class="card-title">어류</h5>
									</div>
								</div>
							</a>
						</div>

						<div class="col-sm-3 mb-3">
							<!-- 여섯 번째 카드 -->
							<a href="#" class="card-link">
								<div class="card">
									<img src="image/animal_ctg/ctg_조류.png" class="card-img-top"
										alt="..." style="width: 55px; height: 55px;">
									<div class="card-body">
										<h5 class="card-title">조류</h5>
									</div>
								</div>
							</a>
						</div>

						<div class="col-sm-3 mb-3">
							<!-- 일곱 번째 카드 -->
							<a href="#" class="card-link">
								<div class="card">
									<img src="image/animal_ctg/ctg_설치류.png" class="card-img-top"
										alt="..." style="width: 70px; height: 70px;">
									<div class="card-body">
										<h5 class="card-title">설치류</h5>
									</div>
								</div>
							</a>
						</div>

						<div class="col-sm-3 mb-3">
							<!-- 여덟 번째 카드 -->
							<a href="#" class="card-link">
								<div class="card">
									<img src="image/animal_ctg/ctg_절지곤충류.png" class="card-img-top"
										alt="..." style="width: 80px; height: 65.34px;">
									<div class="card-body">
										<h5 class="card-title">절지류/곤충류</h5>
									</div>
								</div>
							</a>
						</div>
					</div>
					<!-- 두 번째 행 끝 -->
				</div>
				<!-- card-container (동물별 카테고리) 끝 -->
				<div class="all-board">
					<div class="photo-Emoji">
						<div class="best-photos">
							<a href="게시판_링크.html" class="board-title">
								<div>이번달 BEST 📷 +</div>
							</a>
							<div class="best-slideshow">
								<!-- 베스트 사진 슬라이드쇼 -->
								<button class="chevron-left">
									<img class="icon" src="image/index/chevron_left.svg" alt="왼"
										width="40px" height="45px" />
								</button>
								<div class="photo-container">
									<!-- <a href="갤러리_상세.html" ><div class="photo" id="photo1"></div></a>
                                    <div class="photo" id="photo2"></div>
                                    <div class="photo" id="photo3"></div>
                                    <div class="photo" id="photo4"></div> -->

									<a href="갤러리_상세.html" class="photo"></a> <a href="갤러리_상세.html"
										class="photo"></a> <a href="갤러리_상세.html" class="photo"></a> <a
										href="갤러리_상세.html" class="photo"></a>

								</div>
								<button class="chevron-right">
									<img class="icon" src="image/index/chevron_right.svg" alt="오"
										width="40px" height="45px" />
								</button>
							</div>
						</div>
						<!-- best-photos 끝 -->
						<div class="emoji-board">
							<a href="게시판_링크.html" class="board-title">
								<div>최고의 이모지 +</div>
							</a>
							<div class="best-emoji">
								<img src="image/index/best_emoji.png" class="card-img-top"
									alt="..." style="width: 100px; height: 100px;">
							</div>
						</div>
					</div>
					<!-- photo-Emoji 끝 -->
					<br>

					<div class="post-board">
						<div class="notice-event-board">
							<a href="게시판_링크.html" class="board-title">
								<div>공지/이벤트 +</div>
							</a>
							<!-- 공지사항 -->
							<div class="notice-zone">
								<div class="board-header">공지사항</div>
								<div class="notice-list">
									<!-- post 디폴트: 링크 걸어둔 것 -->
									<a href="게시판_상세.html" class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</a>
									<div class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</div>
									<div class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</div>
									<div class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</div>
									<div class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</div>
									<div class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</div>
									<div class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</div>
									<div class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</div>

								</div>
							</div>
							<!-- 이벤트 게시판 -->
							<div class="event-zone">
								<div class="board-header">다가오는 행사 & 이벤트🎉</div>
								<div class="event-content">
									<a href="이벤트_상세.html" class="event-info-1"> <img
										src="image/index/event_img.jpg" class="event-img" alt="..."
										width="71px" height="105px" />
										<div class="event-body">
											<span>희귀동물 박람회</span>
											<p>20XX.XX.XX ~ XX.XX</p>
											<p>일산 킨텍스</p>
										</div>
									</a> <a href="이벤트_상세.html" class="event-info-2"> <img
										src="image/index/event_img.jpg" class="event-img" alt="..."
										width="71px" height="105px" />
										<div class="event-body">
											<span>희귀동물 박람회</span>
											<p>20XX.XX.XX ~ XX.XX</p>
											<p>일산 킨텍스</p>
										</div>
									</a>
								</div>
							</div>
							<!-- event-zone 끝 -->
						</div>
						<!-- notice-event board 끝 -->
						<div class="community-board">
							<div class="hot-board">
								<a href="게시판_링크.html" class="board-title">
									<div>핫한 게시글🔥 +</div>
								</a>
								<div class="hot-list">
									<!-- post 디폴트: 링크 걸어둔 것 -->
									<a href="게시판_상세.html" class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</a>
									<div class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</div>
									<div class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</div>
								</div>
							</div>
							<div class="general-board">
								<a href="게시판_링크.html" class="board-title">
									<div>자유게시판 +</div>
								</a>
								<div class="general-list">
									<!-- post 디폴트: 링크 걸어둔 것 -->
									<a href="게시판_상세.html" class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</a>
									<div class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</div>
									<div class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</div>
									<div class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</div>
									<div class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</div>
									<div class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</div>
									<div class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</div>
									<div class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</div>
									<div class="post">
										<div class="post-title">게시글제목게시글제목</div>
										<div class="post-author">☆작성자★</div>
										<div class="post-date">8/06 12:55</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- post-board 끝 -->
				</div>
			</div>
			<!-- contents 끝 -->
			<!-- 플로팅버튼(탑버튼 포함) -->
			<div id="floatingBtn">
				<c:import url="/WEB-INF/views/layout/floating_btn.jsp"></c:import>
			</div>
		</div>
		<!-- framer-1 끝 -->
		<br> <br>
		<!-- footer부착 -->
		<div id="footer">
			<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
		</div>
	</div>
	<!-- desktop-1 끝 -->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양육팁 게시판</title>
<link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/board/bestTipBoard.css'/>" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="<c:url value='/js/Board/bestTipBoard.js'/>"></script>
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
								<!-- 첫번째 동물군 베스트팁 -->
								<a href="<c:url value='/animal_home/1/tip'/>" class="board-title">
									<div>강아지 양육팁 바로가기🐶</div>
								</a>

								<div class="carousel-inner">
									<div class="row">
										<c:forEach var="dog" items="${dogTips }">
											<div class="col-md-4">
												<a href="<c:url value='/tip/1/detailTipBoard/${dog.postNo}'/>" class="card-link">
													<div class="card-post">
														<div class="post-body">
															<span class="post-title">${dog.postTitle }</span>
															<div class="post-info">
																<span class="author">${dog.memNickName}</span> <span
																	class="divider">|</span> <img
																	src="/image/board/view_gray.svg" alt="조회수"
																	class="view-icon"><span id="bodView">&nbsp;${dog.postView}</span>
															</div>
															<p class="post-date">
																<fmt:formatDate value="${dog.postDate}"
																	pattern="YYYY.MM.dd" />
															</p>
														</div>
													</div>
												</a>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- carousel-inner 끝 -->
							</div>
							<!-- card-container 끝 -->
							
							<br> <br>
							<div class="card-container">
								<!-- 두번째 동물군 베스트팁 -->
								<a href="<c:url value='/animal_home/2/tip'/>" class="board-title">
									<div>고양이 양육팁 바로가기🐕 </div>
								</a>

								<div class="carousel-inner">
									<div class="row">
										<c:forEach var="cat" items="${catTips }">
											<div class="col-md-4">
												<a href="<c:url value='/tip/2/detailTipBoard/${cat.postNo}'/>" class="card-link">
													<div class="card-post">
														<div class="post-body">
															<span class="post-title">${cat.postTitle }</span>
															<div class="post-info">
																<span class="author">${cat.memNickName}</span> <span
																	class="divider">|</span> <img
																	src="/image/board/view_gray.svg" alt="조회수"
																	class="view-icon"><span id="bodView">&nbsp;${cat.postView}</span>
															</div>
															<p class="post-date">
																<fmt:formatDate value="${cat.postDate}"
																	pattern="YYYY.MM.dd" />
															</p>
														</div>
													</div>
												</a>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- carousel-inner 끝 -->
							</div>
							<!-- card-container 끝 -->
							<br> <br>
							<div class="card-container">
								<!-- 세번째 동물군 베스트팁 -->
								<a href="<c:url value='/animal_home/3/tip'/>" class="board-title">
									<div>기타 포유류 양육팁 바로가기🐇</div>
								</a>

								<div class="carousel-inner">
									<div class="row">
										<c:forEach var="other" items="${otherTips }">
											<div class="col-md-4">
												<a href="<c:url value='/tip/3/detailTipBoard/${other.postNo}'/>" class="card-link">
													<div class="card-post">
														<div class="post-body">
															<span class="post-title">${other.postTitle }</span>
															<div class="post-info">
																<span class="author">${other.memNickName}</span> <span
																	class="divider">|</span> <img
																	src="/image/board/view_gray.svg" alt="조회수"
																	class="view-icon"><span id="bodView">&nbsp;${other.postView}</span>
															</div>
															<p class="post-date">
																<fmt:formatDate value="${other.postDate}"
																	pattern="YYYY.MM.dd" />
															</p>
														</div>
													</div>
												</a>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- carousel-inner 끝 -->
							</div>
							<!-- card-container 끝 -->
							<br> <br>
							<div class="card-container">
								<!-- 네번째 동물군 베스트팁 -->
								<a href="<c:url value='/animal_home/4/tip'/>" class="board-title">
									<div>파충류/양서류 양육팁 바로가기🐢</div>
								</a>

								<div class="carousel-inner">
									<div class="row">
										<c:forEach var="rep" items="${repTips }">
											<div class="col-md-4">
												<a href="<c:url value='/tip/4/detailTipBoard/${rep.postNo}'/>" class="card-link">
													<div class="card-post">
														<div class="post-body">
															<span class="post-title">${rep.postTitle }</span>
															<div class="post-info">
																<span class="author">${rep.memNickName}</span> <span
																	class="divider">|</span> <img
																	src="/image/board/view_gray.svg" alt="조회수"
																	class="view-icon"><span id="bodView">&nbsp;${rep.postView}</span>
															</div>
															<p class="post-date">
																<fmt:formatDate value="${rep.postDate}"
																	pattern="YYYY.MM.dd" />
															</p>
														</div>
													</div>
													<!-- card-post끝 -->
												</a>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- carousel-inner 끝 -->
							</div>
							<!-- card-container 끝 -->
							<br> <br>
							<div class="card-container">
								<!-- 다섯번째 동물군 베스트팁 -->
								<a href="<c:url value='/animal_home/5/tip'/>" class="board-title">
									<div>어류 양육팁 바로가기🐠</div>
								</a>

								<div class="carousel-inner">
									<div class="row">
										<c:forEach var="fish" items="${fishTips }">
											<div class="col-md-4">
												<a href="<c:url value='/tip/5/detailTipBoard/${fish.postNo}'/>" class="card-link">
													<div class="card-post">
														<div class="post-body">
															<span class="post-title">${fish.postTitle }</span>
															<div class="post-info">
																<span class="author">${fish.memNickName}</span> <span
																	class="divider">|</span> <img
																	src="/image/board/view_gray.svg" alt="조회수"
																	class="view-icon"><span id="bodView">&nbsp;${fish.postView}</span>
															</div>
															<p class="post-date">
																<fmt:formatDate value="${fish.postDate}"
																	pattern="YYYY.MM.dd" />
															</p>
														</div>
													</div>
													<!-- card-post끝 -->
												</a>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- carousel-inner 끝 -->
							</div>
							<!-- card-container 끝 -->
							<br> <br>
							<div class="card-container">
								<!-- 첫번째 동물군 베스트팁 -->
								<a href="<c:url value='/animal_home/6/tip'/>" class="board-title">
									<div>조류 양육팁 바로가기🦜</div>
								</a>

								<div class="carousel-inner">
									<div class="row">
										<c:forEach var="bird" items="${birdTips }">
											<div class="col-md-4">
												<a href="<c:url value='/tip/6/detailTipBoard/${bird.postNo}'/>" class="card-link">
													<div class="card-post">
														<div class="post-body">
															<span class="post-title">${bird.postTitle }</span>
															<div class="post-info">
																<span class="author">${bird.memNickName}</span> <span
																	class="divider">|</span> <img
																	src="/image/board/view_gray.svg" alt="조회수"
																	class="view-icon"><span id="bodView">&nbsp;${bird.postView}</span>
															</div>
															<p class="post-date">
																<fmt:formatDate value="${bird.postDate}"
																	pattern="YYYY.MM.dd" />
															</p>
														</div>
													</div>
												</a>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- carousel-inner 끝 -->
							</div>
							<!-- card-container 끝 -->
							<br> <br>
							<div class="card-container">
								<!-- 첫번째 동물군 베스트팁 -->
								<a href="<c:url value='/animal_home/7/tip'/>" class="board-title">
									<div>설치류 양육팁 바로가기🐹</div>
								</a>

								<div class="carousel-inner">
									<div class="row">
										<c:forEach var="rod" items="${rodTips }">
											<div class="col-md-4">
												<a href="<c:url value='/tip/7/detailTipBoard/${rod.postNo}'/>" class="card-link">
													<div class="card-post">
														<div class="post-body">
															<span class="post-title">${rod.postTitle }</span>
															<div class="post-info">
																<span class="author">${rod.memNickName}</span> <span
																	class="divider">|</span> <img
																	src="/image/board/view_gray.svg" alt="조회수"
																	class="view-icon"><span id="bodView">&nbsp;${rod.postView}</span>
															</div>
															<p class="post-date">
																<fmt:formatDate value="${rod.postDate}"
																	pattern="YYYY.MM.dd" />
															</p>
														</div>
													</div>
												</a>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- carousel-inner 끝 -->
							</div>
							<!-- card-container 끝 -->
							<br> <br>
							<div class="card-container">
								<!-- 첫번째 동물군 베스트팁 -->
								<a href="<c:url value='/animal_home/8/tip'/>" class="board-title">
									<div>절지류/곤충류 양육팁 바로가기🕷️</div>
								</a>

								<div class="carousel-inner">
									<div class="row">
										<c:forEach var="insect" items="${insectTips }">
											<div class="col-md-4">
												<a href="<c:url value='/tip/8/detailTipBoard/${insect.postNo}'/>" class="card-link">
													<div class="card-post">
														<div class="post-body">
															<span class="post-title">${insect.postTitle }</span>
															<div class="post-info">
																<span class="author">${insect.memNickName}</span> <span
																	class="divider">|</span> <img
																	src="/image/board/view_gray.svg" alt="조회수"
																	class="view-icon"><span id="bodView">&nbsp;${insect.postView}</span>
															</div>
															<p class="post-date">
																<fmt:formatDate value="${insect.postDate}"
																	pattern="YYYY.MM.dd" />
															</p>
														</div>
													</div>
												</a>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- carousel-inner 끝 -->
							</div>
							<!-- card-container 끝 -->
						</div>
						<!-- bestBox 끝 -->
					</section>

					<section class="tipSec"></section>
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
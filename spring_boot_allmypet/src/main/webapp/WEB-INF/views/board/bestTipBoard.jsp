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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/bestTipBoard.css'/>" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
<script src="<c:url value='/js/Board/bestTipBoard.js'/>"></script>
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
								<a href="<c:url value=''/>" class="board-title">
									<div>강아지 양육팁 바로가기🐶</div>
								</a>

								<div class="carousel-inner">
									<div class="row">
										<c:forEach var="dog" items="${dogTips }">
											<div class="col-md-4">
												<a href="<c:url value=''/>" class="card-link">
													<div class="card-post">
														<div class="post-body">
															<span class="post-title">${dog.postTitle }</span>
															<p class="post-info">${dog.postLike }|${dog.memNickName }</p>
															<p class="post-date">
																<fmt:formatDate value="${dog.postDate}"
																	pattern="M/dd HH:mm" />
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
								<a href="<c:url value=''/>" class="board-title">
									<div>고양이 양육팁 바로가기🐕 </div>
								</a>

								<div class="carousel-inner">
									<div class="row">
										<c:forEach var="cat" items="${catTips }">
											<div class="col-md-4">
												<a href="<c:url value=''/>" class="card-link">
													<div class="card-post">
														<div class="post-body">
															<span class="post-title">${cat.postTitle }</span>
															<p class="post-text">${cat.postLike }|${cat.memNickName }</p>
															<p class="post-text">
																<small class="text-muted"><fmt:formatDate
																		value="${cat.postDate}" pattern="M/dd HH:mm" /></small>
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
								<a href="<c:url value=''/>" class="board-title">
									<div>기타 포유류 양육팁 바로가기🐇</div>
								</a>

								<div class="carousel-inner">
									<div class="row">
										<c:forEach var="other" items="${otherTips }">
											<div class="col-md-4">
												<a href="<c:url value=''/>" class="card-link">
													<div class="card-post">
														<div class="post-body">
															<span class="post-title">${other.postTitle }</span>
															<p class="post-text">${other.postLike }|${other.memNickName }</p>
															<p class="post-text">
																<small class="text-muted"><fmt:formatDate
																		value="${other.postDate}" pattern="M/dd HH:mm" /></small>
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
								<a href="<c:url value=''/>" class="board-title">
									<div>파충류/양서류 양육팁 바로가기🐢</div>
								</a>

								<div class="carousel-inner">
									<div class="row">
										<c:forEach var="rep" items="${repTips }">
											<div class="col-md-4">
												<a href="<c:url value=''/>" class="card-link">
													<div class="card-post">
														<div class="post-body">
															<span class="post-title">${rep.postTitle }</span>
															<p class="post-text">${rep.postLike }|${rep.memNickName }</p>
															<p class="post-text">
																<small class="text-muted"><fmt:formatDate
																		value="${rep.postDate}" pattern="M/dd HH:mm" /></small>
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
								<!-- 다섯번째 동물군 베스트팁 -->
								<a href="<c:url value=''/>" class="board-title">
									<div>어류 양육팁 바로가기🐠</div>
								</a>

								<div class="carousel-inner">
									<div class="row">
										<c:forEach var="fish" items="${fishTips }">
											<div class="col-md-4">
												<a href="<c:url value=''/>" class="card-link">
													<div class="card-post">
														<div class="post-body">
															<span class="post-title">${fish.postTitle }</span>
															<p class="post-text">${fish.postLike }|${dog.memNickName }</p>
															<p class="post-text">
																<small class="text-muted"><fmt:formatDate
																		value="${fish.postDate}" pattern="M/dd HH:mm" /></small>
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
								<a href="<c:url value=''/>" class="board-title">
									<div>조류 양육팁 바로가기🦜</div>
								</a>

								<div class="carousel-inner">
									<div class="row">
										<c:forEach var="bird" items="${birdTips }">
											<div class="col-md-4">
												<a href="<c:url value=''/>" class="card-link">
													<div class="card-post">
														<div class="post-body">
															<span class="post-title">${bird.postTitle }</span>
															<p class="post-text">${bird.postLike }|${dog.memNickName }</p>
															<p class="post-text">
																<small class="text-muted"><fmt:formatDate
																		value="${bird.postDate}" pattern="M/dd HH:mm" /></small>
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
								<a href="<c:url value=''/>" class="board-title">
									<div>설치류 양육팁 바로가기🐹</div>
								</a>

								<div class="carousel-inner">
									<div class="row">
										<c:forEach var="rod" items="${rodTips }">
											<div class="col-md-4">
												<a href="<c:url value=''/>" class="card-link">
													<div class="card-post">
														<div class="post-body">
															<span class="post-title">${rod.postTitle }</span>
															<p class="post-text">${rod.postLike }|${dog.memNickName }</p>
															<p class="post-text">
																<small class="text-muted"><fmt:formatDate
																		value="${rod.postDate}" pattern="M/dd HH:mm" /></small>
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
								<a href="<c:url value=''/>" class="board-title">
									<div>절지류/곤충류 양육팁 바로가기🕷️</div>
								</a>

								<div class="carousel-inner">
									<div class="row">
										<c:forEach var="insect" items="${insectTips }">
											<div class="col-md-4">
												<a href="<c:url value=''/>" class="card-link">
													<div class="card-post">
														<div class="post-body">
															<span class="post-title">${insect.postTitle }</span>
															<p class="post-text">${insect.postLike }|${dog.memNickName }</p>
															<p class="post-text">
																<small class="text-muted"><fmt:formatDate
																		value="${insect.postDate}" pattern="M/dd HH:mm" /></small>
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
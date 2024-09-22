<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/usedItem/usedItemBoard.css'/>">
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/usedItem/usedItemBoard.js'/>"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic&display=swap')
	;
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

					<!-- <h3 class="usedItemFont">중고거래</h3>
						<p class="usedItemFont-sell">팝니다</p> -->

					<div class="pageInfo">
						<div class="page-title">
							<span class="ctgTitle">용품 중고거래</span>
							<div class="titleInfo">팔아요! 🤚</div>
						</div>
					</div>
					<!-- pageInfo 끝 -->

					<div class="All">
						<div class="petCtgBox">
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
						<!-- petCtgBox 끝 -->
						<hr>

						<div class="postBox">
							<div class="postCardBox">
								<div class="postCardPic">
									<img src="<c:url value='/project_images/도마뱀 사육장.jfif'/>"
										class="img" />
								</div>
								<div class="itemInfo">
									<div class="info-box">
										<div class="tradelocal">서울-직접</div>
										<span class="divider">|</span>
										<div class="itemState" id="itemState">중고</div>
									</div>
									<div class="info-box2">
										<div class="petCtgName">
											<img src="/image/animal_ctg/ctg_파충류.png" alt="..."
												style="width: 25px; height: 25px;">
										</div>
										<div class="itemName">도마뱀 사육장</div>
									</div>
									<div class="info-box">
										<div class="itemPrice">10000원</div>
									</div>
								</div>
								<!-- itemInfo끝 -->
							</div>
							<!-- postCardBox끝 -->
							<div class="postCardBox">
								<div class="postCardPic">
									<img src="<c:url value='/project_images/햄스터 먹이.jfif'/>"
										class="img" />
								</div>
								<div class="itemInfo">
									<div class="info-box">
										<div class="tradelocal">경기-택배</div>
										<span class="divider">|</span>
										<div class="itemState" id="itemState">새 제품</div>
									</div>
									<div class="info-box2">
										<div class="petCtgName">
											<img src="/image/animal_ctg/ctg_기타1.png" class="card-img"
														alt="..." style="width: 20px; height: 20px;">
										</div>
										<div class="itemName">햄스터 먹이</div>
									</div>
									<div class="info-box">
										<div class="itemPrice">7000원</div>
									</div>
								</div>
								<!-- itemInfo끝 -->
							</div>
							<!-- postCardBox끝 -->
							<div class="postCardBox">
								<div class="postCardPic">
									<img src="<c:url value='/project_images/노즈워크.jfif'/>"
										class="img" />
								</div>
								<div class="itemInfo">
									<div class="info-box">
										<div class="tradelocal">대구-택배</div>
										<span class="divider">|</span>
										<div class="itemState" id="itemState">중고</div>
									</div>
									<div class="info-box2">
										<div class="petCtgName">
											<img src="/image/animal_ctg/ctg_파충류.png" alt="..."
												style="width: 25px; height: 25px;">
										</div>
										<div class="itemName">노즈워크</div>
									</div>
									<div class="info-box">
										<div class="itemPrice">15000원</div>
									</div>
								</div>
								<!-- itemInfo끝 -->
							</div>
							<!-- postCardBox끝 -->
							<div class="postCardBox">
								<div class="postCardPic">
									<img src="<c:url value='/project_images/물고기 사료.jfif'/>"
										class="img" />
								</div>
								<div class="itemInfo">
									<div class="info-box">
										<div class="tradelocal">제주도-택배</div>
										<span class="divider">|</span>
										<div class="itemState" id="itemState">새 제품</div>
									</div>
									<div class="info-box2">
										<div class="petCtgName">
											<img src="/image/animal_ctg/ctg_파충류.png" alt="..."
												style="width: 25px; height: 25px;">
										</div>
										<div class="itemName">물고기 사료</div>
									</div>
									<div class="info-box">
										<div class="itemPrice">5000원</div>
									</div>
								</div>
								<!-- itemInfo끝 -->
							</div>
							<!-- postCardBox끝 -->
							<div class="postCardBox">
								<div class="postCardPic">
									<img src="<c:url value='/project_images/앵무새 집.jfif'/>"
										class="img" />
								</div>
								<div class="itemInfo">
									<div class="info-box">
										<div class="tradelocal">인천-직접</div>
										<span class="divider">|</span>
										<div class="itemState" id="itemState">중고</div>
									</div>
									<div class="info-box2">
										<div class="petCtgName">
											<img src="/image/animal_ctg/ctg_파충류.png" alt="..."
												style="width: 25px; height: 25px;">
										</div>
										<div class="itemName">새 사육</div>
									</div>
									<div class="info-box">
										<div class="itemPrice">40000원</div>
									</div>
								</div>
								<!-- itemInfo끝 -->
							</div>
							<!-- postCardBox끝 -->
							<div class="postCardBox">
								<div class="postCardPic">
									<img src="<c:url value='/project_images/캣닢.jfif'/>" class="img" />
								</div>
								<div class="itemInfo">
									<div class="info-box">
										<div class="tradelocal">서울-직접</div>
										<span class="divider">|</span>
										<div class="itemState" id="itemState">새 제품</div>
									</div>
									<div class="info-box2">
										<div class="petCtgName">
											<img src="/image/animal_ctg/ctg_파충류.png" alt="..."
												style="width: 25px; height: 25px;">
										</div>
										<div class="itemName">캣닢</div>
									</div>
									<div class="info-box">
										<div class="itemPrice">4000원</div>
									</div>
								</div>
								<!-- itemInfo끝 -->
							</div>
							<!-- postCardBox끝 -->
							<div class="postCardBox">
								<div class="postCardPic">
									<img src="<c:url value='/project_images/강아지 장난감.jfif'/>"
										class="img" />
								</div>

								<div class="itemInfo">
									<div class="info-box">
										<div class="tradelocal">충남-택배</div>
										<span class="divider">|</span>
										<div class="itemState" id="itemState">중고</div>
									</div>
									<div class="info-box2">
										<div class="petCtgName">
											<img src="/image/animal_ctg/ctg_파충류.png" alt="..."
												style="width: 25px; height: 25px;">
										</div>
										<div class="itemName">강아지 장난감</div>
									</div>
									<div class="info-box">
										<div class="itemPrice">8000원</div>
									</div>
								</div>
								<!-- itemInfo끝 -->
							</div>
							<!-- postCardBox끝 -->
							<div class="postCardBox">
								<div class="postCardPic">
									<img src="<c:url value='/project_images/스크래처.jfif'/>"
										class="img" />
								</div>
								<div class="itemInfo">
									<div class="info-box">
										<div class="tradelocal">강원도-택배</div>
										<span class="divider">|</span>
										<div class="itemState" id="itemState">새 제품</div>
									</div>
									<div class="info-box2">
										<div class="petCtgName">
											<img src="/image/animal_ctg/ctg_파충류.png" alt="..."
												style="width: 25px; height: 25px;">
										</div>
										<div class="itemName">스크래처</div>
									</div>
									<div class="info-box">
										<div class="itemPrice">20000원</div>
									</div>
								</div>
								<!-- itemInfo끝 -->
							</div>
							<!-- postCardBox끝 -->
							<div class="postCardBox">
								<div class="postCardPic">
									<img src="<c:url value='/project_images/사슴벌레 먹이.jfif'/>"
										class="img" />
								</div>
								<div class="itemInfo">
									<div class="info-box">
										<div class="tradelocal">서울-택배</div>
										<span class="divider">|</span>
										<div class="itemState" id="itemState">새 제품</div>
									</div>
									<div class="info-box2">
										<div class="petCtgName">
											<img src="/image/animal_ctg/ctg_파충류.png" alt="..."
												style="width: 25px; height: 25px;">
										</div>
										<div class="itemName">사슴벌레 먹이</div>
									</div>
									<div class="info-box">
										<div class="itemPrice">6000원</div>
									</div>
								</div>
								<!-- itemInfo끝 -->
							</div>
							<!-- postCardBox끝 -->
							<div class="postCardBox">
								<div class="postCardPic">
									<img src="<c:url value='/project_images/페럿 집.jfif'/>"
										class="img" />
								</div>
								<div class="itemInfo">
									<div class="info-box">
										<div class="tradelocal">경기-직접</div>
										<span class="divider">|</span>
										<div class="itemState" id="itemState">중고</div>
									</div>
									<div class="info-box2">
										<div class="petCtgName">
											<img src="/image/animal_ctg/ctg_파충류.png" alt="..."
												style="width: 25px; height: 25px;">
										</div>
										<div class="itemName">페럿 집</div>
									</div>
									<div class="info-box">
										<div class="itemPrice">페럿 집</div>
									</div>
								</div>
								<!-- itemInfo끝 -->
							</div>
							<!-- postCardBox끝 -->
							<div class="postCardBox">
								<div class="postCardPic">
									<img src="<c:url value='/project_images/토끼 사료.jfif'/>"
										class="img" />
								</div>
								<div class="itemInfo">
									<div class="info-box">
										<div class="tradelocal">수원-택배</div>
										<span class="divider">|</span>
										<div class="itemState" id="itemState">새 제품</div>
									</div>
									<div class="info-box2">
										<div class="petCtgName">
											<img src="/image/animal_ctg/ctg_파충류.png" alt="..."
												style="width: 25px; height: 25px;">
										</div>
										<div class="itemName">토끼 사료</div>
									</div>
									<div class="info-box">
										<div class="itemPrice">15000원</div>
									</div>
								</div>
								<!-- itemInfo끝 -->
							</div>
							<!-- postCardBox끝 -->
							<div class="postCardBox">
								<div class="postCardPic">
									<img src="<c:url value='/project_images/앵무새 먹이.jfif'/>"
										class="img" />
								</div>
								<div class="itemInfo">
									<div class="info-box">
										<div class="tradelocal">논산-택배</div>
										<span class="divider">|</span>
										<div class="itemState" id="itemState">새 제품</div>
									</div>
									<div class="info-box2">
										<div class="petCtgName">
											<img src="/image/animal_ctg/ctg_파충류.png" alt="..."
												style="width: 25px; height: 25px;">
										</div>
										<div class="itemName">앵무새 알곡 사</div>
									</div>
									<div class="info-box">
										<div class="itemPrice">20000원</div>
									</div>
								</div>
								<!-- itemInfo끝 -->
							</div>
							<!-- postCardBox끝 -->
						</div>
						<!-- postBox끝  -->
						<div class="bottom-box">
							<div class="btn-container">
								<button class="writeBtn">글 쓰기</button>
							</div>
							<div class="searchAndButton">
								<input type="text" class="searchBar" placeholder="검색어 입력">
							</div>
							<div class="pagingBox">
								<div class="paging">이전</div>
								<div class="paging" style="border: 1px solid skyblue;">1</div>
								<div class="paging">다음</div>
							</div>
						</div>
						<!-- bottom-box끝 -->
					</div>
					<!-- All 끝 -->

				</div>
				<!-- contents 끝 -->
			</div>
			<!-- frame-2 끝 -->

			<!-- sidebar -->
			<div id="sidebar">
				<c:import url="/WEB-INF/views/layout/usedItemSidebar.jsp"></c:import>
			</div>
		</div>
		<!-- frame-1끝 -->
		<br> <br>
		<!-- footer부착 -->
		<div id="footer">
			<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
		</div>
	</div>
	<!-- desktop-1끝 -->
</body>
</html>
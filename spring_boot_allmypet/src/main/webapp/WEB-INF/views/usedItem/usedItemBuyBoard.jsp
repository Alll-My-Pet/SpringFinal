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
	href="<c:url value='/css/usedItem/usedItemBuyBoard.css'/>">
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/usedItem/usedItemBuy.js'/>"></script>
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
							<div class="titleInfo">사요! 🛍️</div>
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
							<table class="buyTable">
								<thead>
									<tr>
										<th>동물 종류</th>
										<th>상태(구매완 / 구매중)</th>
										<th>제목</th>
										<th>글 작성일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>고양이</td>
										<td>구매 중</td>
										<td>고양이 스크래처 삽니다!</td>
										<td>2024-02-01</td>
									</tr>
									<tr>
										<td>조류</td>
										<td>구매 완</td>
										<td>앵무새 먹이 구해요!</td>
										<td>2024-04-03</td>
									</tr>
									<tr>
										<td>강아지</td>
										<td>구매 중</td>
										<td>강아지 노즈워크 삽니다!</td>
										<td>2024-04-03</td>
									</tr>
									<tr>
										<td>기타 포유류</td>
										<td>구매 중</td>
										<td>페럿 집 있으신분?</td>
										<td>2024-04-07</td>
									</tr>
									<tr>
										<td>어류</td>
										<td>구매 중</td>
										<td>물고기 먹이 삽니다</td>
										<td>2024-04-08</td>
									</tr>
									<tr>
										<td>기타 포유류</td>
										<td>구매 완</td>
										<td>미어캣 장난감 있으신분!</td>
										<td>2024-04-10</td>
									</tr>
									<tr>
										<td>파충•양서류</td>
										<td>구매 완</td>
										<td>슈퍼밀웜 싸게 파실분 있으신가요?</td>
										<td>2024-05-10</td>
									</tr>
									<tr>
										<td>절지•곤충류</td>
										<td>구매 중</td>
										<td>장수 풍뎅이 집 꾸밀것들 구해요</td>
										<td>2024-05-12</td>
									</tr>
									<tr>
										<td>절지•곤충류</td>
										<td>구매 중</td>
										<td>타란튤라 케이스 구합니다~</td>
										<td>2024-05-13</td>
									</tr>
									<tr>
										<td>설치류</td>
										<td>구매 완</td>
										<td>햄스터 톱밥 많이 삽니다</td>
										<td>2024-06-14</td>
									</tr>
									<tr>
										<td>기타 포유류</td>
										<td>구매 완</td>
										<td>토끼 먹이로 줄 건초 구해요</td>
										<td>2024-06-17</td>
									</tr>
									<tr>
										<td>파충•양서류</td>
										<td>구매 중</td>
										<td>거북이 사료 좋은거 삽니다</td>
										<td>2024-07-17</td>
									</tr>
									<tr>
										<td>강아지</td>
										<td>구매 중</td>
										<td>강아지 간식 많이 삽니다!!</td>
										<td>2024-08-20</td>
									</tr>
									<tr>
										<td>고양이</td>
										<td>구매 중</td>
										<td>고양이 캣닢 구해요</td>
										<td>2024-08-21</td>
									</tr>
									<tr>
										<td>어류</td>
										<td>구매 완</td>
										<td>산소 공급기 싸게 파실분 있으신가요</td>
										<td>2024-08-22</td>
									</tr>
									<tr>
										<td>고양이</td>
										<td>구매 완</td>
										<td>고양이 사료 좋은거 살게요</td>
										<td>2024-08-22</td>
									</tr>
									<tr>
										<td>기타 포유류</td>
										<td>구매 중</td>
										<td>토끼 하우스 케이지 삽니다~</td>
										<td>2024-08-30</td>
									</tr>
								</tbody>


							</table>
						</div>
						<!-- postBox끝 -->
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/usedItem/usedItemBuyBoard.css'/>">
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
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
				
						<h3 class="usedItemFont">중고거래</h3>
						<p class="usedItemFont-sell">팝니다</p>
						
						<div class="All">
							<div class="petCtgBox">
							
								<div class="petCtg" style="font-size:15px;">
									전체보기
								</div>
								<div class="petCtg">
									강아지
								</div>
								<div class="petCtg">
									고양이
								</div>
								<div class="petCtg" style="font-size:15px;">
									기타 포유류
								</div>
								<div class="petCtg" style="font-size:15px;">
									파충류/양서류
								</div>
								<div class="petCtg">
									어류
								</div>
								<div class="petCtg">
									조류
								</div>
								<div class="petCtg">
									설치류
								</div>
								<div class="petCtg" style="font-size:15px;">
									절지류/곤충류
								</div>
								
							</div><!-- petCtgBox 끝 -->
							
							<hr>
							
							<div class="postBox">
								<table class="buyTable">
									<tr>
										<th>동물 종류</th>
										<th>상태(구매완 / 구매중)</th>
										<th>제목</th>
										<th>글 작성일</th>
									</tr>
									
									<tr>
										<td>고양이</td>
										<td>구매 중</td>
										<td>고양이 스크래처 삽니다!</td>
										<td>2024-02-01</td>
									</tr>
									<tr>
										<td>앵무새</td>
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
										<td>페럿</td>
										<td>구매 중</td>
										<td>페럿 집 있으신분?</td>
										<td>2024-04-07</td>
									</tr>
									<tr>
										<td>구피</td>
										<td>구매 중</td>
										<td>물고기 먹이 삽니다</td>
										<td>2024-04-08</td>
									</tr>
									<tr>
										<td>미어캣</td>
										<td>구매 완</td>
										<td>미어캣 장난감 있으신분!</td>
										<td>2024-04-10</td>
									</tr>
									<tr>
										<td>크레스티드 게코</td>
										<td>구매 완</td>
										<td>슈퍼밀웜 싸게 파실분 있으신가요?</td>
										<td>2024-05-10</td>
									</tr>
									<tr>
										<td>장수 풍뎅이</td>
										<td>구매 중</td>
										<td>장수 풍뎅이 집 꾸밀것들 구해요</td>
										<td>2024-05-12</td>
									</tr>
									<tr>
										<td>타란튤라</td>
										<td>구매 중</td>
										<td>타란튤라 케이스 구합니다~</td>
										<td>2024-05-13</td>
									</tr>
									<tr>
										<td>골든 햄스터</td>
										<td>구매 완</td>
										<td>햄스터 톱밥 많이 삽니다</td>
										<td>2024-06-14</td>
									</tr>
									<tr>
										<td>토끼</td>
										<td>구매 완</td>
										<td>토끼 먹이로 줄 건초 구해요</td>
										<td>2024-06-17</td>
									</tr>
									<tr>
										<td>거북이</td>
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
										<td>금붕어</td>
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
										<td>토끼</td>
										<td>구매 중</td>
										<td>토끼 하우스 케이지 삽니다~</td>
										<td>2024-08-30</td>
									</tr>
									
								</table>
							</div>
							
							<div class="pagingBox">
								<div class="paging">
									이전
								</div>
								<div class="paging" style="border:1px solid skyblue;">
									1
								</div>
								<div class="paging">
									다음
								</div>
							</div>
							
							<div class="searchAndButton">
								<input type="text" class="searchBar" placeholder="검색어 입력">
								
								<button class="writeBtn">글 쓰기</button>
							</div>
							
						</div><!-- All 끝 -->
				</div>
				<!-- contents 끝 -->
			</div>
			<!-- frame-2 끝 -->
		</div>
		<!-- frame-1끝 -->
		<br> <br>
		
		<!-- sidebar -->
		<div id="sidebar">
			<c:import url="/WEB-INF/views/layout/usedItemSidebar.jsp"></c:import>
	    </div>
		
		
		<!-- footer부착 -->
		<div id="footer">
			<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
		</div>
	</div>
	<!-- desktop-1끝 -->
</body>
</html>
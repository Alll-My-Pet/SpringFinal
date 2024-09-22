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
<link rel="stylesheet" type="text/css" href="<c:url value='/css/usedItem/usedItemBoard.css'/>">
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
								<div class="postCardBox">
									<div class="postCardPic">
										<img src="<c:url value='/project_images/도마뱀 사육장.jfif'/>" class="img"/>
									</div>
									<div class="itemInfo">
										<div class="tradelocal">
											서울-직접
										</div>
										<div class="itemState">
											중고
										</div>
										<div class="itemName">
											도마뱀 사육장
										</div>
										<div class="itemPrice">
											10000원
										</div>
									</div> <!-- itemInfo끝 -->
								</div> <!-- postCardBox끝 -->
								<div class="postCardBox">
									<div class="postCardPic">
										<img src="<c:url value='/project_images/햄스터 먹이.jfif'/>" class="img"/>
									</div>
									<div class="itemInfo">
										<div class="tradelocal">
											경기-택배
										</div>
										<div class="itemState">
											새 제품
										</div>
										<div class="itemName">
											햄스터 먹이
										</div>
										<div class="itemPrice">
											7000원
										</div>
									</div> <!-- itemInfo끝 -->
								</div> <!-- postCardBox끝 -->
								<div class="postCardBox">
									<div class="postCardPic">
										<img src="<c:url value='/project_images/노즈워크.jfif'/>" class="img"/>
									</div>
									<div class="itemInfo">
										<div class="tradelocal">
											대구-택배
										</div>
										<div class="itemState">
											중고
										</div>
										<div class="itemName" style="font-size:13px;">
											노즈워크
										</div>
										<div class="itemPrice">
											15000원
										</div>
									</div> <!-- itemInfo끝 -->
								</div> <!-- postCardBox끝 -->
								<div class="postCardBox">
									<div class="postCardPic">
										<img src="<c:url value='/project_images/물고기 사료.jfif'/>" class="img"/>
									</div>
									<div class="itemInfo">
										<div class="tradelocal" style="font-size:10px;">
											제주도-택배
										</div>
										<div class="itemState">
											새 제품
										</div>
										<div class="itemName">
											물고기 사료
										</div>
										<div class="itemPrice">
											5000원
										</div>
									</div> <!-- itemInfo끝 -->
								</div> <!-- postCardBox끝 -->
								<div class="postCardBox">
									<div class="postCardPic">
										<img src="<c:url value='/project_images/앵무새 집.jfif'/>" class="img"/>
									</div>
									<div class="itemInfo">
										<div class="tradelocal">
											인천-직접
										</div>
										<div class="itemState">
											중고
										</div>
										<div class="itemName" style="font-size:15px;">
											새 집
										</div>
										<div class="itemPrice">
											40000원
										</div>
									</div> <!-- itemInfo끝 -->
								</div> <!-- postCardBox끝 -->
								<div class="postCardBox">
									<div class="postCardPic">
										<img src="<c:url value='/project_images/캣닢.jfif'/>" class="img"/>
									</div>
									<div class="itemInfo">
										<div class="tradelocal">
											서울-택배
										</div>
										<div class="itemState">
											새 제품
										</div>
										<div class="itemName" style="font-size:15px;">
											캣닢
										</div>
										<div class="itemPrice">
											10000원
										</div>
									</div> <!-- itemInfo끝 -->
								</div> <!-- postCardBox끝 -->
								<div class="postCardBox">
									<div class="postCardPic">
										<img src="<c:url value='/project_images/강아지 장난감.jfif'/>" class="img"/>
									</div>
									<div class="itemInfo">
										<div class="tradelocal">
											충남-택배
										</div>
										<div class="itemState">
											중고
										</div>
										<div class="itemName">
											강아지 장난감
										</div>
										<div class="itemPrice">
											8000원
										</div>
									</div> <!-- itemInfo끝 -->
								</div> <!-- postCardBox끝 -->
								<div class="postCardBox">
									<div class="postCardPic">
										<img src="<c:url value='/project_images/스크래처.jfif'/>" class="img"/>
									</div>
									<div class="itemInfo">
										<div class="tradelocal" style="font-size:10px;">
											강원도-택배
										</div>
										<div class="itemState">
											새 제품
										</div>
										<div class="itemName" style="font-size:12px;">
											스크래처
										</div>
										<div class="itemPrice">
											20000원
										</div>
									</div> <!-- itemInfo끝 -->
								</div> <!-- postCardBox끝 -->
								<div class="postCardBox">
									<div class="postCardPic">
										<img src="<c:url value='/project_images/사슴벌레 먹이.jfif'/>" class="img"/>
									</div>
									<div class="itemInfo">
										<div class="tradelocal">
											서울-택배
										</div>
										<div class="itemState">
											새 제품
										</div>
										<div class="itemName">
											사슴벌레 먹이
										</div>
										<div class="itemPrice">
											6000원
										</div>
									</div> <!-- itemInfo끝 -->
								</div> <!-- postCardBox끝 -->
								<div class="postCardBox">
									<div class="postCardPic">
										<img src="<c:url value='/project_images/페럿 집.jfif'/>" class="img"/>
									</div>
									<div class="itemInfo">
										<div class="tradelocal">
											경기-직접
										</div>
										<div class="itemState">
											중고
										</div>
										<div class="itemName" style="font-size:13px;">
											페럿 집
										</div>
										<div class="itemPrice">
											27000원
										</div>
									</div> <!-- itemInfo끝 -->
								</div> <!-- postCardBox끝 -->
								<div class="postCardBox">
									<div class="postCardPic">
										<img src="<c:url value='/project_images/토끼 사료.jfif'/>" class="img"/>
									</div>
									<div class="itemInfo">
										<div class="tradelocal">
											수원-택배
										</div>
										<div class="itemState">
											새 제품
										</div>
										<div class="itemName" style="font-size:12px;">
											토끼 사료
										</div>
										<div class="itemPrice">
											15000원
										</div>
									</div> <!-- itemInfo끝 -->
								</div> <!-- postCardBox끝 -->
								<div class="postCardBox">
									<div class="postCardPic">
										<img src="<c:url value='/project_images/앵무새 먹이.jfif'/>" class="img"/>
									</div>
									<div class="itemInfo">
										<div class="tradelocal">
											논산-택배
										</div>
										<div class="itemState">
											새 제품
										</div>
										<div class="itemName">
											앵무새 먹이
										</div>
										<div class="itemPrice">
											15000원
										</div>
									</div> <!-- itemInfo끝 -->
								</div> <!-- postCardBox끝 -->
							</div>	<!-- postBox끝  -->
							
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
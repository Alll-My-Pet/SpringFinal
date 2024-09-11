<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분양 홍보 게시판</title>
<link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/PetPromoteBoard.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/paging.css'/>" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/Board/paging.js'/>"></script>
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
							<div class="titleInfo">전체 커뮤니티</div>
							<span class="ctgTitle">분양 홍보 게시판</span>
							<p class="titleNotice">인가받은 업체나 브리더에 한해서만 게시글 업로드 가능합니다</p>
						</div>
						<div class="bracket">
							<img src="/image/index/bracket-light-right.svg" class="bRight"
								alt="..." style="height: 128px;">
						</div>
					</div>
					<!-- pageInfo 끝 -->
					
					<section class="promote">
						<!-- 공지 게시글 연동 필요 -->
						<div class="promoteNotice">
							<div class="promoteNotice-title">분양 시 주의 사항</div>
							<div class="promoteNotice-box">
								<table class="noticeTable">
									<thead>
										<tr>
											<th>글 제목</th>
											<th>작성자</th>
											<th>날짜</th>
										</tr>
									</thead>
									<tbody>
										<!-- tbody와 thead간의 공백 -->
										<tr>
											<td colspan="3"
												style="height: 3px; background-color: transparent;"></td>
										</tr>
										<%-- <c:forEach var="notice" items="${noticeList }">
											<tr>
												<td><a href="#">${notice.postTitle}</a></td>
												<td>${notice.memNickName}</td>
												<td><fmt:formatDate value="${notice.postDate}"
														pattern="M/dd HH:mm" /></td>
											</tr> --%>
											<tr>
												<td>[공지] 양서류/파충류 분양 시 주의사항입니다.(필독)</td>
												<td>관리자</td>
												<td>20xx.xx.xx</td>
											</tr>
											<tr>
												<td>[공지] 동물 가정분양은 무료로만 가능합니다.(필독)</td>
												<td>관리자</td>
												<td>20xx.xx.xx</td>
											</tr>
											<td colspan="3">
												<div class="separator"></div>
											</td>
										<%-- </c:forEach> --%>
									</tbody>
								</table>
							</div>
						</div>
						<!-- promoteNotice 끝 -->
						
						<!-- 검색 구역 -->
						<div class="promoteSearch">
							<h4 id="PSearchFont">동물별 검색</h4>
							<p id="ctgFont">분류</p>
							<form>
								<select class="promotePetCtg">
									<option value="9">전체</option>
									<option value="1">강아지</option>
									<option value="2">고양이</option>
									<option value="3">기타 포유류</option>
									<option value="4">파충류/양서류</option>
									<option value="5">어류</option>
									<option value="6">조류</option>
									<option value="7">설치류</option>
									<option value="8">절지류/곤충류</option>
								</select> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; 
								
								<input type="text" class="PSearchBar" placeholder="게시판 내 검색">
								<button class="promoteBoardSearchBtn">
									<img src="<c:url value='/pet_images/free-icon-search-interface-symbol-54481.png'/>" />
								</button>
							</form>
						</div>
						
						<!-- 작성 버튼 우상단 -->
						<button class="promoteBrdBtn">게시글 작성</button>
						
						<!-- 간단 설명있는 갤러리 형태 -->
						<div class="promotePicBox">
							<div class="promotePic">
								<div class="promoteFont"></div>
								<div class="promoteDescription">설명</div>
							</div>
							
							<div class="promotePic">
								<div class="promoteFont"></div>
								<div class="promoteDescription">설명</div>
							</div>
							
							<div class="promotePic">
								<div class="promoteFont"></div>
								<div class="promoteDescription">설명</div>
							</div>
							
							<div class="promotePic">
								<div class="promoteFont"></div>
								<div class="promoteDescription">설명</div>
							</div>
							
							<div class="promotePic">
								<div class="promoteFont"></div>
								<div class="promoteDescription">설명</div>
							</div>
							
							<div class="promotePic">
								<div class="promoteFont"></div>
								<div class="promoteDescription">설명</div>
							</div>
						</div>
					
					</section>
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
			<!-- frame-1끝 -->
			<br> <br>
			<!-- footer부착 -->
			<div id="footer">
				<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
			</div>
		</div>
	</body>
</html>
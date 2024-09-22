<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양육 게시판</title>
<link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/meet/meetBoard.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/paging.css'/>" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/Board/paging.js'/>"></script>
<script src="<c:url value='/js/animal/tipBoard.js'/>"></script>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=p8d8z1bubk&submodules=geocoder"></script>
<script src="<c:url value='/js/map/meetmap.js'/>"></script>
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
							<span class="ctgTitle"> 집사들 모임</span>
						</div>
						<div class="bracket">
							<img src="/image/index/bracket-light-right.svg" class="bRight"
								alt="..." style="height: 128px;">
						</div>
					</div>
					<!-- pageInfo 끝 -->
					<div class="board-contents">
						<div class="bestTip-box">
						    <table class="bestTip-table">
						        <colgroup>
						            <col style="width: 20%;">
						            <col style="width: 80%;">
						        </colgroup>
						        
						        <thead>
						            <tr>
						                <th colspan="2" class="post-title">소모임 필터링</th>
						            </tr>
						        </thead>
						        <tbody>
						            <tr>
						                <td colspan="2" class="post-title">내 주변 소모임 찾기</td>
						            </tr>
						            <tr>
						                <td class="post-title">지역별로 찾기</td>
						                <td>
						                    <select class="categorySelect" name="addressRegion" id="addressRegion"></select>
						                    <select name="addressDo" id="addressDo1"></select>
						                    <select name="addressSiGunGu" id="addressSiGunGu1"></select>
						                </td>
						            </tr>
						            <tr>
						                <td class="post-title">동물별로 찾기</td>
						                <td>
						                    <label for="petCtgNo">동물 종류:</label>
						                    <select id="petCtgNo" name="petCtgNo">
						                        <option value="">동물 카테고리</option>
						                        <option value="1">강아지</option>
						                        <option value="2">고양이</option>
						                        <option value="3">기타 포유류</option>
						                        <option value="4">파충류/양서류</option>
						                        <option value="5">어류</option>
						                        <option value="6">조류</option>
						                        <option value="7">설치류</option>
						                        <option value="8">절지류/곤충류</option>
						                    </select>
						                </td>
						            </tr>
						            <tr>
						                <td class="post-title">모임 형식</td>
						                <td>
						                    <input type="checkbox" name="meetType" value="online" id="online">온라인 &nbsp;&nbsp;
						                    <input type="checkbox" name="meetType" value="offline" id="offline">오프라인
						                </td>
						            </tr>
						        </tbody>
						    </table>
						    <button type="button" id="filterButton">필터링된 목록 보기</button>
							<button type="button" id="showAllButton" onclick="showAllMeets()">전체목록 보기</button>
						</div>
						<!-- bestTip-box끝 -->
						<div class="board-title">&nbsp;모임 목록</div>
						<div class="searchBar">
								<input type="text" id="searchKeyword" name="searchKeyword" placeholder="모임명 검색" value="${param.searchKeyword}" required />
								<button class="searchBtn">
									<img src="/image/search.png" alt="검색" />
								</button>
							
						</div>
						
						
						<div class="notice-box">
							<table class="notice-table">
								<colgroup>
							       <col style="width: 10%;">
							       <col style="width: 40%;">
							       <col style="width: 20%;">
							       <col style="width: 15%;">
							       <col style="width: 15%;">
							    </colgroup>
								<thead>
									<tr>
										<th class="post-view">구분</th>
										<th class="post-title">모임 이름</th>
										<th class="post-author">지역</th>
										<th class="post-view">온/오프</th>
										<th class="post-like">회원수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="meet" items="${meetList}">
						                <tr>
						                    <td id="category-${meet.petCtgNo}">
								              <c:choose>
								                  <c:when test="${meet.petCtgNo == 1}">강아지</c:when>
								                  <c:when test="${meet.petCtgNo == 2}">고양이</c:when>
								                  <c:when test="${meet.petCtgNo == 3}">기타 포유류</c:when>
								                  <c:when test="${meet.petCtgNo == 4}">파충류/양서류</c:when>
								                  <c:when test="${meet.petCtgNo == 5}">어류</c:when>
								                  <c:when test="${meet.petCtgNo == 6}">조류</c:when>
								                  <c:when test="${meet.petCtgNo == 7}">설치류</c:when>
								                  <c:when test="${meet.petCtgNo == 8}">절지류/곤충</c:when>
								                  <c:otherwise>Unknown Category</c:otherwise>
								              </c:choose>
								          </td>
						                    <td><a href="${pageContext.request.contextPath}/meetDetail?meetNo=${meet.meetNo}">${meet.meetName}</a></td>
						                    <td>${meet.addressDo} ${meet.addressSiGunGu}</td>
						                    <td>
									            <c:choose>
									                <c:when test="${meet.meetType}">오프라인</c:when>
									                <c:otherwise>온라인</c:otherwise>
									            </c:choose>
									        </td>
						                    <td>${meet.meetMember}</td>
						                </tr>
						            </c:forEach>
								</tbody>
							</table>
						</div>
						<!-- noticebox 끝 -->
						<div class="mainWriteBox">
							<!-- <button class="mainWriteBtn">글 작성</button> -->
							<!-- 로그인 한 경우  -->
							<c:if test="${not empty sessionScope.mid }">
								<button class="mainWriteBtn">
									<a href="<c:url value='/animal_home/${petCtgNo}/tipBoard_form'/>">글 작성</a>
								</button>
							</c:if>
							<%-- <button class="mainWriteBtn">
								<a href="<c:url value='/animal/bulletin_form'/>">글 작성</a>
							</button> --%>

							<!-- 로그인 하지 않은 경우-->
							<c:if test="${empty sessionScope.mid }">
								<button id="notLoginBtn" class="mainWriteBtn">글 작성</button>
							</c:if>
						</div>
						<br> <br> <br>
						<div class="bottom-box">
							<!-- 페이징 -->
							<div class="paging" style="text-align: center;">
							    <a onclick="javascript:goPage(1)">&lt;&lt;</a> 
							    <a onclick="javascript:goPage('${currentPage > 1 ? currentPage - 1 : 1}')">이전</a>
							
							    <c:forEach var="i" begin="1" end="${totalPages}">
							        <a onclick="javascript:goPage('${i}')" class="${i == currentPage ? 'current' : ''}">${i}</a>
							    </c:forEach>
							
							    <a onclick="javascript:goPage('${currentPage < totalPages ? currentPage + 1 : totalPages}')">다음</a> 
							    <a onclick="javascript:goPage('${totalPages}')">&gt;&gt;</a>
							</div>
							<form name="pageFrm">
								<input type="hidden" name="pageNo" value="${pageVo.pageNo }">
							</form>
							<br>
						</div>
					</div>
					<!-- board-contents끝 -->
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
	<!-- desktop-1 끝 -->
</body>
</html>
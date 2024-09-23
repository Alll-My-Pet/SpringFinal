<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물 보호 게시판</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/board/petProtect.css'/>" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/board/protectBoard.js'/>"></script>

<script>
	function goPage(no) {
		const frm = document.pageFrm;

		if (no == "prev") {
			no = frm.pageNo.value - 1;
			if (no <= 0)
				no = 1;
		} else if (no == "next") {
			no = parseInt(frm.pageNo.value) + 1;
		}

		frm.action = "/board/ProtectBoardList";
		frm.pageNo.value = no;
		frm.submit();
	}
</script>
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
					<br> <br>
					<div class="pageInfo">
						<div class="bracket">
							<img src="/image/index/bracket-light-left.svg" class="bLeft"
								alt="..." style="height: 128px;">
						</div>
						<div class="page-title">
							<!-- <div class="titleInfo">동물별 커뮤니티</div> -->
							<span class="ctgTitle">반려동물 보호 게시판</span>
						</div>
						<div class="bracket">
							<img src="/image/index/bracket-light-right.svg" class="bRight"
								alt="..." style="height: 128px;">
						</div>
					</div>
					<!-- pageInfo 끝 -->
					<div class="All">
						<section class="report">
							<div class="report-link">
								<!-- <h1 id="PPBoardFont">반려동물 보호 게시판</h1> -->
								<a href="<c:url value='/board/protectReport'/>"><button
										class="reportBtn">신고하기</button></a>
							</div>

							<div class="abandoned">
								<p id="reportFont">유기동물 신고</p>
								<c:forEach items="${ReportList}" var="report">
									<div class="abandonedPic">
										<a href="<c:url value='/board/ProtectDetailView/${report.postNo}'/>">
											<div class="abandonedFont">
												<%-- <c:if test="${not empty report.postImg}">
													<img class="post-image"
														src="<c:url value='/protect_images/${report.postImg}'/>"
														style="width: 147px; height: 150px;" />
												</c:if> --%>
												<img class="post-image"
												src="/image/protect/${report.postImg}"
												style="width: 147px; height: 150px;" />
											</div>
											<div class="description">
												종류:${report.lossPet }<br> 위치:${report.lossLocation }<br>
												제목:${report.postTitle }<br>
											</div>
										</a>
									</div>
								</c:forEach>
							</div>
							<!-- abandoned 끝 -->
						</section>
						<!-- report 끝 -->
						<form class="boardListForm" method="get"
							action="<c:url value='/board/ProtectSearch'/>">
							<select class="searchOption" id="type" name="type">
								<option value="AllList">전체 게시글</option>
								<option value="1">유기동물 봉사</option>
								<option value="2">봉사</option>
								<option value="3">캠페인</option>
								<option value="4">유기동물 신고</option>
							</select> <input type="text" class="searchBar" id="keyword" name="keyword"
								placeholder="게시판 내 검색">

							<button class="ProtectSearchBtn" type="submit">
								<img
									src="<c:url value='/project_images/free-icon-search-interface-symbol-54481.png'/>" />
							</button>
						</form>
						<section class="protect">
							<div class="ProtectBrd">
								<!-- <div class="protectBoard"> -->
								<table class="PttTable">
									<thead>
										<tr>
											<th>분류</th>
											<th>글 제목</th>
											<th>작성자</th>
											<th>날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ProtectList}" var="PBoard">
											<tr>
												<td><c:choose>
														<c:when test="${PBoard.headerNo == 1}">[유기동물 봉사]</c:when>
														<c:when test="${PBoard.headerNo == 2}">[봉사]</c:when>
														<c:when test="${PBoard.headerNo == 3}">[캠페인]</c:when>
														<c:when test="${PBoard.headerNo == 4}">
															<span class="header-text-red">[유기동물 신고]</span>
														</c:when>
													</c:choose></td>
												<td class="post-title"><a
													href="<c:url value='/board/ProtectDetailView/${PBoard.postNo}'/>">${PBoard.postTitle}</a></td>
												<td>${PBoard.memNickName}</td>
												<td><fmt:formatDate value="${PBoard.postDate}"
														pattern="yyyy-MM-dd" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- </div> -->
							</div>
							<!-- ProtectBrd끝 -->
						</section>
						<div class="mainWriteBox">
							<!-- <button class="mainWriteBtn">글 작성</button> -->
							<!-- 로그인 한 경우  -->
							<c:if test="${not empty sessionScope.mid }">
								<button class="protectWriteBtn">
									<a href="<c:url value='/board/protectWrite'/>">글 작성</a>
								</button>
							</c:if>

							<!-- 로그인 하지 않은 경우-->
							<c:if test="${empty sessionScope.mid }">
								<button id="notLoginBtn" class="protectWriteBtn">글 작성</button>
							</c:if>
						</div>
						<div class="paging" style="text-align: center;">
							<a onclick="javascript:goPage(1)">&lt;&lt;</a> <a
								onclick="javascript:goPage('prev')">이전</a>

							<c:forEach var="i" begin="${pageVo.startPage }"
								end="${pageVo.endPage }">
								<%-- <a onclick="javascript:goPage('${i}')">${i }</a> --%>
								<a onclick="javascript:goPage('${i}')"
									class="${i == pageVo.pageNo ? 'current' : ''}">${i}</a>
							</c:forEach>

							<a onclick="javascript:goPage('next')">다음</a> <a
								onclick="javascript:goPage('${pageVo.totalPage }')">
								&gt;&gt;</a>
						</div>

						<form name="pageFrm">
							<input type="hidden" name="pageNo" value="${pageVo.pageNo }">
						</form>
					</div>
				</div>
				<!-- contents끝 -->
			</div>
			<!-- frame-2끝  -->
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
	<!-- desktop-1끝 -->
</body>
</html>
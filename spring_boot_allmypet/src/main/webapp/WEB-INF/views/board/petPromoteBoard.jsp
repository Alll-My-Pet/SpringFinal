<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분양 홍보 게시판</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/board/petPromoteBoard.css'/>" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/board/promoteBoard.js'/>"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic&display=swap')
	;
</style>
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

		frm.action = "/board/PromoteBoardList";
		frm.pageNo.value = no;
		frm.submit();
	}
</script>
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

					<div class="pageInfo">
						<div class="page-title">
							<span class="ctgTitle">분양 홍보 게시판</span>
							<div class="titleInfo">인가받은 업체나 브리더에 한해서만 게시글 업로드 가능합니다</div>
						</div>
					</div>
					<!-- pageInfo 끝 -->
					<section class="promoteBoard">
						<div class="promoteNotice-box">
							<h3 style="margin-left: 2%;" class="promoteNotice-title">분양
								시 주의사항</h3>

							<div class="promoteNotice">

								<table class="noticeTable">
									<tr>
										<th>제목</th>
										<th>작성자</th>
										<th>날짜</th>
										<th>조회수</th>
										<th>좋아요</th>
									</tr>
									<c:forEach var="notice" items="${noticeList }">
										<a href="#">
											<tr>
												<td style="color: red;"><a href="#">${notice.postTitle}</a></td>
												<td>${notice.memNickName}</td>
												<td><fmt:formatDate value="${notice.postDate}"
														pattern="M/dd HH:mm" /></td>
												<td>${notice.postView}</td>
												<td>${notice.postLike}</td>
											</tr>
										</a>
									</c:forEach>
								</table>
							</div>
						</div>
						<!-- promoteNotice-box끝 -->

						<div class="promoteSearchBox">
							<h4 id="PSearchFont">동물별 검색</h4>
							<form id="promoteSearch" method="get"
								action="<c:url value='/board/promoteSearch'/>">

								<select class="petNameSearch" id="type" name="type"
									style="height: 30px;">
									<option value="petName">동물 이름</option>
									<option value="placeInfo">업체 명</option>
								</select> <input type="text" class="PSearchBar" id="keyword"
									name="keyword" placeholder="게시판 내 검색">

								<button class="promoteBoardSearchBtn">검색</button>
							</form>
						</div>
						<!-- promoteSearch 끝 -->


						<div class="petCtgBox">
							<select class="promotePetCtg" id="petCtgNo" name="petCtgNo">
								<option value="9">분류 선택</option>
								<option value="1">강아지</option>
								<option value="2">고양이</option>
								<option value="3">기타 포유류</option>
								<option value="4">파충류/양서류</option>
								<option value="5">어류</option>
								<option value="6">조류</option>
								<option value="7">설치류</option>
								<option value="8">절지류/곤충류</option>

							</select>
						</div>
						<!-- petCtgBox 끝 -->

						<div class="promoteBoardBox">
							<c:forEach var="promote" items="${Promote }">
								<div class="promotePic">
									<a
										href="<c:url value='/board/promoteDetailView/${promote.postNo}'/>">
										<div class="promoteFont">
											<%-- <c:if test="${not empty promote.postImg}">
												<img class="post-image"
													src="<c:url value='/promote/${promote.postImg}'/>"
													style="width: 147px; height: 150px;" />
											</c:if> --%>
											<img class="post-image"
												src="/image/promote/${promote.postImg}"
												style="width: 147px; height: 150px;" />
										</div>
										<div class="promoteDescription">
											분류:
											<c:choose>
												<c:when test="${promote.petCtgNo == 1}">강아지</c:when>
												<c:when test="${promote.petCtgNo == 2}">고양이</c:when>
												<c:when test="${promote.petCtgNo == 3}">기타 포유류</c:when>
												<c:when test="${promote.petCtgNo == 4}">파충류/양서류</c:when>
												<c:when test="${promote.petCtgNo == 5}">어류</c:when>
												<c:when test="${promote.petCtgNo == 6}">조류</c:when>
												<c:when test="${promote.petCtgNo == 7}">설치류</c:when>
												<c:when test="${promote.petCtgNo == 8}">절지류/곤충류</c:when>
											</c:choose>
											<br> 생물명: ${promote.petName }<br>
											분양처: ${promote.placeInfo }<br> 
											<%-- 분양 방법:
											<c:choose>
												<c:when test="${promote.parcelOutInfo == 'FTF' }">대면</c:when>
												<c:when test="${promote.parcelOutInfo == 'NFTF' }">비 대면</c:when>
											</c:choose> --%>
										</div>
									</a>
								</div>
							</c:forEach>

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

							<!-- 로그인 시 -->
							<c:if test="${not empty sessionScope.mid }">
								<button class="promoteBrdBtn">
									<a href="<c:url value='/board/promoteWrite'/>">글 작성</a>
								</button>
							</c:if>

							<!-- 로그인 하지 않은 경우-->
							<c:if test="${empty sessionScope.mid }">
								<button id="notLoginBtn" class="promoteBrdBtn">글 작성</button>
							</c:if>

						</div>
						<!-- promotePicBox 끝 -->
					</section>
					<!-- section끝 -->
				</div>
				<!-- contents끝 -->
			</div>
			<!-- frame-2 끝 -->
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
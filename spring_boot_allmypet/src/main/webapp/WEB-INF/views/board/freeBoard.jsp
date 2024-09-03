<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/freeBoard.css'/>" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/Board/freeBoard.js'/>"></script>
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

		frm.action = "/board/FreeBoardList";
		frm.pageNo.value = no;
		frm.submit();
	}
</script>

</head>
<body>
	<div class="desktop-1">
		<div class="frame-1">
			<div class="frame-2">
				<!-- header -->
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
							<span class="ctgTitle">자유 게시판</span>
						</div>
						<div class="bracket">
							<img src="/image/index/bracket-light-right.svg" class="bRight"
								alt="..." style="height: 128px;">
						</div>
					</div>
					<!-- pageInfo 끝 -->
					<section class="freeBoard">
						<form id="FBoardSearchBar">
							<select id="type" name="type">
								<option value="memId" selected>작성자</option>
								<option value="postTitle">글 제목</option>
								<option value="postTitleAndpostContent">제목 + 내용</option>
							</select> <input type="text" id="keyword" name="keyword"
								placeholder="게시판 내 검색" /> <label for="FBoardSearchBtn">
								<input type="submit" class="FBoardSearchBtn">
							</label>


						</form>
						<!-- form 끝 -->
						<div class="freeHotBoard">
							<h3
								style="margin-left: 2%; margin-top: 30px; position: absolute;">실시간
								인기글🔥</h3>
							<div class="post-list">
								<table class="freeHotTable">

									<tbody>

										<c:forEach items="${FreeHotTopics}" var="hot">
											<tr>
												<td><a
													href="<c:url value='/board/FreeDetailView/${hot.postNo}'/>">${hot.postTitle}</a></td>
												<td>${hot.memId}</td>
												<td><fmt:formatDate value="${hot.postDate}"
														pattern="yyyy-MM-dd" /></td>
												<td>${hot.postLike }</td>
												<td>${hot.postView }</td>
											</tr>
										</c:forEach>

									</tbody>

								</table>
							</div>

						</div>

						<table class="freeboardTB">

							<thead>
								<tr>
									<%-- <th>
										<form id="freeBoardCtg" name="freeBoardCtg" method="get" action="<c:url value='/board/listAllBoard'/>">
											<!-- <select id="FFilter2" name="boardCtgNo"
												style="height: 25px; margin-left: 30px;">
												<option value="0">구분</option>
												<option value="1">자유</option>
												<option value="2">분양홍보</option>
												<option value="3">반려동물 보호</option>
												<option value="4">소모임</option>
												<option value="5">중고거래</option>
												<option value="6">정보제공</option>
												<option value="7">QnA</option>
											</select> -->
										</form>
									</th> --%>

									<th scope="col" class="th-title">글 제목</th>
									<th scope="col" class="th-writer">작성자</th>
									<th scope="col" class="th-date">날짜</th>
									<th scope="col" class="th-view">조회</th>
									<th scope="col" class="th-good">추천</th>
								</tr>
							</thead>

							<tbody id="FreeboardList">
								<c:forEach var="free" items="${freeBoardList }">
									<tr>
										<td><a
											href="<c:url value='/board/FreeDetailView/${free.postNo}'/>" />${free.postTitle }</td>
										<td>${free.memNickName }</td>
										<td><fmt:formatDate value="${free.postDate }"
												pattern="YYYY-MM-dd" /></td>
										<td>${free.postView }</td>
										<td>${free.postLike }</td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
						<br> <br>

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


						<div class="mainWriteBox">
							<!-- <button class="mainWriteBtn">글 작성</button> -->
							<!-- 로그인 한 경우  -->
							<c:if test="${not empty sessionScope.mid }">
								<button class="mainWriteBtn">
									<a href="<c:url value='/Board/MainBoardText'/>">글 작성</a>
								</button>
							</c:if>


							<!-- 로그인 하지 않은 경우-->
							<c:if test="${empty sessionScope.mid }">
								<button id="notLoginBtn" class="mainWriteBtn">글 작성</button>
							</c:if>
						</div>

					</section>

				</div>
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
		<!-- frame-1 끝  -->
		<br> <br>
		<!-- footer부착 -->
		<div id="footer">
			<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 게시판</title>
<link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/MainBoard.css'/>" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/Board/MainBoard.js'/>"></script>
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

		frm.action = "/board/listAllBoard";
		frm.pageNo.value = no;
		frm.submit();
	}

	// 로그인 여부를 세션에서 가져오기
	/* var isLoggedIn = <c:out value="${not empty sessionScope.sid}"/>; */
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
							<div class="titleInfo">동물별 커뮤니티</div>
							<span class="ctgTitle">전체 게시판</span>
						</div>
						<div class="bracket">
							<img src="/image/index/bracket-light-right.svg" class="bRight"
								alt="..." style="height: 128px;">
						</div>
					</div>
					<!-- pageInfo 끝 -->
					<section class="MainBoard">
						<form id="BoardSearchBar">
							<select id="type" name="type">
								<option value="BWriter" selected>작성자</option>
								<option value="BTitle">글 제목</option>
								<option value="BPlus">제목 + 내용</option>
							</select> <input type="text" id="keyword" name="keyword"
								placeholder="게시판 내 검색" /> <label for="BoardSearchBtn">
								<input type="submit" class="BoardSearchBtn">
							</label>


						</form>
						<!-- form 끝 -->
						<div class="hotBoard">
							<h3 style="margin-left: 2%;">실시간 인기글</h3>
							<div class="post-list">
								<a href="게시판_상세.html" class="post">
									<div class="post-title">제목</div>
									<div class="post-author">닉네임</div> <!-- 시간 수정필요 -->
									<div class="post-date">2021-10-12</div>
								</a> <a href="게시판_상세.html" class="post">
									<div class="post-title">제목</div>
									<div class="post-author">닉네임</div> <!-- 시간 수정필요 -->
									<div class="post-date">2021-10-12</div>
								</a> <a href="게시판_상세.html" class="post">
									<div class="post-title">제목</div>
									<div class="post-author">닉네임</div> <!-- 시간 수정필요 -->
									<div class="post-date">2021-10-12</div>
								</a> <a href="게시판_상세.html" class="post">
									<div class="post-title">제목</div>
									<div class="post-author">닉네임</div> <!-- 시간 수정필요 -->
									<div class="post-date">2021-10-12</div>
								</a>
							</div>

						</div>

						<table class="boardTB">

							<thead>
								<tr>
									<th>
										<form>
											<select id="BFilter2">
												<option value="option1">구분</option>
												<option value="option2">구분2</option>
												<option value="option3">구분3</option>
												<option value="option4">구분4</option>

											</select>
										</form>
									</th>
									<th scope="col" class="th-title">글 제목</th>
									<th scope="col" class="th-writer">작성자</th>
									<th scope="col" class="th-date">날짜</th>
									<th scope="col" class="th-view">조회</th>
									<th scope="col" class="th-good">추천</th>
								</tr>
							</thead>

							<tbody id="boardList">
								<c:forEach var="board" items="${boardList }">
									<tr>
										<td>${board.postNo }</td>
										<td><a
											href="<c:url value='/board/detailViewBoard/${board.postNo}'/>" />${board.postTitle }</td>
										<td>${board.memId }</td>
										<td><fmt:formatDate value="${board.postDate }"
												pattern="YYYY-MM-dd" /></td>
										<td>${board.postView }</td>
										<td>${board.postLike }</td>
									</tr>
								</c:forEach>
								<!-- <tr>
									<td><a href="#">[공지사항] 커뮤니티 가이드 필독!</a></td>
									<td>관리자</td>
									<td>2017.07.13</td>
									<td>300</td>
									<td>100</td>
									<td>100</td>
								</tr>
								<tr>
									<td><a href="#">인기글1인기글1인기글1인기글1</a></td>
									<td>작성자1</td>
									<td>2017.07.13</td>
									<td>300</td>
									<td>100</td>
								</tr>
								<tr>
									<td><a href="#">인기글1인기글1인기글1인기글1</a></td>
									<td>작성자1</td>
									<td>2017.07.13</td>
									<td>300</td>
									<td>100</td>
								</tr>
								<tr>
									<td><a href="#">인기글1인기글1인기글1인기글1</a></td>
									<td>작성자1</td>
									<td>2017.07.13</td>
									<td>300</td>
									<td>100</td>
								</tr>
								<tr>
									<td><a href="#">인기글1인기글1인기글1인기글1</a></td>
									<td>작성자1</td>
									<td>2017.07.13</td>
									<td>300</td>
									<td>100</td>
								</tr>
								<tr>
									<td><a href="#">인기글1인기글1인기글1인기글1</a></td>
									<td>작성자1</td>
									<td>2017.07.13</td>
									<td>300</td>
									<td>100</td>
								</tr> -->
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
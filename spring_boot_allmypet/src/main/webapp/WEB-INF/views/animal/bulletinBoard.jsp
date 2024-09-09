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
	href="<c:url value='/css/animal/bulletinBoard.css'/>" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/animal/bulletinBoard.js'/>"></script>
<script>
	/* function goPage(no) {
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

	document.addEventListener('DOMContentLoaded', function() {
		var selectElement = document.getElementById('BFilter2');

		// 버튼 클릭처럼 폼을 제출
		selectElement.addEventListener('change', function() {
			var form = document.getElementById('BoardSearchBar');
			if (form) {
				form.submit();
			} else {
				console.error('Form not found');
			}
		});
	}); */
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
							<div class="titleInfo">동물별 커뮤니티: ${petCtgName}</div>
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
								<option value="memId" selected>작성자</option>
								<option value="postTitle">글 제목</option>
								<option value="postTitleAndpostContent">제목 + 내용</option>
							</select> <input type="text" id="keyword" name="keyword"
								placeholder="게시판 내 검색" /> <label for="BoardSearchBtn">
								<input type="submit" class="BoardSearchBtn">
							</label>


						</form>
						<!-- form 끝 -->
						<div class="hotBoard">
							<h3
								style="margin-left: 2%; margin-top: 30px; position: absolute;">실시간
								인기글🔥</h3>
							<div class="post-list">
								<table class="hotTable">
									<!-- <thead>
							  <tr>
							  <th>제목</th>
							  <th>작성자</th>
							  <th>작성일</th>
							  <th>좋아요</th>
							  <th>조회수</th>
							  
							  </tr>
							  </thead> -->

									<tbody>
										<c:forEach items="${hotList}" var="hot">
											<tr>
												<td><a
													href="<c:url value='/bulletin/detailViewBoard/${hot.postNo}'/>">${hot.postTitle}</a></td>
												<td>${hot.memNickName}</td>
												<td><fmt:formatDate value="${hot.postDate}"
														pattern="M/dd HH:mm" /></td>
												<td>${hot.postView }</td>
												<td>${hot.postLike }</td>
											</tr>
										</c:forEach>

									</tbody>

								</table>
							</div>
							<!-- post-list 끝 -->
						</div>
						<!-- hotBoard 끝 -->

						<table class="boardTB">

							<thead>
								<tr>
									<th scope="col" class="th-filter">
										<form id="boardCtg" name="boardCtg">
											<input type="hidden" id="petCtgNo" name="petCtgNo"
												value="${petCtgNo}" /> <input type="hidden"
												name="isFiltered" value="true" /> <select id="BFilter2"
												name="boardCtgNo" style="height: 25px;">

												<option value="">구분</option>
												<option value="1">공지</option>
												<option value="2">자유</option>
												<option value="3">QnA</option>
												<option value="4">리뷰</option>
											</select>
										</form>
									</th>

									<th scope="col" class="th-title">글 제목</th>
									<th scope="col" class="th-author">작성자</th>
									<th scope="col" class="th-date">날짜</th>
									<th scope="col" class="th-view">조회</th>
									<th scope="col" class="th-like">추천</th>
								</tr>
							</thead>
						</table>
						<div id="filtering_result_box">
							<!-- 필터링 결과 박스 -->
							<table class="boardTB">
								<tbody id="boardList">
									<c:forEach var="bulletin" items="${bulletinList }">
										<tr>
											<td class="headerName">[${bulletin.headerName }]</td>
											<td><a href="<c:url value='/bulletin/detailViewBoard/${bulletin.postNo}'/>" />${bulletin.postTitle }</td>
											<td>${bulletin.memNickName }</td>
											<td><fmt:formatDate value="${bulletin.postDate }"
													pattern="M/dd HH:mm" /></td>
											<td>${bulletin.postView }</td>
											<td>${bulletin.postLike }</td>
										</tr>
									</c:forEach>

								</tbody>

							</table>
						</div>
						<!--  필터링 결과 박스 -->

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
									<a href="<c:url value='/animal/bulletin_form'/>">글 작성</a>
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
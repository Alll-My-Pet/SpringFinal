<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 게시판</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/MainBoard.css'/>" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/Board/MainBoard.js'/>"></script>
</head>
<body>
	<div class="All">

		<section class="MainBoard">
			<!-- header -->
			<div id="header">
				<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
			</div>
			<h1 id="MainFont">전체 게시판</h1>


			<form id="BoardSearchBar">
				<select id="type" name="type">
					<option value="BWriter" selected>작성자</option>
					<option value="BTitle">글 제목</option>
					<option value="BPlus">제목 + 내용</option>
				</select> <input type="text" id="keyword" name="keyword"
					placeholder="게시판 내 검색" /> <label for="BoardSearchBtn"> <input
					type="submit" class="BoardSearchBtn">
				</label>


			</form>
			<!-- form 끝 -->


			<div class="hotBoard">
				<h3 style="margin-left: 2%;">실시간 인기글</h3>
				<div class="hot1">
					<p style="text-indent: 30px;">제목1</p>
					<p style="text-indent: 500px;">닉네임</p>
					<p style="text-indent: 50px;">2021-10-12</p>
				</div>
				<div class="hot2">
					<p style="text-indent: 30px;">제목1</p>
					<p style="text-indent: 500px;">닉네임</p>
					<p style="text-indent: 50px;">2021-10-12</p>
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
				</tbody>
			</table>
			<br>
			<br>

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
					onclick="javascript:goPage('${pageVo.totalPage }')"> &gt;&gt;</a>
			</div>
			<form name="pageFrm">
				<input type="hidden" name="pageNo" value="${pageVo.pageNo }">
			</form>
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
			</script>

		</section>



		<!-- <section class="page">
          <ul class="page-list">
            <li>
            <button class="preButton"><</button>
            </li>
            <li><a href="#">1</a></li> 
            <li>
            <button class="nextButton">></button>
            </li>
          </ul>
        </section> -->



		<div id="floatingBtn">
			<c:import url="/WEB-INF/views/layout/floating_btn.jsp"></c:import>
		</div>
		<!-- sidebar 부착 -->
		<div id="sidebar">
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
		</div>

		<div id="footer" >
			<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
		</div>



	</div>
	<!-- all끝 -->

</body>
</html>
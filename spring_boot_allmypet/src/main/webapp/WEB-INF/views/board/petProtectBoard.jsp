<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물 보호 게시판</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/PetProtect.css'/>" />
	
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
</head>
<body>
	<div class="All">
		<!-- header -->
		<div id="header">
			<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
		</div>
		<section class="protect">

			<div class="MainFont">
				<h1 id="PPBoardFont">반려동물 보호 게시판</h1>
				<button class="reportBtn">신고하기</button>
			</div>

			<div class="abandoned">
				<p id="reportFont">유기동물 신고</p>
				<div class="abandonedPic">
					<div class="abandonedFont"></div>
					<div class="description">설명</div>
				</div>
				<div class="abandonedPic">
					<div class="abandonedFont"></div>
					<div class="description">설명</div>
				</div>
				<div class="abandonedPic">
					<div class="abandonedFont"></div>
					<div class="description">설명</div>
				</div>
				<div class="abandonedPic">
					<div class="abandonedFont"></div>
					<div class="description">설명</div>
				</div>


			</div>
			<!-- abandoned 끝 -->


			<div class="ProtectBrd">

				<form class="boardListForm">
					<select class="searchOption">
						<option value="AllList">전체 게시글</option>
						<option value="option1">옵션1</option>
						<option value="option2">옵션2</option>
					</select> 
					<input type="text" class="searchBar" placeholder="게시판 내 검색">

					<button class="ProtectSearchBtn">
						<img src="<c:url value='/project_images/free-icon-search-interface-symbol-54481.png'/>" />
					</button>
				</form>


				<table class="PttTable">
					<tbody>
						<c:forEach items="${ProtectList}" var="PBoard">
							<tr>
								<td><a href="<c:url value='/board/detailViewBoard/${PBoard.postNo}'/>">${PBoard.postTitle}</a></td>
								<td>${PBoard.memId}</td>
								<td><fmt:formatDate value="${PBoard.postDate}" pattern="yyyy-MM-dd" /></td>
								<td>${PBoard.postLike }</td>
								<td>${PBoard.postView }</td>
							</tr>
						</c:forEach>
						</tbody>
				</table>


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
								<button class="protectWriteBtn">
									<a href="<c:url value='/Board/MainBoardText'/>">글 작성</a>
								</button>
							</c:if>


							<!-- 로그인 하지 않은 경우-->
							<c:if test="${empty sessionScope.mid }">
								<button id="notLoginBtn" class="protectWriteBtn">글 작성</button>
							</c:if>
						</div>

			</div> <!-- ProtectBrd끝 -->


		</section>
		<div id="floatingBtn">
			<c:import url="/WEB-INF/views/layout/floating_btn.jsp"></c:import>
		</div>
		
		<!-- sidebar 부착 -->
		<div id="sidebar">
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
		</div>
		
		<!-- footer부착 -->
		<div id="footer">
			<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
		</div>
		
		</div>
</body>
</html>
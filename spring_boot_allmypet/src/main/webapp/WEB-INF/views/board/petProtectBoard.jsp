<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물 보호 게시판</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/Board/PetProtect.css'/>" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/Board/protectBoard.js'/>"></script>
	
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
	
		<section class="report">
				<div class="MainFont">
					<h1 id="PPBoardFont">반려동물 보호 게시판</h1>
					<a href="<c:url value='/board/protectReport'/>"><button class="reportBtn">신고하기</button></a>
				</div>
	
				<div class="abandoned">
					<p id="reportFont">유기동물 신고</p>
					
					<c:forEach items="${ReportList}" var="report">
					<a href="<c:url value='/board/ProtectDetailView/${report.postNo}'/>">
						<div class="abandonedPic">
							<div class="abandonedFont">
								<c:if test="${not empty report.postImg}">
									<img class="post-image"
										src="<c:url value='/protect_images/${report.postImg}'/>"
										style="width:147px; height:150px;" />
								</c:if>
							</div>
							<div class="description">
								종류:${report.lossPet }<br>
								위치:${report.lossLocation }<br>
								제목:${report.postTitle }<br>
							</div>
						</div>
					</a>
					</c:forEach>
	
	
				</div>
				<!-- abandoned 끝 -->
		</section>
		<section class="protect">
			<div class="ProtectBrd">

				<form class="boardListForm"  method="get" action="<c:url value='/board/ProtectSearch'/>">
					<select class="searchOption" id="type" name="type">
						<option value="AllList">전체 게시글</option>
						<option value="1">유기동물 봉사</option>
						<option value="2">봉사</option>
						<option value="3">캠페인</option>
						<option value="4">유기동물 신고</option>
					</select> 
					<input type="text" class="searchBar"id="keyword" name="keyword" placeholder="게시판 내 검색">

					<button class="ProtectSearchBtn" type="submit">
						<img src="<c:url value='/project_images/free-icon-search-interface-symbol-54481.png'/>" />
					</button>
				</form>

			<div class="protectBoard">
				<table class="PttTable">
					<tbody>
						<c:forEach items="${ProtectList}" var="PBoard">
							<tr>
								<td>
									<c:choose>
										<c:when test="${PBoard.headerNo == 1}">[유기동물 봉사]</c:when>
										<c:when test="${PBoard.headerNo == 2}">[봉사]</c:when>
										<c:when test="${PBoard.headerNo == 3}">[캠페인]</c:when>
										<c:when test="${PBoard.headerNo == 4}">
											<span class="header-text-red">[유기동물 신고]</span>
										</c:when>
									</c:choose>
								</td>
								<td><a href="<c:url value='/board/ProtectDetailView/${PBoard.postNo}'/>">${PBoard.postTitle}</a></td>
								<td>${PBoard.memId}</td>
								<td><fmt:formatDate value="${PBoard.postDate}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
						</tbody>
				</table>
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
		
									<a onclick="javascript:goPage('next')">다음</a> 
									<a onclick="javascript:goPage('${pageVo.totalPage }')">
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
									<a href="<c:url value='/board/protectWrite'/>">글 작성</a>
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
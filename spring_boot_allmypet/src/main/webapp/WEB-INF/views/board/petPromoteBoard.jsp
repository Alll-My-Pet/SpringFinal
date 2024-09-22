<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분양 홍보 게시판</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/board/petPromoteBoard.css'/>" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/Board/promoteBoard.js'/>"></script>

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
	<div class="All">
		<section class="promoteBoard">
			<div id="header">
				<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
			</div>
			<div class="promoteHeader">


				<h1 id="titleFont" style="margin-left:50px;">분양 홍보 게시판</h1>
				<p id="titleFont2" style="color: gray; margin-left:50px;">인가받은 업체나 브리더에 한해서만 게시글
					업로드 가능합니다</p>

				<div class="promoteNotice-box">
					<h3 style="margin-left: 2%;" class="promoteNotice-title">분양 시 주의사항</h3>
					<c:forEach var="notice" items="${noticeList }" >
						<div class="promoteNotice">
							
							<table class="noticeTable">
									<tr>
										<th>제목</th>
										<th>작성자</th>
										<th>날짜</th>
										<th>조회수</th>
										<th>좋아요</th>
									</tr>
							
								<a href="#">
									<tr>
										<td style="color: red;" ><a href="#">${notice.postTitle}</a></td>
										<td>${notice.memNickName}</td>
										<td><fmt:formatDate value="${notice.postDate}"
												pattern="M/dd HH:mm" /></td>
										<td>${notice.postView}</td>
										<td>${notice.postLike}</td>
									</tr>
								</a>
							</table>
						</div>
					</c:forEach>
				</div>

				<div class="promoteSearchBox">
					<h4 id="PSearchFont">동물별 검색</h4>
					<form id="promoteSearch" method="get" action="<c:url value='/board/promoteSearch'/>">
					
						<select class="petNameSearch" id="type" name="type" style="height:30px;">
							<option value="petName">동물 이름</option>
							<option value="placeInfo">업체 명</option>
						</select>
						
						<input type="text" class="PSearchBar" id="keyword" name="keyword" placeholder="게시판 내 검색">
						
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
						<a href="<c:url value='/board/promoteDetailView/${promote.postNo}'/>">
							<div class="promotePic">
								<div class="promoteFont">
									<c:if test="${not empty promote.postImg}">
										<img class="post-image"
											src="<c:url value='/protect_images/${promote.postImg}'/>"
											style="width: 147px; height: 150px;" />
									</c:if>
								</div>
								<div class="promoteDescription">
									분류:${promote.petCtgNo }<br> 
									생물명:${promote.petName }<br>
									분양처:${promote.placeInfo }<br> 
									분양 방법:${promote.parcelOutInfo }
								</div>
							</div>
						</a>
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
							onclick="javascript:goPage('${pageVo.totalPage }')"> &gt;&gt;</a>
					</div>
					<form name="pageFrm">
						<input type="hidden" name="pageNo" value="${pageVo.pageNo }">
					</form>

				</div>
				<!-- promotePicBox 끝 -->

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
		</section>
	</div>
	
		<div id="footer">
			<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
		</div>
</body>
</html>
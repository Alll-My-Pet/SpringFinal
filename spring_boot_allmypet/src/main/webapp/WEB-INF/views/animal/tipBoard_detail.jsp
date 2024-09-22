<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="java.util.Base64"%>
<%@ page
	import="com.spring_boot_allmypet.project.model.animal.MyTipBoardVO"%>
<%@ page import="java.util.Arrays"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/animal/bulletin_detail.css' />" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/animal/bulletin_detail.js'/>"></script>
<script>
	const postNo = ${board.postNo}; // 게시글 번호  
    function openModal(src) {
        console.log(src); // src 경로 확인
        const modalImage = document.getElementById("modalImage");
        modalImage.src = src;
        modalImage.classList.add("large"); // 크기 조절 클래스 추가
        document.getElementById("myModal").style.display = "flex"; // 모달 창 열기
    }

    function closeModal() {
        const modalImage = document.getElementById("modalImage");
        modalImage.classList.remove("large"); // 크기 조절 클래스 제거
        document.getElementById("myModal").style.display = "none"; // 모달 창 닫기
    }
</script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic&display=swap');
</style>
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
					<div class="pageInfo">
						<div class="page-title">
							<div class="titleInfo">동물별 커뮤니티: ${petCtgName}</div>
							<span class="ctgTitle">양육 팁 게시판💡</span>
						</div>
					</div>
					<!-- pageInfo 끝 -->
					<section class="mainText">
						<div class="postBox">
							<div class="post-info">
								<div class="detailTitle">
									<label for="detailTitle">&nbsp;제목:</label>&nbsp;<span
										id="bodTitle">${board.postTitle}</span>
								</div>
								<div class="authorBox">
									<label for="detailTitle">&nbsp;작성자:</label>&nbsp;<span
										class="author">${board.memNickName}</span> <span
										class="divider">|</span> <img src="/image/board/view_gray.svg"
										alt="조회수" class="view-icon"><span id="bodView">&nbsp;${board.postView}</span>
								</div>
							</div>
							<div class="postContent">
								<pre id="bodText">${board.postContent}</pre>
							</div>


							<!-- 이미지 처리 -->
							<%-- <div class="photoBox">
								<label for="detailTitle">&nbsp;업로드한 사진: </label> <img
									src="<c:url value='/displayImage?postNo=${board.postNo}'/>">
							</div> --%>

							<div class="photoBox">
								<!-- <label for="detailTitle">&nbsp;업로드한 사진: </label> -->
								<%
								MyTipBoardVO board = (MyTipBoardVO) request.getAttribute("board");
								byte[] imageBytes = board.getPostImgBytes();
								String imageType = "image/jpeg"; // 기본값 설정

								if (imageBytes != null && imageBytes.length > 0) {
									byte[] header = Arrays.copyOf(imageBytes, 4);

									// 이미지 포맷 확인
									if (header[0] == (byte) 0x89 && header[1] == (byte) 0x50) {
										imageType = "image/png"; // PNG
									} else if (header[0] == (byte) 0xFF && header[1] == (byte) 0xD8) {
										imageType = "image/jpeg"; // JPEG
									} else {
										// 기타 포맷 처리 필요 시 추가
										imageType = "image/jpeg"; // 기본값으로 설정
									}

									// Base64 인코딩
									String base64Image = Base64.getEncoder().encodeToString(imageBytes);
								%>
								<!-- 이미지 썸네일 -->
								<img src="data:<%=imageType%>;base64,<%=base64Image%>"
									alt="이미지 없음" 
									id="thumbnail" onclick="openModal(this.src)"
									onerror="this.onerror=null; this.src='/image/board/no-image.svg';"/>

								<!-- 모달 창 -->
								<div id="myModal" class="modal" onclick="closeModal()">
									<span class="close" onclick="closeModal()">&times;</span> <img
										class="modal-content" id="modalImage">
								</div>


								<%
								} else {
								%>
								<p>이미지가 없습니다.</p>
								<%
								}
								%>
							</div>


							<div class="reactionBox">
								<!-- 로그인 후 -->
								<c:if test="${not empty sessionScope.mid }">
									<div class="like" id="likeButton">
										<img src="/image/board/like-default.svg" alt="좋아요"
											class="like-icon"> <span id="bodlike">${board.postLike}</span>
									</div>

									<div class="bookmark" id="bookmarkButton">
										<img src="/image/board/bookmark-default.svg" alt="북마크"
											class="bookmark-icon">
									</div>
								</c:if>
								<!-- 로그인 하기 전 -->
								<c:if test="${empty sessionScope.mid }">
									<div class="like" id="notLoginLike">
										<img src="/image/board/like-default.svg" alt="좋아요"
											class="like-icon"> <span id="bodlike">${board.postLike}</span>
									</div>

									<div class="bookmark" id="notLoginBook">
										<img src="/image/board/bookmark-default.svg" alt="북마크"
											class="bookmark-icon">
									</div>
								</c:if>
							</div>

							<div class="comments">
								<label for="comments">&nbsp;댓글</label>
								<form id="commentsWriteFrm" method="POST" action="/">
									<textarea class="commentWriteArea" name="commentText" placeholder="댓글을 입력해주세요"></textarea>
								</form>
								<!-- 댓글 등록 버튼 -->
								<button type="submit" class="comUploadBtn">등록</button>
							</div>

						</div>
						<!-- postBox 끝 -->
					</section>

				</div>
				<!-- contents 끝 -->
			</div>
			<!-- frame-2 끝 -->
			<!-- sidebar 부착 -->
			<div id="sidebar">
				<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			</div>
		</div>
		<!-- frame-1 끝 -->
		<br> <br>
		<!-- footer부착 -->
		<div id="footer">
			<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
		</div>
	</div>
	<!-- desktop-1끝 -->
</body>
</html>
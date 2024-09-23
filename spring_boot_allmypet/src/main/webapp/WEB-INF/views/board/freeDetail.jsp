<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/board/freeDetail.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic&display=swap')
	;
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
							<span class="ctgTitle">자유게시판</span>
						</div>
					</div>
					<!-- pageInfo 끝 -->

					<div class="postBox">

						<div class="post-info">
							<div class="detailTitle">
								<label for="detailTitle">&nbsp;제목:</label>&nbsp;<span
									id="bodTitle">${Fboard.postTitle}</span>
							</div>
							<div class="authorBox">
								<label for="detailTitle">&nbsp;작성자:</label>&nbsp;<span
									class="author">${Fboard.memId}</span> <span class="divider">|</span>
								<img src="/image/board/view_gray.svg" alt="조회수"
									class="view-icon"><span id="bodView">&nbsp;${Fboard.postView}</span>
							</div>
						</div>



						<section class="postText">
							<div class="TextBox">${Fboard.postContent}</div>
						</section>


						<section class="likeAndBookmark">
							<div class="likeAndBookmarkBox">
								<form class="likeFrm">
									<button class="freeLikeBtn">
										<img src="/image/board/like-default.svg" alt="좋아요"
											class="like-icon">
									</button>
									<button class="FreeBookmarkBtn">
										<img src="/image/board/bookmark-default.svg" alt="북마크"
											class="bookmark-icon">
									</button>
								</form>
							</div>
						</section>

						<section class="comments">
							<div class="commentsBox">
								<%-- ${Fboard.comment} --%>
								<label for="comments">&nbsp;댓글</label>


								<form class="commentsWriteFrm">
									<textarea class="commentWriteArea" name="commentText"
										placeholder="${Fboard.memId}:"></textarea>
								</form>

								<!-- 댓글 등록 버튼 -->
								<button type="submit" class="freeUploadBtn">등록</button>
							</div>
						</section>
					</div>


				</div>

			</div>
			<!-- frame-2 끝 -->
			<div id="floatingBtn">
				<c:import url="/WEB-INF/views/layout/floating_btn.jsp"></c:import>
			</div>
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
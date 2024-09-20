<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성 페이지</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/mainBoardText.css' />" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/Board/mainBoardText.js'/>"></script>
<style>
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
					<section class="writeTextArea">
						
						<div class="pageInfo">
							<div class="bracket">
								<img src="/image/index/bracket-light-left.svg" class="bLeft"
									alt="..." style="height: 128px;">
							</div>
							<div class="page-title">
								<div class="titleInfo">자유게시판</div>
								<span class="ctgTitle">게시글 작성</span>
							</div>
							<div class="bracket">
								<img src="/image/index/bracket-light-right.svg" class="bRight"
									alt="..." style="height: 128px;">
							</div>
						</div>
						<!-- pageInfo 끝 -->

						<form id="mainSubmitFrm" method="post"
							action="<c:url value='/insertBoard'/>">
							<div class="writeBox">
								<div class="postInfo-box">
									<div class="post-info">
										<!-- 작성자 필드 -->
										<div class="author">
											작성자:<input type="text" name="memid" value=" ${userId }"
												readonly style="width: 100px;">
										</div>
										<!-- select 필드 -->
										<input type="hidden" id="petCtgNo" name="petCtgNo" value="${petCtgNo}" />
										<!-- <select class="headerNoFilter" name="headerNo" id="headerNo">
											<option value="0">머리글 선택</option>
											<option value="2">자유</option>
											<option value="3">QnA</option>
											<option value="4">리뷰</option>
										</select> -->
										<div class="beforePost">
											<span>
												* 음란물, 분란, 혐오를 유발하는 게시글은 관리자에 의해 <br><strong>삭제</strong> 조치됩니다.<br>
												* 저작권자의 허락 없이 저작물을 이용하거나 타인의 명예를 훼손하는 콘텐츠를 게시하는 경우 법적 제재를 받을 수 있습니다.
											</span>
										</div>
									</div>
									<!-- post-info끝 -->
									<!-- 이미지 업로드 -->
									<div class="mainPhotoBox">
										
										<label for="fileUpload"> <%-- <img class="uploadImg"
											src="<c:url value='/project_images/free-icon-photo-2984403.png'/>" /> --%>
											<img class="uploadImg"
											src="<c:url value='/image/board/image-upload.svg'/>" />
										</label>
										<span>이미지 업로드</span>
										<div class="fileUpload">
											<input type="file" class="fileUpload" id="fileUpload"
												name="postImg" multiple>
										</div>
										
									</div>
								</div>
								<!-- postInfo-box 끝 -->


								<!-- 제목 입력 필드 -->
								<div class="mainDetailTitleBox">
									<input type="text" class="MainDetailTitle" id="postTitle"
										name="postTitle" placeholder="글 제목">
								</div>


								<!-- 내용 입력 필드 -->
								<div class="mainDetailBodyBox">
									<textarea class="mainDetailBody" id="postContent"
										name="postContent" placeholder="글 내용"></textarea>
								</div>

								<!-- 작성 버튼 -->
								<button type="submit" class="uploadBtn">작성하기</button>

							</div>
							<!-- writeBox 끝 -->

						</form>
						<!-- frm끝 -->
					</section>
				</div>
				<!-- contents끝 -->
			</div>
			<!-- frame-2끝 -->
			<div id="floatingBtn">
				<c:import url="/WEB-INF/views/layout/floating_btn.jsp"></c:import>
			</div>
			<!-- sidebar 부착 -->
			<div id="sidebar">
				<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			</div>
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
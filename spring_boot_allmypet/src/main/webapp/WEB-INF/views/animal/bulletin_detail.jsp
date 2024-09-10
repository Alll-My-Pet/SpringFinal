<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
							<span class="ctgTitle">전체 게시판</span>
						</div>
					</div>
					<!-- pageInfo 끝 -->
					<section class="mainText">
						<div class="postBox">
							<div class="post-info">
								<div class="detailTitle">
									<label for="detailTitle">&nbsp;제목:</label>&nbsp;<span
										id="bodTitle"> [${board.headerName}] ${board.postTitle}</span>
								</div>
								<div class="authorBox">
									<label for="detailTitle">&nbsp;작성자:</label>&nbsp;<span
										class="author">${board.memNickName}</span>
								</div>
							</div>
							<div class="postContent">
								<pre id="bodText">${board.postContent}</pre>
							</div>
							<div class="photoBox">
								<label for="detailTitle">&nbsp;업로드한 사진: 1장</label>
								<img src="<c:url value='${board.postImg}'/>">
							</div>


							<%-- <div class="like">
								<label for="like">추천수:</label> <span id="bodlike">${board.postLike}</span>
							</div>
							
							<div class="bookmark">
								
							</div>
							
							<div class="comments">
								<span id="bodComments">${board.memId}</span>
							</div> --%>

						</div>
						<!-- postBox 끝 -->
					</section>

				</div>
				<!-- contents 끝 -->
			</div>
			<!-- frame-2 끝 -->
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
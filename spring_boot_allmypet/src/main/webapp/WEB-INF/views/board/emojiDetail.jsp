<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이모지 게시판</title>
<link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/emojiDetail.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/comment/comment.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/paging.css'/>">
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/board/emojiDetail.js'/> "></script>
<script src="<c:url value='/js/comment/comment.js'/> "></script>
<script src="<c:url value='/js/comment/emoji_modal.js'/> "></script>

</head>
<body>
	<div class="desktop-1">
		<!-- 중앙 전체 프레임 -->
		<div class="frame-1">
			<div class="frame-2">
				<!-- header 위치 부착 -->
				<div id="header">
					<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
				</div>
				<div class="contents">
					<br> <br>
	         		
	         		<section class="emojiDetail">
	         			<div class="emoUp">
			        		<div class="emoView">
			        			${emoji.emoImg}
			        		</div>
			        		<div class="emoInfo">
			        			${emoji.emoName}<br>
			        			${emoji.memNickName}<br>
			        			${emoji.emoDate}<br>
			        			${emoji_purchase.useCount}
			        		</div>
			        	</div>
			        	<div class="emoCenter">
			        		<div class="emojiDescription">
			        			${emoji.emoContent}
			        		</div>
			        	</div>
			        	<div class="emoBottom">
			        		<div class="emojiPurchase">
			        			<button type="submit" class="emoPurchaseBtn" id="emoPurchaseBtn" name="emoPurchaseBtn">구매하기(100pt)</button>
			        		</div>
			        		<div class="bookmark">
			        			
			        		</div>
			        	</div>
		        	</section>
		        	
	        		<div class="comments-section">
							<!-- 댓글 작성 폼 -->
							<h3>댓글 작성</h3>
							<form id="comment-form" method="post" action="/comment/insert">
								<input type="hidden" name="postNo" value="${gall.postNo}" /> 
								<input type="hidden" name="boardCtgNo" value="${gall.petCtgNo}" /> 
								<input type="hidden" id="selectedEmoji" name="emojiImg" value="" />

								<!-- 이모지 선택 버튼 -->
								<button type="button" class="custom-btn btn-1" id="open-emoji-modal">이모지 추가</button>

								<!-- 선택된 이모지를 보여주는 영역 -->
								<div id="selected-emoji">
									<img id="selectedEmojiImg" src="" alt=""
										style="width: 50px; height: 50px; display: none;" />
								</div>

								<textarea class="commentText" name="commentText"
									placeholder="댓글을 입력하세요" required></textarea>
								<button class="comUploadBtn" type="submit">등록</button>
							</form><br><br>
							<!-- comment-form 끝 -->
							<h3>댓글 [${post.comments.size()}]</h3>

							<!-- 댓글 리스트 출력 -->
							<c:forEach var="comment" items="${post.comments}">
								<div class="comment-item">
									<div class="comment-info">
										<span class="comment-author">${comment.memId}</span> 
										<span class="comment-date">${comment.commentDate}</span>
									</div><br>
								<div class="comment-text">
									<p>${comment.commentText}</p>
								</div>
								<div class="comment-actions">
									<!-- 공감 버튼 -->
									<button class="like-button"
										data-comment-id="${comment.commentId}"
										data-post-no="${post.postNo}">좋아요
										(${comment.commentlike})</button>

									<!-- 댓글 삭제 버튼 (자기 댓글일 경우에만 표시) -->
									<c:if test="${comment.memId == sessionScope.mid}">
										<button class="delete-button"
											data-comment-id="${comment.commentId}"
											data-post-no="${post.postNo}">삭제</button>
									</c:if>
								</div>
							</div>
						</c:forEach>

					</div>
					<!-- comments-section끝 -->
   				</div>
				<!-- contents 끝 -->
			</div>
			<!-- frame-2 끝 -->
		</div>
		<!-- frame-1 끝 -->
		<br> <br>
		<!-- footer부착 -->
		<div id="floatingBtn">
			<c:import url="/WEB-INF/views/layout/floating_btn.jsp"></c:import>
		</div>
		<!-- sidebar 부착 -->
		<div id="sidebar">
			<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
		</div>
		<div id="footer">
		<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
		</div>
	</div>
	<!-- desktop-1 끝 -->
</body>
</html>
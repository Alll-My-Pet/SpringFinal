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
	href="<c:url value='/css/Board/emojiWrite.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/paging.css'/>">
<script src="<c:url value='/js/board/emojiDetail.js'/> "></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
		        		<div class="emoView">
		        			${emoji.emoImg}
		        		</div>
		        		<div class="emoInfo">
		        			${emoji.emoName}<br>
		        			${emoji.memNickName}<br>
		        			${emoji.emoDate}<br>
		        			${emoji_purchase.useCount}
		        		</div>
		        		<div class="emojiDescription">
		        			${emoji.emoContent}
		        		</div>
		        		<div class="emojiPurchase">
		        			<button type="submit" class="emoPurchase" id="emoPurchase" name="emoPurchase">구매하기(100pt)</button>
		        		</div>
		        		<div class="bookmark">
		        			
		        		</div>
		        	</section>
	        		<form class="commentsWriteFrm">
   						<textarea class="commentWriteArea" name="commentText" placeholder="${Fboard.memId}:"></textarea>
   					</form>
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
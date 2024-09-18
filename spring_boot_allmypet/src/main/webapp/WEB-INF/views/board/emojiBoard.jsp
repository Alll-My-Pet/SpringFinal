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
	href="<c:url value='/css/Board/emojiBoard.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/paging.css'/>">
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
					<div class="emojiBestBox">
						<h2>베스트 이모지</h2>
						<a class="moreBestEmoji" href="<c:url value='/board/bestEmoji' />">+더보기</a>
						<div class="bestEmojiArray">
							<button class="bestEmojiBtn">일간</button>
							<button class="bestEmojiBtn">주간</button>
							<button class="bestEmojiBtn">월간</button>
						</div>
		                <div class="emojiBox">
							<div class="emojiPic"></div>
						    <div class="emojiInfo">이름 / 제작자 / 구매자 수</div>
						</div>
						<div class="emojiBox">
							<div class="emojiPic"></div>
						    <div class="emojiInfo">이름 / 제작자 / 구매자 수</div>
						</div>
						<div class="emojiBox">
							<div class="emojiPic"></div>
						    <div class="emojiInfo">이름 / 제작자 / 구매자 수</div>
						</div>
						<div class="emojiBox">
							<div class="emojiPic"></div>
						    <div class="emojiInfo">이름 / 제작자 / 구매자 수</div>
						</div>
	         		</div>
	         		
	        		<section class="emojiBoard">
	        			<h2>전체 이모지</h2>
	        			<div class="emojiArry">
		        			<button class="emojiArrayBtn">최신순</button>
		        			<button class="emojiArrayBtn">구매자순</button>
	        			</div>
	        			<div class="emojiSearch">
	        				<input type="text" class="emojiSearchBar" placeholder="게시판 내 검색">
	        				<button type="submit" class="emojiSearchBtn">
	        					<img src="image/search.png"/>
	        			</div>
	        			<div class="emojiNotice">
	        				<c:forEach items="${noticeList}" var="noticeBoard">
	        					<table>
			        				<tr>
			        					<td>이모지 게시판 사용 안내</td>
			        					<td>2024-08-02 16:00</td>
										<%-- <td><a href="#">${notice.postTitle}</a></td>
										<td>${notice.memNickName}</td>
										<td><fmt:formatDate value="${notice.postDate}"
												pattern="yyyy-MM-dd HH:mm" /></td> --%>
									</tr>
								</table>
							</c:forEach>
	        			</div>
		                <div class="emojiBox">
		                	<c:forEach items="${emojiList}" var="emojiBoard">
								<div class="emojiPic">${emoji.emoImg}</div>
							    <div class="emojiInfo">
							    	${emoji.emoName}<br>
							    	${emoji.memNickName}<br>
							    	${emoji_purchase.useCount}
							    </div>
						    </c:forEach>
						</div>
					</section>
					
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
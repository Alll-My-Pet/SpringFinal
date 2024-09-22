<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
 <html>
  <head>
   <title>동물보호 상세페이지</title>
   <link rel="stylesheet" type="text/css" href="<c:url value='/css/Board/protectDetail.css'/>" />
   <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
   <script src="<c:url value='/js/Board/protectBoard.js'/>"></script>
  </head>
	<body>
		<div class="All">
		
		 <!-- header -->
		<div id="header">
			<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
		</div>
		
		<h1 class="protectDetailFont">반려 동물 보호게시판</h1>
		 <section class="protectPost">
		
		
		  <div class="protectTitle">
		    <div class="title">
		    
		   		 제목&nbsp:&nbsp
					<c:choose>
						<c:when test="${protect.headerNo == 1}">[유기동물 봉사]</c:when>
						<c:when test="${protect.headerNo == 2}">[봉사]</c:when>
						<c:when test="${protect.headerNo == 3}">[캠페인]</c:when>
						<c:when test="${protect.headerNo == 4}">
							<span class="header-text-red">[유기동물 신고]</span>
						</c:when>
					</c:choose>
				&nbsp${protect.postTitle }
			
			</div>
		    <div class="author">작성자:${protect.memId }</div>
		  </div>
		  
		  <div class="protectContent">
		  <br><br>
		   ${protect.postContent}
		   <br>
			<c:if test="${not empty protect.postImg}">
				<div class="imgBox">
						<img class="post-image"
							src="<c:url value='/protect_images/${protect.postImg}'/>"
							alt="Post Image" />
				</div>
			</c:if>
			</div>
		 </section>
		 
		 <section class="postInfo">
		 	<div class="localAndBookmark">
		  		<div class="localAndInfo">
		  			<p>업체 위치 및 정보</p><br>
		  		</div>
		  
		  		<div class="bookMarkInfo">
		   			<p class="bookmarkUserFont">북마크한 이용자</p><br>
		   			<img src="<c:url value='/project_images/free-icon-user-9351199.png'/>" class="bookmarkImg"/>
		  		<p class="bookmarkFont">많은 관심 부탁드려요!</p>
		  		</div>
		  		
		  
		  	</div>
		 </section>
		 
		 <section class="likeAndBookmark">
		  <div class="likeAndBookmarkBox">
		   <button class="protectLikeBtn"><img src="<c:url value='/project_images/free-icon-thumb-up-5323424.png'/>" /></button>
      	   <button class="protectBookmarkBtn"><img src="<c:url value='/project_images/free-icon-bookmark-white-25667.png'/>" /></button>
		  </div>
		 </section>

		<div class="udButtons">
			<c:if test="${protect.memId == logInUser}">
				<a href="<c:url value='/board/protectUpdateForm/${protect.postNo}'/>" class="updateBtn">수정</a>
				<a href="<c:url value='/board/deleteProtect/${protect.postNo}'/>" class="deleteBtn" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
			</c:if>
		</div>


	</div>
		
		 <!-- footer부착 -->
		<div id="footer">
			<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
		</div>
		
	</body>
 </html>
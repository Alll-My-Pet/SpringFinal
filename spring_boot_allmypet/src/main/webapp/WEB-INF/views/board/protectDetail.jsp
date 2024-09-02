<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
 <html>
  <head>
   <title>동물보호 상세페이지</title>
   <link rel="stylesheet" type="text/css" href="<c:url value='/css/Board/protectDetail.css'/>" />
  </head>
	<body>
		<div class="All">
		<h1>반려 동물 보호게시판</h1>
		 <section class="protectPost">
		  <div class="protectTitle">
		   제목:${boardCthNo}${postTitle } &nbsp&nbsp&nbsp작성자:${memId }
		  </div>
		  
		  <div class="protectContent">
		   ${postContent}
		  </div>
		 </section>
		 
		 <section class="postInfo">
		  <div class="localAndInfo">
		  
		  </div>
		  
		  <div class="bookMarkInfo">
		   <p>북마크한 이용자:</p><br>
		   <img src="<c:url value='/project_images/free-icon-user-9351199.png'/>" />
		  </div>
		 </section>
		 
		 <section class="likeAndBookmark">
		  <div class="likeAndBookmarkBox">
		   <button class="protectLikeBtn"><img src="<c:url value='/project_images/free-icon-thumb-up-5323424.png'/>" /></button>
      	   <button class="protectBookmarkBtn"><img src="<c:url value='/project_images/free-icon-bookmark-white-25667.png'/>" /></button>
		  </div>
		 </section>
		</div>
	</body>
 </html>
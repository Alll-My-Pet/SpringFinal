<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/Board/freeDetail.css'/>" />
</head>
<body>

    
    <div class="All">
    			<!-- header -->
				<div id="header">
					<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
				</div>
    
      <section class="postText">
    	 <div class="TextBox">
     		${postContent}
    	 </div>
      </section>
      
      
      <section class="likeAndBookmark">
      	<div class="likeAndBookmarkBox">
      		<form class="likeFrm">
      			<button class="freeLikeBtn"><img src="<c:url value='/project_images/free-icon-thumb-up-5323424.png'/>" /></button>
      			<button class="FreeBookmarkBtn"><img src="<c:url value='/project_images/free-icon-bookmark-white-25667.png'/>" /></button>
      		</form>
      	</div>
      </section>
      
      <section class="comments">
      	<div class="commentsBox">
      		${commentText}
      	
      	
      	
      		<form class="commentsWriteFrm">
      			${memId }:<textarea class="commentWriteArea" name="commentText" placeholder="댓글 입력"></textarea>
      		</form>
      	</div>
      </section>
      
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
    </div> <!-- All끝 -->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>갤러리 상세</title>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/gallery/gallery_detail.css'/>" />
    </head>
<body>
    <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
    
    <div class="gallery-item-container">
        <div class="header">
        
            <div class="left">
                <div class="post-stats">
                    <p>추천수: ${gall.postLike}</p>
                    <c:set var="categoryName">
			            <c:choose>
			                <c:when test="${gall.petCtgNo == 1}">강아지</c:when>
			                <c:when test="${gall.petCtgNo == 2}">고양이</c:when>
			                <c:when test="${gall.petCtgNo == 3}">기타 포유류</c:when>
			                <c:when test="${gall.petCtgNo == 4}">파충류/양서류</c:when>
			                <c:when test="${gall.petCtgNo == 5}">어류</c:when>
			                <c:when test="${gall.petCtgNo == 6}">조류</c:when>
			                <c:when test="${gall.petCtgNo == 7}">설치류</c:when>
			                <c:when test="${gall.petCtgNo == 8}">절지류/곤충</c:when>
			                <c:otherwise>Unknown Category</c:otherwise>
			            </c:choose>
		        	</c:set>
		        	<div id="category-${gall.petCtgNo}">
                    	<p>동물: ${categoryName}</p>
                    </div>
                </div>
            </div>
            
            <div class="center">
                <h1 class="post-title">${gall.postTitle}</h1>
            </div>
            <div class="right">
                <div class="profile">
                    <img class="profile-image" src="<c:url value='/image/${gall.member.profile_image}'/>"/>
                    <p>${gall.memId}</p>
                </div>
            </div>
        </div>
        
        <div class="image-section">
            <img class="post-image" src="<c:url value='/image/gallery/${gall.postImg}'/>" alt="Post Image"/>
        </div>
        
        <div class="Content-section">
            ${gall.postContent }
        </div>
        
        <div class="comments-section">
            <!-- 댓글 리스트 출력 -->
            <c:forEach var="comment" items="${post.comments}">
                <p>${comment.commentText}</p>
            </c:forEach>
        </div>
    </div>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>
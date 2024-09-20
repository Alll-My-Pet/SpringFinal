<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>갤러리</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/gallery/gallery_best.css'/>" />
    
</head>
<body>
<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
<br><br>
<div class="gallery-container">
    <div class="header">
        <h1>갤러리</h1>
    </div>

    <c:forEach var="entry" items="${categorizedPosts}">
        <c:set var="petCtgNo" value="${entry.key}" />
        <c:set var="posts" value="${entry.value}" />

        <c:set var="categoryName">
            <c:choose>
                <c:when test="${petCtgNo == 1}">강아지</c:when>
                <c:when test="${petCtgNo == 2}">고양이</c:when>
                <c:when test="${petCtgNo == 3}">기타 포유류</c:when>
                <c:when test="${petCtgNo == 4}">파충류/양서류</c:when>
                <c:when test="${petCtgNo == 5}">어류</c:when>
                <c:when test="${petCtgNo == 6}">조류</c:when>
                <c:when test="${petCtgNo == 7}">설치류</c:when>
                <c:when test="${petCtgNo == 8}">절지류/곤충</c:when>
                <c:otherwise>Unknown Category</c:otherwise>
            </c:choose>
        </c:set>

        <h2 id="category-${petCtgNo}">
            <a href="<c:url value='/gallery/category/${petCtgNo }'/>">베스트 ${categoryName} 사진</a>
        </h2>
        <div class="gallery">
            <c:forEach var="post" items="${posts}">
                <div class="gallery-item">
                <a href="/gallery/detail/${post.postNo }">
                    <div class="image-container">
                        <img class="gallery-image" src="<c:url value='/image/gallery/${post.postImg}'/>"/>
                        <div class="overlay">
                            <div class="like-count">
                                <span>&hearts;${post.postLike}</span>
                            </div>
							<div class="profile-icon">
                            	<!-- 회원 프로필 사진 이미지 폴더 만들어지면 경로 수정 -->
					    		<img src="<c:url value='/image/member/${profileImages[post.postNo]}'/>"/>
							</div>
                        </div>
                    </div>
                    <div class="info">
                        <p class="title">${post.postTitle}</p>
                        <p class="comment-count">코멘트 수 : ${commentCounts[post.postNo]}</p>
                    </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </c:forEach>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>

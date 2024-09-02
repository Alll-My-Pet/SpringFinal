<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <title>카테고리 별 갤러리</title>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/gallery/gallery_category.css'/>" />
    </head>
<body>
    <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
    
    <div class="gallery-container">
        <div class="header">
            <h1>카테고리 갤러리</h1>
        </div>
        <div class="gallery">
            <!-- categoryPosts 리스트를 이용하여 게시물 출력 -->
            <c:forEach var="post" items="${categoryPosts}">
                <div class="gallery-item">
                    <div class="image-container">
                        <img class="gallery-image" src="<c:url value='/image/gallery/${post.postImg}'/>" alt="${post.postTitle}"/>
                        <div class="overlay">
                            <div class="like-count">
                                <span>&hearts; ${post.postLike}</span>
                            </div>
                            <div class="profile-icon">
                                <!-- 게시글 작성자의 프로필 이미지를 추가하려면, post에 해당 데이터가 있어야 합니다. -->
                                <img src="<c:url value='/image/default_profile.png'/>" alt="Profile"/>
                            </div>
                        </div>
                    </div>
                    <div class="info">
                        <p class="title">${post.postTitle}</p>
                        <p class="comment-count">코멘트 수: 0</p> <!-- 실제 코멘트 수가 있다면 post에 해당 데이터를 추가 -->
                    </div>
                </div>
            </c:forEach>
            
            <!-- 게시물이 없는 경우 -->
            <c:if test="${empty categoryPosts}">
                <p>해당 카테고리에 게시물이 없습니다.</p>
            </c:if>
        </div>
    </div>

    <c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>
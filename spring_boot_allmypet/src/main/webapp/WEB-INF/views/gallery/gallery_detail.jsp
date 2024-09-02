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
                <div class="gallery-item">
                    <div class="image-container">
                        <img class="gallery-image" src="<c:url value='/image/logo.png'/>"/>
                        <div class="overlay">
                            <div class="like-count">
                                <span>&hearts; 좋아요 수</span>
                            </div>
                            <div class="profile-icon">
                                <img src="<c:url value='/image/logo.png'/>" alt="Profile"/>
                            </div>
                        </div>
                    </div>
                    <div class="info">
                        <p class="title">게시글 제목</p>
                        <p class="comment-count">코멘트 수</p>
                    </div>
                </div>
            <%-- <c:forEach var="post" items="${posts}">
                <div class="gallery-item">
                    <div class="image-container">
                        <img class="gallery-image" src="<c:url value='${post.image}'/>"/>
                        <div class="overlay">
                            <div class="like-count">
                                <span>&hearts; ${post.likes}</span>
                            </div>
                            <div class="profile-icon">
                                <img src="<c:url value='${post.profile}'/>" alt="Profile"/>
                            </div>
                        </div>
                    </div>
                    <div class="info">
                        <p class="title">${post.title}</p>
                        <p class="comment-count">${post.comments} comment</p>
                    </div>
                </div>
            </c:forEach> --%>
        </div>
    </div>
    <c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>
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
<div class="gallery-container">
    <div class="header">
        <h1>갤러리</h1>
    </div>
    
    <c:forEach var="entry" items="${categorizedPosts}">
        <c:set var="petCtgNo" value="${entry.key}" />
        <c:set var="posts" value="${entry.value}" />
        
        <h2>Category ${petCtgNo}</h2>
        <div class="gallery">
            
            <c:forEach var="post" items="${posts}">
                <div class="gallery-item">
                    <div class="image-container">
                        <img class="gallery-image" src="<c:url value='/image/gallery/${post.postImg }'/>"/>
                        <div class="overlay">
                            <div class="like-count">
                                <span>&hearts;${post.postLike }</span>
                            </div>
                            <div class="profile-icon">
                                <img src="<c:url value='/image/logo.png'/>" alt="Profile"/>
                            </div>
                        </div>
                    </div>
                    <div class="info">
                        <p class="title">${post.postTitle }</p>
                        <p class="comment-count">코멘트 수</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:forEach>
    
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

    
</body>
</html>
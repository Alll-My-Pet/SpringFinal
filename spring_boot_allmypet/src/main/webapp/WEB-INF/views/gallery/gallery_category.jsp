<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

        <!-- 카테고리 이름 설정 -->
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

        <div id="category-${petCtgNo}" class="header">
            <h2>${categoryName} 갤러리</h2>
        </div>

        <!-- 검색 폼 -->
        <form action="/gallery/category/${petCtgNo}" method="get">
            <input type="text" name="keyword" placeholder="검색어를 입력하세요" value="${param.keyword}">
            <button type="submit">검색</button>
        </form>
        <br>

        <div class="gallery">
            <!-- 게시물 출력 -->
            <c:forEach var="post" items="${categoryPosts}">
                <div class="gallery-item">
                    <a href="/gallery/detail/${post.postNo}">
                        <div class="image-container">
                            <img class="gallery-image" src="<c:url value='/image/gallery/${post.postImg}'/>" alt="${post.postTitle}"/>
                            <div class="overlay">
                                <div class="like-count">
                                    <span>&hearts; ${post.postLike}</span>
                                </div>
                                <div class="profile-icon">
                                    <img src="<c:url value='/image/member/${profileImages[post.postNo]}'/>"/>
                                </div>
                            </div>
                        </div>
                        <div class="info">
                            <p class="title">${post.postTitle}</p>
                            <p class="comment-count">코멘트 수: ${commentCounts[post.postNo]}</p>
                        </div>
                    </a>
                </div>
            </c:forEach>

            <!-- 게시물이 없는 경우 -->
            <c:if test="${empty categoryPosts}">
                <p>해당 카테고리에 게시물이 없습니다.</p>
            </c:if>
        </div>

        <!-- 페이지네이션 -->
        <div class="pagination">
            <c:forEach var="i" begin="1" end="${totalPages}">
                <a href="?page=${i}&keyword=${param.keyword}" class="${page == i ? 'active' : ''}">${i}</a>
            </c:forEach>
        </div>
        
        <div class="mainWriteBox">
		    <!-- 로그인 한 경우  -->
		    <c:if test="${not empty sessionScope.mid }">
		        <button class="mainWriteBtn">
		            <a href="<c:url value='/gallery/${petCtgNo}/gallery_form'/>">글 작성</a>
		        </button>
		    </c:if>
		
		    <!-- 로그인 하지 않은 경우-->
		    <c:if test="${empty sessionScope.mid }">
		        <button id="notLoginBtn" class="mainWriteBtn"><a>글 작성</a></button>
		    </c:if>
		</div>
    </div>
    <c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>

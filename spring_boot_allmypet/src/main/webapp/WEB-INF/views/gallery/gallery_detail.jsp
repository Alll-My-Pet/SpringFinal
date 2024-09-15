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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/comment/comment.css'/>" />
    <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
    <script src="<c:url value='/js/comment/comment.js'/>"></script>
    <script>
        $(document).ready(function() {
            // 이모지 모달 열기 버튼 클릭 이벤트
            $('#open-emoji-modal').click(function() {
                // AJAX로 모달 내용 로드
                $.ajax({
                    url: '<c:url value="/emoji/favorites"/>',
                    method: 'GET',
                    success: function(data) {
                        $('#emojiModal').html(data); // 모달에 내용 삽입
                        openEmojiModal(); // 모달 열기 함수 호출
                    },
                    error: function() {
                        alert('모달 내용을 로드할 수 없습니다.');
                    }
                });
            });
        });
    </script>
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
            ${gall.postContent}
        </div>
        
        <div class="comments-section">
            <!-- 댓글 작성 폼 -->
            <h3>댓글 작성</h3>
            <form id="comment-form" method="post" action="/comment/insert">
                <input type="hidden" name="postNo" value="${gall.postNo}" />
                <input type="hidden" name="boardCtgNo" value="${gall.petCtgNo}" />
                <input type="hidden" id="selectedEmoji" name="emojiImg" value=""/>
                
                <!-- 이모지 선택 버튼 -->
                <button type="button" id="open-emoji-modal">이모지 추가</button>
                
                <!-- 선택된 이모지를 보여주는 영역 -->
                <div id="selected-emoji">
                    <img id="selectedEmojiImg" src="" alt="" style="width: 50px; height: 50px; display: none;"/>
                </div>
                
                <textarea name="commentText" placeholder="댓글을 입력하세요" required></textarea>
                <button type="submit">댓글 등록</button>
            </form>
        
            <h3>댓글 [${post.comments.size()}]</h3>
            
            <!-- 댓글 리스트 출력 -->
            <c:forEach var="comment" items="${post.comments}">
                <div class="comment-item">
                    <div class="comment-info">
                        <span class="comment-author">${comment.memId}</span>
                        <span class="comment-date">${comment.commentDate}</span>
                    </div>
                    <div class="comment-text">
                        <p>${comment.commentText}</p>
                    </div>
                    <div class="comment-actions">
                        <!-- 공감 버튼 -->
                        <button class="like-button" data-comment-id="${comment.commentId}" data-post-no="${post.postNo}">좋아요 (${comment.commentlike})</button>
    
                        <!-- 댓글 삭제 버튼 (자기 댓글일 경우에만 표시) -->
                        <c:if test="${comment.memId == sessionScope.mid}">
                            <button class="delete-button" data-comment-id="${comment.commentId}" data-post-no="${post.postNo}">삭제</button>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
        
        </div>
    </div>

    
    <div id="emojiModal" class="modal">
    </div>

    <c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>

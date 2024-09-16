<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이모지 선택</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/comment/comment.css'/>" />
    <script src="<c:url value='/js/comment/emoji_modal.js'/>"></script>
</head>
<body>
    <div class="modal-content">
        <span class="close" id="close-emoji-modal">&times;</span>
        <h3>이모지 선택</h3>
        <ul id="emoji-list">
            <c:forEach var="emoji" items="${favoriteEmojis}">
                <img src="<c:url value='/image/emoji/${emoji.emoImg}'/>" 
                         alt="${emoji.emoName}" 
                         class="emoji-option" 
                         onclick="selectEmoji('${emoji.emoImg}')">
            </c:forEach>
        </ul>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body> -->
	<c:forEach var="post" items="${galleryImg}" varStatus="status">
		<c:choose>
			<c:when test="${status.index < 5}">
				<a href="갤러리_상세.html" >
					<img src="<c:url value='/image/gallery/${post.postImg}'/>" width="100px">
				</a>
			</c:when>
		</c:choose>
	</c:forEach>
<!-- </body>
</html> -->
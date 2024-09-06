<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 게시판: 필터링 됐을 경우</title>
<link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/animal/bulletinBoard.css'/>" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/animal/bulletinBoard.js'/>"></script>
</head>
<body>
	<table class="boardTB">
		<tbody id="boardList">
			<c:forEach var="bulletin" items="${bulletinList }">
				<tr>
					<td class="headerName">[${bulletin.headerName }]</td>
					<td><a href="<c:url value=''/>" />${bulletin.postTitle }</td>
					<td>${bulletin.memNickName }</td>
					<td><fmt:formatDate value="${bulletin.postDate }"
							pattern="M/dd HH:mm" /></td>
					<td>${bulletin.postView }</td>
					<td>${bulletin.postLike }</td>
				</tr>
			</c:forEach>

		</tbody>

	</table>
</body>
</html>
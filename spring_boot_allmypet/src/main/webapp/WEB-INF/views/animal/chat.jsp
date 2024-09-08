<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Chat with ChatGPT</h2>
	<form action="${pageContext.request.contextPath}/api/chatgpt/message"
		method="post">
		<textarea name="userMessage" rows="4" cols="50"
			placeholder="질문을 입력하세요..."></textarea>
		<br> <input type="submit" value="전송">
	</form>

	<c:if test="${not empty response}">
		<h3>ChatGPT의 응답:</h3>
		<p>${response}</p>
	</c:if>
</body>
</html>
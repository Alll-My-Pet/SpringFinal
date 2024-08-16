<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
	<link rel="icon" type="image/png" href="#" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
	<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
</head>
<body>
	<!-- 헤더 + nav바 -->
	<div id="header">
		<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
	</div>
	<h1>TEST</h1>
	<div id="footer">
		<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
	</div>
</body>
</html>
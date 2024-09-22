<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="#" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/layout/usedItemSidebar.css'/>">
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
</head>
<body>
	<div class="menu">
		<div class="menu-header">용품 중고거래</div>
		<div class="menu-separator">
			<div class="rule"></div>
		</div>
		<div class="menu-section">
			<div class="menu-item">
				<a href="/usedItem" class="menu-link"> <span>&nbsp; 팔아요! 🤚</span>
				</a>
			</div>
			<div class="menu-item">
				<a href="/usedItemBuy" class="menu-link"> <span>&nbsp; 사요!&nbsp;🛍️</span>
				</a>
			</div>
		</div>
	</div>
</body>
</html>
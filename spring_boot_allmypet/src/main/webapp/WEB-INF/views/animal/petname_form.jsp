<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>all my pet | 작명소</title>
<link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/animal/petname.css'/>">
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
</head>
<body>
	<div class="desktop-1">
		<div class="frame-1">
			<div class="frame-2">
				<!-- header -->
				<div id="header">
					<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
				</div>
				<div class="contents">
					<div class="pageInfo">
						<div class="page-title">
							<div class="titleInfo">반려동물 이름짓기 어려울땐?</div>
							<span class="ctgTitle"> 반려동물 작명소 </span>
						</div>
					</div>
					<!-- pageInfo끝 -->
				</div>
			</div>
			<!-- frame-2끝 -->
		</div>
		<!-- frame-1끝  -->
	</div>
	<!-- desktop-1끝 -->
</body>
</html>
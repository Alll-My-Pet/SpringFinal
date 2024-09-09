<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAB</title>
<link rel="icon" type="image/png" href="#" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/layout/floating_btn.css'/>">
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/layout/floatingBtn.js'/>"></script>
</head>
<body>
	<div class="floatingBtn">
		<div class="floating-container">
        <!-- 토글버튼(+) -->
        <div class="floating-button" id="toggleButton">+</div>

        <div class="element-container" id="elementContainer">
            <div class="float-element">
                <span class="fab-label">오늘의 운세보기</span>
                <a href="link1.html">
                    <div class="icon-container">
                        <img src="/image/fab/fortuneteller.png" alt="운세보기" class="icon">
                    </div>
                </a>
            </div>
            <div class="float-element">
                <span class="fab-label">반려동물 지도</span>
                <a href="javascript:void(0);" id="petMapButton">
                    <div class="icon-container">
                    	<img src="/image/fab/animal-map.png" alt="동물지도" class="icon">
                	</div>
            	</a>
            </div>
            <div class="float-element">
                <span class="fab-label">문의사항</span>
                <a href="link3.html">
                    <div class="icon-container">
                        <img src="/image/fab/chat.png" alt="채팅" class="icon">
                    </div>
                </a>
            </div>
        </div>
    </div>
    <!-- TOP버튼 -->
    <div class="top-button" id="topButton">
        <img src="/image/fab/paw_top.png" alt="Top" class="top-icon">
    </div>
	</div>
</body>
</html>
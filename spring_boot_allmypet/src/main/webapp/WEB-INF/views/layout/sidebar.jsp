<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="icon" type="image/png" href="#" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/layout/sidebar.css'/>">
    <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
</head>
<body>
	<div class="menu">
        <div class="menu-header">
            동물별 커뮤니티
        </div>
        <div class="menu-section">
            <div class="menu-item">
                <a href="#" class="menu-link">
                    <span>
                        반려동물 갤러리
                    </span>
                </a>
            </div>
            <div class="menu-item">
                <a href="/board/listAllBoard" class="menu-link">
                    <span>
                        전체게시판
                    </span>
                </a>
            </div>
            <div class="menu-item">
                <a href="#" class="menu-link">
                    <span>
                        양육 팁 게시판
                    </span>
                </a>
            </div>
            <div class="menu-separator">
                <div class="rule">
                </div>
            </div>
        </div>
        <div class="menu-header">
            <a href="메인화면.jsp" class="header-link">
                전체 커뮤니티
            </a>
        </div>
        <div class="menu-section">
            <div class="menu-item">
                <a href="#" class="menu-link">
                    <span>
                        자유게시판
                    </span>
                </a>
            </div>
            <div class="menu-item">
                <a href="#" class="menu-link">
                    <a href="#" class="menu-link">
                        <span>
                            분양홍보 게시판
                        </span>
                    </a>
                </a>
            </div>
            <div class="menu-item">
                <a href="#" class="menu-link">
                    <span>
                        반려동물 보호 게시판
                    </span>
                </a>
            </div>
            <div class="menu-item">
                <a href="#" class="menu-link">
                    <span>
                        이모지 게시판
                    </span>
                </a>
            </div>
        </div>
    </div>
</body>
</html>
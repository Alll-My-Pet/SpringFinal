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
		<%
		String petCtgNo = (String) request.getAttribute("petCtgNo"); // request에서 값을 가져옴
		%>

		<%
		if (petCtgNo == null) {
		%>
		<!-- petCtgNo가 null일 때 보여줄 내용 -->

		<%
		} else {
		%>
		<!-- petCtgNo가 null이 아닐 때 메뉴 표시 -->
		<div class="menu-header">
         <a href="/animal_home/${petCtgNo}" class="header-link">
            동물별 커뮤니티
         </a>
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
                <a href="/animal_home/${petCtgNo}/bulletin" class="menu-link">
                    <span>
                        전체게시판
                    </span>
                </a>
            </div>
            <div class="menu-item">
                <a href="/animal_home/${petCtgNo}/tip" class="menu-link">
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
        <% } %>
        <div class="menu-header">
            <a href="/" class="header-link">
                전체 커뮤니티
            </a>
        </div>
        <div class="menu-section">
            <div class="menu-item">
                <a href="/board/freeBoard" class="menu-link">
                    <span>
                        자유게시판
                    </span>
                </a>
            </div>
            <div class="menu-item">
                <a href="/board/PromoteBoardList" class="menu-link">                  
	                  <span>
	                      분양홍보 게시판
	                  </span>               
                </a>
            </div>
            <div class="menu-item">
                <a href="/board/protect" class="menu-link">
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
    <!-- menu 끝 -->
</body>
</html>
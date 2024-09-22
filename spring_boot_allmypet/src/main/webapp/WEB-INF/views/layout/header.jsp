<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
	<link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
    <!-- 헤더: top-bar, nav-bar -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/layout/header.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/layout/nav.css'/>">
    <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
    <script src="<c:url value='/js/layout/header.js'/>"></script>
    <script src="<c:url value='/js/layout/logout.js'/>"></script>
</head>
<body>
	<div id="header" class="header">
		<div class="top-bar">
		<!-- 로고 + 로그인 버튼라인 위치 -->
		<a href="<c:url value='/'/>" class="logo">
            <img src="/image/logo.png" alt="로고" />
        </a>
		<div>
			<c:if test="${empty sessionScope.mid }">
			<div class="promotion">
				<span> 지금 회원 가입 시 1000P 지급! </span>
			</div>
			</c:if>
			<c:if test="${not empty sessionScope.mid &&  sessionScope.mpos != 2}">
			<div class="promotion">
				<!-- <span> 첫 게시글 작성 시 500P 지급! </span> -->
			</div>
			</c:if>
			<div class="loginbox">
				<ul class="login-bar">
					<c:if test="${empty sessionScope.mid }">
						<li><a href="<c:url value='/join'/>" id="topMenu2">회원가입</a></li>
						<li>|</li>
						<li><a href="<c:url value='/login'/>" id="topMenu1">로그인</a></li>
					</c:if>
					<c:if test="${not empty sessionScope.mid &&  sessionScope.mpos != 2}">
						<li>${sessionScope.mid}님</li>
						<li>|</li>
						<li><a href="<c:url value='/mypage'/>" id="topMenu2">마이페이지</a></li>
						<li>|</li>
						<li><a href="<c:url value='/market/cart'/>" id="topMenu1">장바구니</a></li>
						<li>|</li>
						<li><a href="<c:url value='/member/logout'/>" id="logout">로그아웃</a></li>
					</c:if>
					<c:if test="${not empty sessionScope.mid &&  sessionScope.mpos == 2}">
						<li><a href="<c:url value='/admin/product_insert_view'/>" id="topMenu2">관리페이지</a></li>
						<li>|</li>
						<li><a href="<c:url value='market/cart'/>" id="topMenu1">장바구니</a></li>
						<li>|</li>
						<li><a href="<c:url value='/member/logout'/>" id="logout">로그아웃</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<!-- top-bar 끝 -->
	<div class="nav-bar" id="navBar">
		<div class="menu-icon">
			<button class="menuBtn">
				<img src="<c:url value='/image/menu_twoline.svg'/>" alt="메뉴" />
			</button>
		</div>
		<div class="navigation-pill-list">
			<div class="navigation-pill">
				<a href="<c:url value='/board/noticeBoard'/>">공지사항</a>
				<%-- <div class="dropdown-menu">
					<a href="<c:url value='/board/noticeBoard'/>">공지사항</a> 
					<a href="#">이벤트</a>
				</div> --%>
			</div>
			<div class="navigation-pill">
				<a href="/gallery">갤러리</a>
			</div>
			<div class="navigation-pill">
				<a href="/">커뮤니티</a>
				<div class="dropdown-menu">
					<a href="<c:url value='/board/freeBoard'/>">자유게시판</a> 
					<a href="#">분양 홍보</a> 
					<a href="<c:url value='/board/ProtectBoardList'/>">반려동물 보호</a>
					<a href="#">이모지 제작</a> 
					<a href="#">핫한 게시글</a>
				</div>
			</div>
			<div class="navigation-pill">
				<a href="<c:url value='/board/bestTipBoard'/>">베스트 양육팁</a>
			</div>
			<div class="navigation-pill">
				<a href="/usedItem">용품 중고거래</a>
			</div>
			<div class="navigation-pill">
				<!-- 지역 소모임 -->
				<a href="#">집사들 모임</a>
			</div>
			<div class="navigation-pill">
				<a href="<c:url value='/market/home'/>">마켓🛒</a>
				<div class="dropdown-menu">
					<a href="<c:url value='/market/product'/>">반려동물용품</a> 
					<a href="<c:url value='/market/goods'/>">반려동물 굿즈</a>
				</div>
			</div>

			<!-- 전체 드롭다운 메뉴 -->
			<div class="overall-dropdown">
				<div class="dropdown-section">
					<strong>공지사항</strong> 
					<a href="<c:url value='/board/noticeBoard'/>">공지사항</a> 
					<!-- <a href="#">이벤트</a> -->
				</div>
				<div class="dropdown-section">
					<strong>갤러리</strong>
				</div>
				<div class="dropdown-section">
					<strong>커뮤니티</strong> 
					<a href="<c:url value='/board/freeBoard'/>">자유게시판</a> 
					<a href="#">분양 홍보</a> 
					<a href="<c:url value='/board/ProtectBoardList'/>">반려동물 보호</a> 
					<a href="#">이모지 제작</a> 
				</div>
				<div class="dropdown-section">
					<strong>
						<a href="<c:url value='/board/tipBoard'/>">베스트 양육팁</a>
					</strong>
				</div>
				<div class="dropdown-section">
					<strong>용품 중고거래</strong>
				</div>
				<div class="dropdown-section">
					<strong>집사들 모임</strong>
				</div>
				<div class="dropdown-section">
					<strong>마켓</strong>
					<a href="<c:url value='/market/product'/>">반려동물용품</a> 
					<a href="<c:url value='/market/goods'/>">반려동물 굿즈</a>
				</div>
			</div>
		</div>

		<!-- 검색 버튼 -->
		<div class="search-icon">
			<button class="searchBtn">
				<img src="/image/search.png" alt="검색" />
			</button>
		</div>
	</div>
	<!-- nav바 끝 -->
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>북마크 페이지</title>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/commMyEmoji.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/commControl.css'/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://kit.fontawesome.com/5698518370.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<section id="mypage_comm">
			<div id="mypage_l">
				<div id="comm_control">
					<span>커뮤니티</span>
					<a href="/mypage/bookmark_post"><div id="control_mej">북마크 게시글</div></a>
					<a href="/mypage/bookmark_gallery"><div id="control_mej">북마크 갤러리</div></a>
					<a href="/mypage/my_post_commnet"><div id="control_mpc">내가 쓴 글/댓글</div></a>
					<a href="/mypage/my_emoji"><div id="control_mi">내 이모지 관리</div></a>
				</div>
			</div>
			
			<div id="mypage_r">
			
			<div id="mej">
				<div id="mej_t">
					<a href="/mypage"><div id="first_name">마이페이지</div></a>
					<a href="/mypage/my_emoji"><div id="second_name">내 이모지</div></a>
				</div>
				<div id="mej_m">
					<div id="m_filter_search_div">
						<form id="m_filter_search" class="mej_filter_search">
							<select class="mej_filter" name="search_filter" >
							    <option value="title_content" selected>제목+내용</option>
							    <option value="title">제목</option>
							    <option value="content">내용</option>
							    <option value="writer">작성자</option>
							</select>
							<input type="text" class="mej_search_text">
							<i class="fa-solid fa-magnifying-glass search_btm"></i>
						</form>
					</div>
					<div id="mej_gallery_lists">
						
					</div>
				</div>
				<div id="mej_b">
					<div id="paging_view">
						페이징뷰 영역
					</div>
					<div id="b_filter_search_div">
						<form id="b_filter_search" class="mej_filter_search">
							<select class="mej_filter" name="search_filter" >
							    <option value="title_content" selected>제목+내용</option>
							    <option value="title">제목</option>
							    <option value="content">내용</option>
							    <option value="writer">작성자</option>
							</select>
							<input type="text" class="mej_search_text">
							<i class="fa-solid fa-magnifying-glass search_btm"></i>
						</form>
					</div>
				</div>
			</div>
			
			</div>
			
		</section>
	</body>
</html>
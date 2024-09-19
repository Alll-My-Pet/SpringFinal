<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내가 만든 이모지</title>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/mypagePublic.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/commEmojiIMade.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/commControl.css'/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://kit.fontawesome.com/5698518370.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
	
		<section id="mypage_comm">
			<div id="mypage_l">
				<div id="comm_control">
					<span>커뮤니티</span>
					<a href="/mypage/bookmark_post" class="btn_div"><div id="control_mej">북마크 게시글</div></a>
					<a href="/mypage/bookmark_gallery" class="btn_div"><div id="control_mej">북마크 갤러리</div></a>
					<a href="/mypage/my_post_commnet" class="btn_div"><div id="control_mpc">내가 쓴 글/댓글</div></a>
					<a href="/mypage/my_emoji" class="btn_div"><div id="control_mi">내 이모지 관리</div></a>
					<a href="/mypage/my_block_list" class="btn_div"><div id="control_bl">차단 목록</div></a>
				</div>
			</div>
			
			<div id="mypage_r">
				<div id="mej">
					<div id="mej_t">
						<div id="parent_tab">
							<a href="/mypage"><div id="first_name">마이페이지 ▶</div></a> 
							<a href="/mypage/my_emoji"><div id="first_name">내 이모지 관리</div></a>
						</div>
						<a href="/mypage/my_emoji/made"><div id="second_name">내가 만든 이모지</div></a>
					</div>
					<div id="mej_made" class="mej_content_area">
						<div id="mej_made_b" class="mej_list_total">
							<div class="mej_list_div" class="mej_list_div">
								<div class="mej_div_no">게시글 번호</div>
								<div class="mej_div_title">제목</div>
								<div class="mej_div_date">등록일</div>
								<div class="mej_div_preview">미리보기</div>
								<div class="mej_div_check">승인여부</div>
								<div class="mej_div_favorites">즐겨찾기</div>
							</div>
							<c:forEach var="i" begin="1" end="3"><!-- 추후 db값으로 변경 -->
								<div class="mej_list_post">
							        <div class="mej_list_no">게시글 번호</div>
							        <div class="mej_list_title">제목</div>
							        <div class="mej_list_date">등록일</div>
							        <div class="spacer"></div>
							        <div class="mej_img_preview">사진</div>
							        <div class="spacer"></div>
							        <div class="mej_list_check">승인여부</div>
							        <div class="mej_list_favorites">즐겨찾기</div>
							    </div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			
		</section>
		
		<c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>
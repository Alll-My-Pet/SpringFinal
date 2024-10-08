<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>북마크 페이지</title>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/mypagePublic.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/commBookMarkGallery.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/commControl.css'/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://kit.fontawesome.com/5698518370.js" crossorigin="anonymous"></script>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/mypage/commBookMarkGallery.js'/>"></script>
	</head>
	<body>
		<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
		
		<section id="mypage_comm">
			<div id="mypage_l">
				<div id="comm_control">
					<span>커뮤니티</span>
					<a href="/mypage/bookmark_post" class="btn_div"><div id="control_bmg">북마크 게시글</div></a>
					<a href="/mypage/bookmark_gallery" class="btn_div"><div id="control_bmg">북마크 갤러리</div></a>
					<a href="/mypage/my_post_commnet" class="btn_div"><div id="control_mpc">내가 쓴 글/댓글</div></a>
					<a href="/mypage/my_emoji" class="btn_div"><div id="control_mi">내 이모지 관리</div></a>
					<a href="/mypage/my_block_list" class="btn_div"><div id="control_bl">차단 목록</div></a>
				</div>
			</div>
			
			<div id="mypage_r">
			
			<div id="bmg">
				<div id="bmg_t">
					<a href="/mypage"><div id="first_name">마이페이지</div></a>
					<a href="/mypage/bookmark_gallery"><div id="second_name">북마크 갤러리</div></a>
				</div>
				<div id="bmg_m">
					<div id="m_filter_search_div">
						<form id="m_filter_search" class="bmg_filter_search">
							<select class="bmg_filter" name="search_filter" >
							    <option value="title_content" selected>제목+내용</option>
							    <option value="title">제목</option>
							    <option value="content">내용</option>
							    <option value="writer">작성자</option>
							</select>
							<input type="text" class="bmg_search_text">
							<i class="fa-solid fa-magnifying-glass search_btm"></i>
						</form>
					</div>
					<table id="bmg_gallery_lists"><!-- db로 호출 -->
						<c:if test="${not empty bookMarkList}">
						    <c:set var="count" value="0" />
						    <tr>
						        <c:forEach var="bookMark" items="${bookMarkList}">
						            <td>
						            	<div class="bmg_gallery_list">
											<img class="bmg_img_thumbnail" src="<c:url value='/image/testimg.jpg'/>">
											<div class="bmg_img_overlay">
												<div class="bmg_img_top">
													<div class="bmg_like_area inner_text_div">❤ ${bookMark.postLike }</div>
													<div class="bmg_profile_area"><img class="bmg_profile_img" src="<c:url value='/project_images/profile_Img/${bookMark.profile_image }'/>"></div>
												</div>
												<div class="bmg_img_bottom">
													<div class="bmg_title_area inner_text_div">${bookMark.postTitle }</div>
													<div class="bmg_comment_area">00 comment</div>
												</div>
											</div>
										</div>
						            </td>
						            <c:set var="count" value="${count + 1}" />
						            <c:if test="${count % 5 == 0}">
						                </tr><tr>
						            </c:if>
						        </c:forEach>
						    </tr>
						</c:if>
						
					</table>
				</div>
				<div id="bmg_b">
					<div id="paging_view">
						페이징뷰 영역
					</div>
					<div id="b_filter_search_div">
						<form id="b_filter_search" class="bmg_filter_search">
							<select class="bmg_filter" name="search_filter" >
							    <option value="title_content" selected>제목+내용</option>
							    <option value="title">제목</option>
							    <option value="content">내용</option>
							    <option value="writer">작성자</option>
							</select>
							<input type="text" class="bmg_search_text">
							<i class="fa-solid fa-magnifying-glass search_btm"></i>
						</form>
					</div>
				</div>
			</div>
			
			</div>
			
		</section>
		
		<c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>
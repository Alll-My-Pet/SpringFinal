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
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/commBookMark.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/commControl.css'/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://kit.fontawesome.com/5698518370.js" crossorigin="anonymous"></script>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/mypage/commBookMarkPost.js'/>"></script>
	</head>
	<body>
		<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
	
		<section id="mypage_comm">
			<div id="mypage_l">
				<div id="comm_control">
					<span>커뮤니티</span>
					<a href="/mypage/bookmark_post" class="btn_div"><div id="control_bmp">북마크 게시글</div></a>
					<a href="/mypage/bookmark_gallery" class="btn_div"><div id="control_bmg">북마크 갤러리</div></a>
					<a href="/mypage/my_post_commnet" class="btn_div"><div id="control_mpc">내가 쓴 글/댓글</div></a>
					<a href="/mypage/my_emoji" class="btn_div"><div id="control_mi">내 이모지 관리</div></a>
					<a href="/mypage/my_block_list" class="btn_div"><div id="control_bl">차단 목록</div></a>
				</div>
			</div>
			
			<div id="mypage_r">
			
			<div id="bmp">
				<div id="bmp_t">
					<a href="/mypage"><div id="first_name">마이페이지</div></a>
					<a href="/mypage/bookmark_post"><div id="second_name">북마크 게시글</div></a>
				</div>
				<div id="bmp_m">
					<div id="m_filter_search_div">
						<form id="m_filter_search" class="bmp_filter_search">
							<select class="bmp_filter" name="search_filter" >
							    <option value="title_content" selected>제목+내용</option>
							    <option value="title">제목</option>
							    <option value="content">내용</option>
							    <option value="writer">작성자</option>
							</select>
							<input type="text" class="bmp_search_text">
							<i id="search_btn"class="fa-solid fa-magnifying-glass search_btm"></i>
						</form>
					</div>
					<div id="bmp_post_lists">
						<div id="config_name">
							<select id="bmp_type" name="bmp_type" >
						    	<option value="bmp_all_post" selected>구분</option>
						    	<option value="1">공지</option>
						    	<option value="2">QnA</option>
						    	<option value="3">양육 팁</option>
						    	<option value="4">리뷰</option>
							</select>
							<div id="bmp_title">제목</div>
							<div id="bmp_writer">작성자</div>
							<div id="bmp_post_date">작성일</div>
							<div id="bmp_date">등록일</div>
						</div>
						<c:if test="${not empty bookMarkList }">
							<div id="bookMark_List">
								<c:forEach var="bookMark" items="${bookMarkList }" end="${fn:length(bookMarkList) - 1}">
									<div class="bmp_post_list">
										<div class="bmp_list_type">${bookMark.headerName }</div>
										<a href="/bulletin/${bookMark.petCtgNo}/detailViewBoard/${bookMark.postNo}" class="bmp_list_title inner_text_div">${bookMark.postTitle }</a>
										<div class="bmp_list_writer inner_text_div">${bookMark.author }</div>
										<div class="bmp_list_post_date">
											<fmt:formatDate value="${bookMark.bookmarkDate}" pattern="yyyy-MM-dd" />
										</div>
										<div class="bmp_list_date">
										    <fmt:formatDate value="${bookMark.bookmarkDate}" pattern="yyyy-MM-dd" />
										</div>
									</div>
								</c:forEach>
							</div>
						</c:if>
					</div>
				</div>
				<div id="bmp_b">
					<div id="paging_view">
						페이징뷰 영역
					</div>
					<div id="b_filter_search_div">
						<form id="b_filter_search" class="bmp_filter_search">
							<select class="bmp_filter" name="search_filter" >
							    <option value="title_content" selected>제목+내용</option>
							    <option value="title">제목</option>
							    <option value="content">내용</option>
							    <option value="writer">작성자</option>
							</select>
							<input type="text" class="bmp_search_text">
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
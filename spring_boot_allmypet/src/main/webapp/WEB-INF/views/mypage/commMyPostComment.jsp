<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내가 쓴 글/댓글</title>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/mypagePublic.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/commPostComment.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/commControl.css'/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://kit.fontawesome.com/5698518370.js" crossorigin="anonymous"></script>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/mypage/commMyPostComment.js'/>"></script>
	</head>
	<body>
		<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
		
		<section id="mypage_comm">
			<div id="mypage_l">
				<div id="comm_control">
					<span>커뮤니티</span>
					<a href="/mypage/bookmark_post" class="btn_div"><div id="control_mpc">북마크 게시글</div></a>
					<a href="/mypage/bookmark_gallery" class="btn_div"><div id="control_bmg">북마크 갤러리</div></a>
					<a href="/mypage/my_post_commnet" class="btn_div"><div id="control_mpc">내가 쓴 글/댓글</div></a>
					<a href="/mypage/my_emoji" class="btn_div"><div id="control_mi">내 이모지 관리</div></a>
					<a href="/mypage/my_block_list" class="btn_div"><div id="control_bl">차단 목록</div></a>
				</div>
			</div>
			
			<div id="mypage_r">
			
			<div id="mpc">
				<div id="mpc_t">
					<a href="/mypage"><div id="first_name">마이페이지</div></a>
					<a href="/mypage/my_post_commnet"><div id="second_name">내가 쓴 글/댓글</div></a>
				</div>
				<div id="mpc_m">
					<div id="m_filter_search_div">
						<form id="m_filter_search" class="mpc_filter_search">
							<select class="mpc_filter" name="search_filter" >
							    <option value="title_content" selected>제목+내용</option>
							    <option value="title">제목</option>
							    <option value="content">내용</option>
							    <option value="writer">작성자</option>
							</select>
							<input type="text" class="mpc_search_text">
							<i id="search_btn" class="fa-solid fa-magnifying-glass search_btm"></i>
						</form>
					</div>
					<div id="mpc_post_lists">
						<div id="config_name">
							<select id="mpc_type" name="mpc_type" >
						    	<option value="mpc_all_post" selected>구분</option>
						    	<option value="mpc_type1">내 게시글</option>
						    	<option value="mpc_type2">내 댓글</option>
							</select>
							<div id="mpc_title">제목/내용</div>
							<div id="mpc_date">등록일</div>
						</div>
						<div id="mpc_lists">
							<c:if test="${not empty postsComments }">
								<c:forEach var="pC" items="${postsComments }">
									<c:set var="config" value="${pC.source_table=='comment'?'댓글':'게시글' }"/>
									<div class="mpc_post_list"> <!-- db에서 값 추출 작업 필요 -->
										<div class="mpc_list_type">${config }</div>
										<div class="mpc_list_title inner_text_div">${pC.content }</div>
										<div class="mpc_list_date">
											<fmt:formatDate value="${pC.date}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</div>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
				<div id="mpc_b">
					<div id="paging_view">
						페이징뷰 영역
					</div>
					<div id="b_filter_search_div">
						<form id="b_filter_search" class="mpc_filter_search">
							<select class="mpc_filter" name="search_filter" >
							    <option value="title_content" selected>제목+내용</option>
							    <option value="title">제목</option>
							    <option value="content">내용</option>
							    <option value="writer">작성자</option>
							</select>
							<input type="text" class="mpc_search_text">
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
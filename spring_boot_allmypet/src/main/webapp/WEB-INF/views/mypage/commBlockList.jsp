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
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/commBlockList.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/commControl.css'/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://kit.fontawesome.com/5698518370.js" crossorigin="anonymous"></script>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/mypage/blockList.js'/>"></script>
	</head>
	<body>
		<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
		
		<section id="mypage_comm">
			<div id="mypage_l">
				<div id="comm_control">
					<span>커뮤니티</span>
					<a href="/mypage/bookmark_post" class="btn_div"><div id="control_mbl" >북마크 게시글</div></a>
					<a href="/mypage/bookmark_gallery" class="btn_div"><div id="control_mbl">북마크 갤러리</div></a>
					<a href="/mypage/my_post_commnet" class="btn_div"><div id="control_mpc">내가 쓴 글/댓글</div></a>
					<a href="/mypage/my_emoji" class="btn_div"><div id="control_mi">내 이모지 관리</div></a>
					<a href="/mypage/my_block_list" class="btn_div"><div id="control_bl">차단 목록</div></a>
				</div>
			</div>
			
			<div id="mypage_r">
			
				<div id="mbl">
					<div id="mbl_t">
						<a href="/mypage"><div id="first_name">마이페이지</div></a>
						<a href="/mypage/my_block_list"><div id="second_name">차단 목록</div></a>
					</div>
					<div id="mbl_m">
						<div id="mbl_search_delete">
							<div id="mbl_seachbox">
								<input type="text" id="mbl_search_text">
								<i id="mbl_searchIcon"class="fa-solid fa-magnifying-glass"></i>
							</div>
							<div id="mbl_btns">
								<button id="mbl_delete_btn">삭제</button>
								<button id="mbl_edit_btn">수정</button>
							</div>
						</div>
						<div id="mbl_lists_total">
							<div id="mbl_config_name">
								<div id="checkbox_area"><input type="checkbox" id="total_check"></div>
								
								<div id="mbl_ids">아이디</div>
								<div id="mbl_names">닉네임</div>
								<div id="mbl_reasons">설명</div>
								<div id="mbl_dates">차단일</div>
							</div>
							<div id="mbl_lists">
								<c:if test="${not empty blockList }">
									<c:forEach var="blocked" items="${blockList }" >
										<div class="mbl_list">
											<div class="list_checkbox_area"><input type="checkbox" class="mbl_checkbox"></div>
											<div class="mbl_id">${blocked.blocked_memId }</div>
											<div class="mbl_name">${blocked.memNickName }</div>
											<div class="mbl_reason_area"><input class="mbl_reason"type="text" value="${blocked.block_reason }"></div>
											<div class="mbl_date">
												<fmt:formatDate value="${blocked.block_date }" pattern="yyyy-MM-dd"/>
											</div>
										</div>
									</c:forEach>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			
			</div>
			
		</section>
		
		<c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>
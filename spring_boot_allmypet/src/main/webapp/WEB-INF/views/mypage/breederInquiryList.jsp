<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브리더 문의 내역</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/mypage/mypagePublic.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/mypage/breederInquiryList.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/mypage/breederControl.css'/>">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://kit.fontawesome.com/5698518370.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<section id="mypage_breeder">
		<div id="mypage_l">
			<div id="breeder_control">
				<span>브리더</span> 
				<a href="/mypage/breeder_regist"><div id="control_mbr">등록 / 취소</div></a> 
				<a href="/mypage/inquiry_lists"><div id="control_mbi">문의 내역</div></a>
			</div>
		</div>

		<div id="mypage_r">
			<div id="mbr">
				<div id="mbr_t">
					<a href="/mypage"><div id="first_name">마이페이지</div></a> <a
						href="/mypage/my_coupon_lists"><div id="second_name">브리더
							문의 내역</div></a>
				</div>
				<div id="mbr_m">
					<div id="m_filter_search_div">
						<form id="m_filter_search" class="mbr_filter_search">
							<select class="mbr_filter" name="search_filter">
								<option value="title_content" selected>제목+내용</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="writer">작성자</option>
							</select> <input type="text" class="mbr_search_text">
							<i class="fa-solid fa-magnifying-glass search_btm"></i>
						</form>
					</div>
					<div id="mbr_post_lists">
						<div id="config_name">
							<select id="mbr_type" name="mbr_type">
								<option value="mbr_all_post" selected>구분</option>
								<option value="mbr_type1">대기</option>
								<option value="mbr_type2">보류</option>
								<option value="mbr_type3">완료</option>
							</select>
							<div id="mbr_title">제목</div>
							<div id="mbr_writer">작성자</div>
							<div id="mbr_post_date">작성일</div>
						</div>
						<div class="mbr_post_list">
							<!-- db에서 값 추출 작업 필요 -->
							<div class="mbr_list_type">구분</div>
							<div class="mbr_list_title inner_text_div">제목</div>
							<div class="mbr_list_writer inner_text_div">작성자</div>
							<div class="mbr_list_post_date">작성일</div>
						</div>
					</div>
					<div id="mbr_b">
						<div id="paging_view">페이징뷰 영역</div>
						<div id="b_filter_search_div">
							<form id="b_filter_search" class="mbr_filter_search">
								<select class="mbr_filter" name="search_filter">
									<option value="title_content" selected>제목+내용</option>
									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="writer">작성자</option>
								</select> <input type="text" class="mbr_search_text"> 
								<i class="fa-solid fa-magnifying-glass search_btm"></i>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
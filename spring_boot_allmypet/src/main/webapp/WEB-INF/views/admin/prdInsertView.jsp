<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품 등록 페이지</title>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/admin/adminPagePublic.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/admin/adminControl.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/admin/prdInsertView.css'/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://kit.fontawesome.com/5698518370.js" crossorigin="anonymous"></script>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/admin/prdInsertView.js'/>"></script>
	</head>
	<body>
		<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
		
		<section id="admin_prdinsert">
			<div id="mypage_l">
				<div id="comm_control">
					<span>관리자 페이지</span>
					<a href="/admin/product_insert_view" class="btn_div"><div id="control_mbl" >상품 추가</div></a>
					<a href="/admin/product_modify_view" class="btn_div"><div id="control_mbl" >상품 관리</div></a>
					<a href="#" class="btn_div"><div id="control_mbl">이모지 관리</div></a>
					<a href="#" class="btn_div"><div id="control_mpc">신고 유저</div></a>
					<a href="#" class="btn_div"><div id="control_mi">신고 글</div></a>
				</div>
			</div>
			
			<div id="admin_r">
			
				<div id="admin_section">
					<div id="admin_section_t">
						<a href="/mypage"><div id="first_name">관리자 페이지</div></a>
						<a href="/mypage/my_block_list"><div id="second_name">상품 추가</div></a>
					</div>
					<div id="admin_section_m">
						<form id="prd_insert_form" method="POST" action="/admin/prdInsert">
							<div class="prd_div">
								<div class="prd_div_name">상품번호</div>
								<div class="prd_info_area">
									<input id="prdNo" name="prdNo"type="text">
									<div id="no_check_btn" class="btn_div">중복확인</div>
								</div>
							</div>
							<div class="prd_div">
								<div class="prd_div_name">분류</div>
								<div class="prd_info_area">
									<div id="petCtgNo_area" class="prd_detail">
										<div class="prd_detail_name">이용 대상</div>
									  	<input type="radio" name="petCtgNo" value="1"> 강아지
									  	<input type="radio" name="petCtgNo" value="2"> 고양이
									  	<input type="radio" name="petCtgNo" value="3"> 기타 포유류
									  	<input type="radio" name="petCtgNo" value="4"> 파충류/양서류
									  	<input type="radio" name="petCtgNo" value="5"> 어류
									  	<input type="radio" name="petCtgNo" value="6"> 조류
									  	<input type="radio" name="petCtgNo" value="7"> 설치류
									  	<input type="radio" name="petCtgNo" value="8"> 절지류/곤충류
									  	<input type="radio" name="petCtgNo" value="9"> 공용
									</div>
									<div id="prdCtgNo_area" class="prd_detail">
										<div class="prd_detail_name">상세 분류</div>
									  	<input type="radio" name="prdCtgNo" value="1"> 반려동물 식품
									  	<input type="radio" name="prdCtgNo" value="2"> 장난감
									  	<input type="radio" name="prdCtgNo" value="3"> 목욕용품
									  	<input type="radio" name="prdCtgNo" value="4"> 가구
									  	<input type="radio" name="prdCtgNo" value="5"> 앨범
									  	<input type="radio" name="prdCtgNo" value="6"> 액자
									  	<input type="radio" name="prdCtgNo" value="7"> 키링
									  	<input type="radio" name="prdCtgNo" value="8"> 달력
									</div>
								</div>
							</div>
							<div class="prd_div">
								<div class="prd_div_name">정보</div>
								<div class="prd_info_area">
									<div class="prd_detail">
										<div class="prd_detail_name">상품명</div>
										<input id="prdName" name="prdName" type="text">
									</div>
									<div class="prd_detail">
										<div class="prd_detail_name">가격</div>
										<input id="prdPrice" name="prdPrice" type="number">
									</div>
									<div class="prd_detail">
										<div class="prd_detail_name">제조사</div>
										<input id="prdCompany" name="prdCompany" type="text">
									</div>
									<div class="prd_detail">
										<div class="prd_detail_name">재고</div>
										<input id="prdStock" name="prdStock" type="number">
									</div>
								</div>
							</div>
							<div class="prd_div">
								<div class="prd_div_name">상품 이미지</div>
								<div class="prd_info_area">
									<div id="prd_img_area"></div>
									<div id="prd_img_btn"class="ei_cursor_pointer btn_div">이미지 추가</div>
									<input type="file" id="imageInput" style="display: none;" accept="image/*">
								</div>
							</div>
							<div class="prd_div">
								<div class="prd_div_name">상세 정보 이미지</div>
								<div class="prd_info_area">
									<div id="prd_info_area">
										<input id="prd_info"type="text" readonly>
									</div>
									<div id="prd_info_btn"class="ei_cursor_pointer btn_div">이미지 추가</div>
									<input type="file" id="infoInput" style="display: none;" accept="image/*">
								</div>
							</div>
							<div class="btn_area">
								<div id="submit_btn" class="btn_div">추가하기</div>

							</div>
						</form>
					</div>
				</div>
			
			</div>
			
		</section>
		
		<c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>
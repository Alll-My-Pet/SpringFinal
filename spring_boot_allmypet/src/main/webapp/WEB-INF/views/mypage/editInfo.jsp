<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내 정보 수정</title>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/mypagePublic.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/editInfo.css'/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://kit.fontawesome.com/5698518370.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<section id="edit_info">
			<div id="edit_info_area">
				<div id="edit_t">
					<div id="edit_t_l">
						<div id="edit_t_img_area"><img id="edit_img"src="<c:url value='/image/testimg2.jpg'/>"></div>
						<div id="edit_img_btn"class="ei_cursor_pointer">이미지 변경</div>
					</div>
					<div id="edit_t_r">
						<div id="my_nickname_area">닉네임:<div id="edit_nickname">gildong</div><img id="edit_icon" src=""></div>
						
						<div id="mypet_area">
							<div>반려동물</div>
							<div id="" class=""></div>
							<div></div>
							<div></div>
						</div>
					</div>
				</div>
				<div id="edit_b">
					<div id="info_nickname_area">
						<div class="info_config_div">닉네임</div>
						<div class="info_text_area">
							<div id="info_nickname_text_area">
								<input id="nickname_text_area"type="text">
								<div id="nickname_check_btn" class="ei_cursor_pointer">중복 확인</div>
							</div>
						</div>
					</div>
					<div id="info_my_area">
						<div class="info_config_div">집사 정보</div>
						<div class="info_text_area">
							<div id="info_birth_area" class="info_text_list">
								<div class="info_config_name">생일</div>
								<input id="birth_year" class="birth_inner_text"type="text" readonly>
								<span>년</span>
								<input id="birth_month" class="birth_inner_text" type="text" readonly>
								<span>월</span>
								<input id="birth_day" class="birth_inner_text" type="text" readonly>
								<span>일</span>
							</div>
							<div id="info_address_address"  class="info_text_list">
								<div class="info_config_name">주소</div>
								<div id="address_no_area">
									<input type="text" id="address_no">
									<div id="address_btn" class="ei_cursor_pointer">주소 찾기</div>
								</div>
								<input type="text" id="address_f" class="address_inner_text" placeholder="기본주소"><br>
								<input type="text" id="address_s" class="address_inner_text" placeholder="상세주소">
							</div>
							<div id="info_phone_area"  class="info_text_list">
								<div class="info_config_name">연락처</div>
								<input id="phone_f" class="info_phone_text" type="text" maxlength="4">
								<span>-</span>
								<input id="phone_s" class="info_phone_text" type="text" maxlength="4">
								<span>-</span>
								<input id="phone_t" class="info_phone_text" type="text" maxlength="4">
							</div>
						</div>
					</div>
					<div id="info_mypet_area">
						<div class="info_config_div">반려동물</div>
						<div class="info_text_area">
							<div class="info_pet_area">
								<div class="pet_name_area">
									<input type="radio">
									<div class="pet_type">도마뱀</div>
									<div class="pet_name">초록이</div>
									<div class="representative_pet">대표</div>
								</div>
								<div class="pet_birth_area">
									<div class="info_pet_birth_div">생일</div>
									<div class="pet_birth_text">
										<input type="text" class="pet_birth_year"oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
										<span>년</span>
										<input type="text" class="pet_birth_month"oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
										<span>월</span>
										<input type="text" class="pet_birth_day"oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
										<span>일</span>
									</div>
								</div>
							</div>
							<div class="info_pet_addition">
								<div class="info_pet_addition_btn ei_cursor_pointer">추가하기</div>
								<div class="info_pet_addition_text">반려동물은 총 3마리까지 등록 가능합니다.</div>
							</div>
						</div>
					</div>
				</div>
				<div id="edit_regis_btn" class="ei_cursor_pointer">수정</div>
			</div>
		</section>
	</body>
</html>
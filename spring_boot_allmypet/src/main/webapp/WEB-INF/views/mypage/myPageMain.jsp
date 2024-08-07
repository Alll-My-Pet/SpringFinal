<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/myPageMain.css'/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://kit.fontawesome.com/5698518370.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<section id="mypage_main">
			<div id ="myp">
				<div id="mp_info" class="mp_main_box">
					<div id="mp_info_left">
						<span>내 정보</span>
						<div id="info_pic_area">
							<div id="info_pic">
								<div id="info_mypic"><img id="my_profile_img"src="<c:url value='/image/testimg2.jpg'/>"></div>
								<div id="info_mypic_btn">
									<button>프로필 수정</button>
								</div>								
							</div>
							<div id="info_txt">
								<table>
									<tr>
										<td>닉네임</td>
										<td>닉네임</td>
										<td>아이콘</td>
									</tr>
									<tr><td>반려동물</td></tr>
									<tr>
										<td>종</td>
										<td>이름</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div id="mp_info_right">
						<span>현재 포인트</span>
						<div id="info_point_area">
							<div id="info_point">
								<div id="info_point_img">
									<img id="myp_point" src="image/point.png">
								</div>
								<div id="info_point_num">4500P</div>								
							</div>
							<div id="info_point_btn">
								<button>포인트 내역 보기</button>
							</div>
						</div>
					</div>
				</div>
				<div id="mp_comm" class="mp_main_box">
					<div class="myp_area_name">
						<div>커뮤니티</div>
						<i class="fa-regular fa-comment"></i>
					</div>
					<a href="/mypage/bookmark_post"><div id="bookmark_post" class="mp_comm_div mp_div_list">북마크한 게시글</div></a>
					<a href="/mypage/bookmark_gallery"><div id="bookmark_galleries" class="mp_comm_div mp_div_list">북마크한 갤러리</div></a>
					<a href="/mypage/my_post_commnet"><div id="my_post" class="mp_comm_div mp_div_list">내가 쓴 글/댓글</div></a>
					<a href="/mypage/my_emoji"><div id="my_emoji" class="mp_comm_div mp_div_list">내 이모지</div></a>
				</div>
				<div id="mp_mk" class="mp_main_box">
					<div class="myp_area_name">
						<div>마켓</div>
						<i class="fa-solid fa-cart-shopping"></i>
					</div>
					<a href="#"><div id="order_details" class="mp_mk_div mp_div_list">주문내역</div></a>
					<a href="#"><div id="coupon_box" class="mp_mk_div mp_div_list">쿠폰함</div></a>
					<a href="#"><div id="pet_goods" class="mp_mk_div mp_div_list">내 반려동물 굿즈</div></a>
				</div>
				<div id="mp_breeder" class="mp_main_box">
					<div class="myp_area_name">
						<div>브리더</div>
						<i class="fa-solid fa-briefcase"></i>
					</div>
					<a href="#"><div id="breeder_regist" class="mp_brd_div mp_div_list">브리더 등록/취소</div></a>
					<a href="#"><div id="breeder_inquiry" class="mp_brd_div mp_div_list">거래 내역 고지</div></a>
				</div>
			</div>
		</section>
	</body>
</html>
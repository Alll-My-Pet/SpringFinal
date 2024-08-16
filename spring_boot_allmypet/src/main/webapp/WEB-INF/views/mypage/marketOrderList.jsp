<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내 주문내역</title>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/mypagePublic.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/marketOrderList.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/marketControl.css'/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://kit.fontawesome.com/5698518370.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
		
		<section id="mypage_market">
			<div id="mypage_l">
				<div id="market_control">
					<span>마켓</span>
					<a href="/mypage/my_order_lists" class="btn_div"><div id="control_mol">주문내역</div></a>
					<a href="/mypage/my_coupon_lists" class="btn_div"><div id="control_mcl">쿠폰함</div></a>
					<a href="/mypage/my_goods_lists" class="btn_div"><div id="control_mgl">내 반려동물 굿즈</div></a>
				</div>
			</div>
			
			<div id="mypage_r">
				<div id="mol">
					<div id="mol_t">
						<a href="/mypage"><div id="first_name">마이페이지</div></a>
						<a href="/mypage/my_order_lists"><div id="second_name">주문내역</div></a>
					</div>
					<div id="mol_m">
						<div id="mol_enter_date">
							<div id="mol_date_total" class="div_cursor_pointer btn_div">전체보기</div>
							<div id="mol_date_six_months" class="div_cursor_pointer btn_div">6개월</div>
							<div id="mol_date_one_year" class="div_cursor_pointer btn_div">1년</div>
							<div id="mol_date_two_year" class="div_cursor_pointer btn_div" >2년</div>
						</div>
						<div id="mol_order_lists">
							<div class="mol_order_list">
								<div class="mol_info">
									<div class="mol_info_date">주문일자 : 0000년 00월 00일</div>
									<div class="mol_info_area">
										<div class="mol_info_img"><img src=""></div>
										<div class="mol_info_txt">
											<table>
												<tr class="mol_info_tr">
													<td class="mol_info_config_area">상품명</td>
													<td class="mol_info_text_area inner_text_div inner_text_div">고양이 장난감</td>
												</tr>
												<tr class="mol_info_tr">
													<td class="mol_info_config_area">상품 수량</td>
													<td class="mol_info_text_area inner_text_div">3개</td>
												</tr>
												<tr class="mol_info_tr">
													<td class="mol_info_config_area">총 가격</td>
													<td class="mol_info_text_area inner_text_div">17000원</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
								<div class="mol_btns">
									<div class="mol_status">배송중</div>
									<div class="mol_btns_area">
										<div class="mol_view_details"><button>상세 보기</button></div>
										<!-- 배송 준비중일시 보여줌 (if문 처리) -->
										<div class="mol_prd_cancel mol_center_btn"><button>주문 취소</button></div>
										<!-- 배송 준비중을 빼고 보여줌 보여주는 화면 (if문 처리)
											<div class="mol_prd_return mol_center_btn"><button>교환/반품 신청</button></div>
										 -->
										<div class="mol_view_details"><button>상세 보기</button></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>
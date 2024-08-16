<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내 반려동물 굿즈</title>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/mypagePublic.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/marketGoodsList.css'/>">
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
				<div id="mgl">
					<div id="mgl_t">
						<a href="/mypage"><div id="first_name">마이페이지</div></a>
						<a href="/mypage/my_goods_lists"><div id="second_name">내 반려동물 굿즈</div></a>
					</div>
					<div id="mgl_m">
						
					</div>
				</div>
			</div>
		</section>
		
		<c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>
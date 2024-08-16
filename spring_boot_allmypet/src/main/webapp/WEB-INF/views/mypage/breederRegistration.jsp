<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>브리더 등록</title>
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/mypagePublic.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/breederRegistration.css'/>">
		<link rel="stylesheet"   type="text/css"  href="<c:url value='/css/mypage/breederControl.css'/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<script src="https://kit.fontawesome.com/5698518370.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<section id="mypage_breeder">
			<div id="mypage_l">
				<div id="breeder_control">
					<span>브리더</span>
					<a href="/mypage/breeder_regist" class="btn_div"><div id="control_mbr">등록 / 취소</div></a>
					<a href="/mypage/inquiry_lists" class="btn_div"><div id="control_mbi">문의 내역</div></a>
				</div>
			</div>
				
			<div id="mypage_r">
				<div id="mbr">
					<div id="mbr_t">
						<a href="/mypage"><div id="first_name">마이페이지</div></a>
						<a href="/mypage/my_coupon_lists"><div id="second_name">브리더 등록</div></a>
					</div>
					<div id="mbr_m">
						
					</div>
				</div>
			</div>
		</section>
	</body>
</html>
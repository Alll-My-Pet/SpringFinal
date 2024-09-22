<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문완료</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/market/order.css'/>" />
	</head>
	<body>
	<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
	<section class="order">
		<div class="complete_message">주문이 완료 되었습니다</div>
		<br><br><br>
<<<<<<< HEAD
		<div class="complete_guide">상품배송 정보</div>
=======
		<div class="complete_guide">주문 정보</div>
>>>>>>> refs/heads/KCU
		
		<br><br><br>
		
		<div class="complete_s_box">
			<p class="order_title">받는사람 정보</p><br><br>
			받는사람 : ${ordVo.ordReceiver}<br>
			받는주소 : ${ordVo.ordAddress}<br><br>
			배송요청 사항 : ${ordVo.ordMsg}
		</div>
		<div class="complete_s_box">
			<p class="order_title">결제 정보</p><br><br>
			주문금액 : <fmt:formatNumber value= "${ordVo.ordPrice}" pattern="#,###" />원<br>
			배송비 : 0원<br><br>
			총 결제금액 : <fmt:formatNumber value= "${ordVo.ordPrice}" pattern="#,###" />원
		</div>
		
		
		<div class="cart__mainbtns">
            <button class="cart__bigorderbtn left"  
            onclick="location.href='<c:url value='/market/order/history'/>'">주문 내역 보기</button>
            <button class="cart__bigorderbtn right" 
            onclick="location.href='<c:url value='/market/home'/>'">쇼핑 계속하기</button>
        </div>
		
	</section>
	<c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문/결제</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/market/order_history.css'/>" />
	</head>
	<body>
		<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
		<div class="order-container">
			<div class="header">
				<h1>주문 취소 내역</h1>
			</div>
			
			<!-- 주문 리스트 -->
			<c:forEach var="order" items="${orderList}">
				<div class="order">
				<h3>${order.ordDate} 주문
				<div class="order_price">
                    총 <fmt:formatNumber value= "${order.ordPrice}" pattern="#,###" />원
                </div>
					<c:forEach var="product" items="${order.orderProducts}">
						<div class="order-item">
							<div class="product-info">
								<img class="order_image" src="<c:url value='/image/market/${product.productDetails.prdImg}'/>" />
								<p>${product.productDetails.prdName}
								<br>
								<fmt:formatNumber value="${product.productDetails.prdPrice}" pattern="#,###" />원
								<br>
								수량: ${product.ordQty}개</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:forEach>
			<c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
		</div>
	</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>리뷰 작성 선택</title>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/market/order_cancel.css'/>" />
	</head>
<body>
    <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
	
    <div class="order-container">
        <br><br>
        <div class="header">
            <h1>리뷰를 작성할 상품을 선택해주세요</h1>
        </div>

        <!-- 주문 상품 목록 반복 출력 -->
        
            <div class="order">
                <h3>리뷰 대상 상품</h3>
                <c:forEach var="products" items="${products}">
                <div class="product-info">
                    <img class="order_image" src="<c:url value='/image/market/${products.productDetails.prdImg}'/>" />
                    <p>${products.productDetails.prdName}
                    <br>
                    <fmt:formatNumber value="${products.productDetails.prdPrice}" pattern="#,###" />원
                    <br>
                    ${products.ordQty}개<br>
                </div>
                <a href="<c:url value='/market/review/${products.ordNo}/${products.prdNo}'/>">
                <button>
                리뷰작성하기
                </button>
                </a>
				</c:forEach>
            </div>
        
    </div>
    <c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>

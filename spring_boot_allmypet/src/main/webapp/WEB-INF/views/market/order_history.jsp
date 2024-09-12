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
            <h1>주문 내역</h1>
        </div>
		<div class="filter-grid">
    			<form id="filterForm" method="get" action="<c:url value='/market/order/history'/>">
        		<input type="radio" name="filter" value="all" checked>전체
        		<input type="radio" name="filter" value="6months">6개월 이내
        		<input type="radio" name="filter" value="1year">1년 이내
        		<input type="radio" name="filter" value="2years">2년 이내
        		<button type="submit">조회</button>
    			</form>
		</div>
		
		<c:forEach var="order" items="${orderList}">
        <div class="order">
            <h3>${order.ordDate} 주문
            <div class="order_price">
                    총 <fmt:formatNumber value= "${order.ordPrice}" pattern="#,###" />원
             </div></h3>
            <div class="status">
              	<c:choose>
                	<c:when test="${order.ordState}">배송완료</c:when>
                	<c:otherwise>배송중</c:otherwise>
				</c:choose>  
				</div>
           	 <c:forEach var="product" items="${order.orderProducts}">
            <div class="order-item">
                <div class="product-info">
                <img class="order_image" src="<c:url value='/image/market/${product.productDetails.prdImg}'/>"/>
                     <p>${product.productDetails.prdName}
                    <br>
                    <fmt:formatNumber value= "${product.productDetails.prdPrice}" pattern="#,###" />원
                    <br>
                    ${product.ordQty}개</p>
                </div>
                
            </div>
            </c:forEach>
            <div class="order_buttons">
                    <button>배송조회</button>
 	                <c:choose>
	                	<c:when test="${order.ordState}">
                            <button>교환/반품 신청</button>
                            <button>리뷰 작성</button>
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/market/cancel/${order.ordNo}'/>">
                            <button>주문취소</button>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
        </div>
        </c:forEach>
	<c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
    </div>
</body>
</html>
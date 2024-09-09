<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품 상세 페이지</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/market/product_detail.css'/>" />
	<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
	<script src="<c:url value='/js/market/product_detail.js'/>"></script>
</head>
<body>
<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
	<form method="post" action="<c:url value='/market/product/insertCart'/>">
    <div class="container">
        <div class="product-detail">
            <img class="product-image" src="<c:url value='/image/market/${prd.prdImg }'/>"/>
            <div class="product-info">
                <div class="info-item">${prd.prdName }</div>
                <div class="info-item"><fmt:formatNumber value= "${prd.prdPrice}" pattern="#,###" />원</div>
                <div class="info-item">${prd.prdCompany }</div>
                <div class="info-item">
                    <div class="quantity-control">수량 &nbsp;&nbsp; 
                    <button class="quantity-btn decrease">-</button>
                    <input type="text" class="quantity-input" name="cartQty" value="1" readonly>
                    <button class="quantity-btn increase">+</button>
                	</div>
                </div><br>
                
                <div class="info-item">
                	<input class="detail_btn" type="submit" id="insertCart" value="장바구니 담기"><br>
                	<input class="detail_btn" type="button" id="insertOrder" value="즉시 구매" />
                </div>
            </div>
            <input type="hidden" name="memId" value="${memVo.memId}">
            <input type="hidden" name="prdNo" value="${prd.prdNo}">
        </div>
        <div class="product-tabs">
            <a href="#1">상품상세정보</a> | <a href="#2">이용후기</a>
        </div>
        <div class="product-description">
            <div class="description-item">
            <a id="#1">
            <img class="product-image" src="<c:url value='/image/market/${prd.prdDescript }'/>"/>
			</a></div>
            <div class="description-item">
            <a id="#2">이용후기</a> 내용</div>
        </div>
    </div>
    </form>
    <c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>
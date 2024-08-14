<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품 상세 페이지</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/product_detail.css'/>" />
</head>
<body>
	<form method="post" action="<c:url value='/market/product/insertCart'/>">
    <div class="container">
        <div class="product-detail">
            <img class="product-image" src="<c:url value='/image/${prd.prdImg }'/>"/>
            <div class="product-info">
                <div class="info-item">${prd.prdName }</div>
                <div class="info-item"><fmt:formatNumber value= "${prdVo.prdPrice}" pattern="#,###" />원</div>
                <div class="info-item">${prd.prdCompany }</div>
                <div class="info-item">
                    <div class="quantity-control">수량 &nbsp;&nbsp; 
                    <button class="quantity-btn decrease">-</button>
                    <input type="text" class="quantity-input" name="cartQty" value="1" readonly>
                    <button class="quantity-btn increase">+</button>
                	</div>
                </div><br>
                
                <div class="info-item">총 가격</div><br>
                <div class="info-item">
                	<input class="detail_btn" type="submit" id="insertCart" value="장바구니 담기"><br>
                	<input class="detail_btn" type="submit" id="insertOrder" value="즉시 구매"
                	 onclick="location.href='<c:url value='/market/order'/>'">
                </div>
            </div>
            <input type="hidden" name="memId" value="abcd">
            <input type="hidden" name="prdNo" value="${prd.prdNo}">
        </div>
        <div class="product-tabs">
            <a href="#1">상품상세정보</a> | <a href="#2">이용후기</a>
        </div>
        <div class="product-description">
            <div class="description-item">
            <a id="#1">상세정보</a> 내용</div>
            <div class="description-item">
            <a id="#2">이용후기</a> 내용</div>
        </div>
    </div>
    </form>
</body>
<script type="text/javascript">
const increaseButtons = document.querySelectorAll('.quantity-btn.increase');
const decreaseButtons = document.querySelectorAll('.quantity-btn.decrease');

increaseButtons.forEach(button => {
    button.addEventListener('click', function () {
        const quantityInput = this.previousElementSibling;
        let quantity = parseInt(quantityInput.value);
        quantityInput.value = quantity + 1;
    });
});

decreaseButtons.forEach(button => {
    button.addEventListener('click', function () {
        const quantityInput = this.nextElementSibling;
        let quantity = parseInt(quantityInput.value);
        if (quantity > 1) {
            quantityInput.value = quantity - 1;
        }
    });
});

document.querySelector('.detail_btn').addEventListener('click', function() {
    // Confirm dialog
    let confirmMove = confirm("장바구니 담기 완료. 장바구니로 이동하시겠습니까?");
    if (confirmMove) {
        // If the user clicks "예", redirect to /market/cart
        window.location.href = '/market/cart/${prd.prdNo}';
    }
});
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
<title>주문/결제</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/order_history.css'/>" />
	</head>
	<body>
		<section class="">
		    <div class="container">
        <div class="header">
            <h1>주문 내역</h1>
        </div>
        <div class="filter-grid">
                <input type="checkbox" name="total">전체
                <input type="checkbox" name="1">6개월 이내
                <input type="checkbox" name="2">1년 이내
                <input type="checkbox" name="3">2년 이내
                
            </div>

        <div class="order">
            <img src="<c:url value='/image/logo.png'/>"/>
            <div class="order-details">
                <p>주문일자: ${ordVo.ordData}</p>
                <p>상품명: ${prdVo.prdName}</p>
                <p>가격: ${prdVo.prdPrice}*${cartVo.cartQty}</p>
                <p>수량: ${ordVo.ordQty}개</p>
            </div>
            <div class="order-status">
                <p>배송상태: ${ordVo.ordState}(배송중일 경우)</p>
                <button>배송조회</button>
                <button>주문취소</button>
            </div>
        </div>

        <div class="order">
            <img src="<c:url value='/image/logo.png'/>"/>
            <div class="order-details">
                <p>주문일자: ${ordVo.ordData}</p>
                <p>상품명: ${prdVo.prdName}</p>
                <p>가격: ${prdVo.prdPrice}*${cartVo.cartQty}</p>
                <p>수량: ${ordVo.ordQty}개</p>
            </div>
            <div class="order-status">
                <p>배송상태: ${ordVo.ordState}(배송완료일 경우)</p>
                <button>교환/반품 신청</button>
                <button>리뷰 작성</button>
            </div>
        </div>


    </div>
    </section>
	</body>
</html>
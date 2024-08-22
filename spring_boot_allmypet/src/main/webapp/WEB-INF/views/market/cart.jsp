<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>장바구니</title>
		
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/market/cart.css'/>" />
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/market/cart.js'/>"></script>
	</head>
	<body>
	<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
		<section class="cart">
        <div class="cart__information">
            <ul>
                <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
            </ul>
        </div>
        <form action="/market/order/" method="get">
        <table class="cart__list">
                <thead>
                    <tr>
                        <td><input type="checkbox" class="select_all"></td>
                        <td colspan="2">상품정보</td>
                        <td>옵션</td>
                        <td>상품금액</td>
                        <td>배송비</td>
                    </tr>
                </thead>
                <tbody>
                <c:set var = "total" value = "0" />
                <c:forEach items="${cartList }" var="car">
                    <tr class="cart__list__detail">
                        <td><input type="checkbox" class="select" data-cartno="${car.cartNo}"></td>
                        <td><img src="<c:url value='/image/market/${car.product.prdImg }'/>"/></td>
                        <td>${car.product.prdCompany }</a>
                            <p>${car.product.prdName }</p>
                            <sapn class="price"><fmt:formatNumber value= "${car.product.prdPrice}" pattern="#,###" />원</sapn>
                        </td>
                        <td class="cart__list__option">
                            <p>제품명 : ${car.product.prdName} / ${car.cartQty}개</p>
                            <button class="cart__list__optionbtn" onclick="location.href='<c:url value='/market/product/detail'/>'">주문조건 추가/변경</button>
                        </td>
                        <td><span class="price"><fmt:formatNumber value= "${car.product.prdPrice *car.cartQty}" pattern="#,###" />원</span><br>
                        <c:set var= "total" value="${total + (car.product.prdPrice *car.cartQty)}"/>
                            <button class="cart__list__orderbtn" onclick="location.href='<c:url value='/market/order'/>'">즉시구매</button>
                        </td>
                        <td>무료</td>
                    </tr>
                    </c:forEach>
                    
                    
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3">
                        <button class="cart__list__optionbtn" name="del">선택상품 삭제</button>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
        </table>
        <br>
        <br>
        <br>
        
        
        <table class="order_info">
    		<colgroup>
        	<col style="width: 20%;">
        	<col style="width: 80%;">
    	</colgroup>
        <thead>
            <tr>
                <td class="order_title" colspan="2">주문 예상 금액</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="order_kind">총 상품 가격</td>
                <td>
                    <div class=order_Pirce>
                    	<fmt:formatNumber value= "${total}" pattern="#,###" />원
                    </div>
                </td>
            </tr>
            <tr>
                <td class="order_kind">배송비</td>
                <td>
                    <div class=order_Pirce>0원</div>
                </td>
            </tr>
        
            <tr>
                <td class="order_kind">적립 포인트</td>
                <td>
                	<div class=order_Pirce>
						+<fmt:formatNumber value= "${total*0.02}" pattern="#,###" />p
					</div>
				</td>
            </tr>
            
            <tr>
                <td class="order_kind">합계</td>
                <td>
					<div class=order_Pirce>
                    	<fmt:formatNumber value= "${total}" pattern="#,###" />원
                    </div>
				</td>
            </tr>
          </tbody>
		</table>
		
        
        <div class="cart__mainbtns">
            <button class="cart__bigorderbtn left" onclick="location.href='<c:url value='/market/home'/>'">쇼핑 계속하기</button>
            <button class="cart__bigorderbtn right" type="submit">주문하기</button>
        </div>
        </form>
    </section>
    <c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
	</body>
</html>
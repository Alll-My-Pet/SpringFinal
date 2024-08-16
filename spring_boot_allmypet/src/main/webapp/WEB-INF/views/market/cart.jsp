<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>장바구니</title>
		
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/cart.css'/>" />
		
	</head>
	<body>
		<section class="cart">
        <div class="cart__information">
            <ul>
                <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
            </ul>
        </div>
        <table class="cart__list">
            <form>
                <thead>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td colspan="2">상품정보</td>
                        <td>옵션</td>
                        <td>상품금액</td>
                        <td>배송비</td>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${cartList }" var="car">
                    <tr class="cart__list__detail">
                        <td><input type="checkbox"></td>
                        <td><img src="<c:url value='/image/logo.png'/>"/></td>
                        <td><a href="#">${prd.prdCompany }</a><span class="cart__list__smartstore"> 스마트스토어</span>
                            <p>${prd.prdName }</p>
                            <sapn class="price"><fmt:formatNumber value= "${prdVo.prdPrice}" pattern="#,###" />원</sapn>
                            <span style="text-decoration: line-through; color: lightgray;">119,000</span>
                        </td>
                        <td class="cart__list__option">
                            <p>모델명 : 키보드 - 한국어 MK2A3KH/A / 1개</p>
                            <button class="cart__list__optionbtn" onclick="location.href='<c:url value='/market/product/detail'/>'">주문조건 추가/변경</button>
                        </td>
                        <td><span class="price">116,620원</span><br>
                            <button class="cart__list__orderbtn" onclick="location.href='<c:url value='/market/order'/>'">주문하기</button>
                        </td>
                        <td>무료</td>
                    </tr>
                    </c:forEach>
                    a
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3"><input type="checkbox"> <button class="cart__list__optionbtn">선택상품 삭제</button>
                            <button class="cart__list__optionbtn">선택상품 찜</button>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
            </form>
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
                <td class="order_kind">상품 가격</td>
                <td>
                    <div class=order_Pirce>0원</div>
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
                <td><div class=order_Pirce>+0p</div></td>
            </tr>
            
            <tr>
                <td class="order_kind">합계</td>
                <td><div class=order_Pirce>0p원</div></td>
            </tr>
          </tbody>
		</table>
		
        
        <div class="cart__mainbtns">
            <button class="cart__bigorderbtn left" onclick="location.href='<c:url value='/market/home'/>'">쇼핑 계속하기</button>
            <button class="cart__bigorderbtn right"  onclick="location.href='<c:url value='/market/order'/>'">주문하기</button>
        </div>
    </section>
	</body>
</html>
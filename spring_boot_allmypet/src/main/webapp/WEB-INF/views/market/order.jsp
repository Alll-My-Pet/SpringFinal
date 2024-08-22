<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/market/order.css'/>" />
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/market/order.js'/>"></script>
</head>
<body>
<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
	<section class="order">
	<form action="<c:url value='/market/order/complete'/>" method="post" onsubmit="return combine()">
	<table class="order_info">
    <colgroup>
        <col style="width: 20%;">
        <col style="width: 80%;">
    </colgroup>
    
        <thead>
            <tr>
                <td class="order_title" colspan="2">주문정보</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>주문자</td>
                <td><input type="text" name="ordName" value="${memVo.memName}"></td>
                <input type="hidden" name="memId" value="${memVo.memId }">
            </tr>
            <tr>
                <td>이메일</td>
                <td>
                    <div class="order_input_container">
                        <input type="text" name="emailUser">@<input type="text" name="emailDomain">
                    </div>
                </td>
            </tr>
            <tr>
                <td>휴대전화</td>
                <td>
                    <div class="order_input_container">
                        <input type="text"  id="phone1" name="phone1">-<input type="text" id="phone2"  name="phone2">
                        -<input type="text"  id="phone3" name="phone3">
                    </div>
                     <input type="hidden" name="ordHP" id="ordHP">
                </td>
            </tr>
        </tbody>
        
        </table>
        <br>
        
        <table class="order_info">
    	<colgroup>
        	<col style="width: 20%;">
        	<col style="width: 80%;">
    	</colgroup>
        <thead>
            <tr>
                <td class="order_title" colspan="2">배송지</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="checkbox">주문자 정보와 동일</td>
                <td><input type="checkbox">직접 입력</td>
            </tr>
            <tr>
                <td>받는사람</td>
                <td><input type="text" class="order_input" name="ordReceiver"></td>
            </tr>
            <tr>
                <td>주소</td>
                <td>
                <input type="text" placeholder="우편번호"><button>주소검색</button><br>
                <input type="text" id="address1" placeholder="기본주소" name="address1"><br>
                <input type="text" id="address2" placeholder="상세주소" name="address2">
                <input type="hidden" name="ordAddress" id="ordAddress">
                </td>
            </tr>
        </tbody>
        	<tr>
				<td colspan="2">
				<select name="ordMsg">
    				<option value="요청사항 없음" selected disabled hidden>배송시 요청사항 선택(필수X)</option>
    				<option value="현관문 앞에 두고 가주세요">현관문 앞에 두고 가주세요</option>
				    <option value="부재 시 경비실에 맡겨 주세요">부재 시 경비실에 맡겨 주세요</option>
    				<option value="택배함에 넣어주세요">택배함에 넣어주세요</option>
				</select>
                </td>
           </tr>
        </table>
        <br>
        
        
        <table class="order_info">
    		<colgroup>
        	<col style="width: 20%;">
        	<col style="width: 80%;">
    	</colgroup>
        <thead>
            <tr>
                <td class="order_title" colspan="2">주문상품</td>
            </tr>
        </thead>
        <tbody>
        	<c:set var = "total" value = "0" />
        	<c:forEach var="car" items="${cartList}">
            <tr>
                <td>
                    <img src="<c:url value='/image/market/${car.product.prdImg }'/>"/>
                </td>
                <td>
                    <div class="order_prdName">${car.product.prdName }</div><br>
                    주문수량 : ${car.cartQty}<br>
                    <div class="order_prdPirce">
                    <fmt:formatNumber value= "${car.product.prdPrice *car.cartQty}" pattern="#,###" />원
                    <c:set var= "total" value="${total + (car.product.prdPrice *car.cartQty)}"/>
                    </div><br>
                    배송비 : 0원
                    <input type="hidden" name="prdNo" value="${car.product.prdNo}"/>
            		<input type="hidden" name="ordQty" value="${car.cartQty}"/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
		</table>
		<br>
		
		<table class="order_info">
    		<colgroup>
        	<col style="width: 20%;">
        	<col style="width: 80%;">
    	</colgroup>
        <thead>
            <tr>
                <td class="order_title" colspan="2">할인/포인트</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>쿠폰할인</td>
                <td>
                    <div class=order_Pirce>0원<button>쿠폰적용</button></div>
                </td>
            </tr>
            <tr>
                <td>포인트</td>
                <td>
                    <div class=order_Pirce>0원<button>포인트사용</button></div>
                </td>
            </tr>
        </tbody>
        <tfooter>
            <tr>
                <td>적용금액</td>
                <td><div class=order_Pirce>-0원</div></td>
            </tr>
            </tfooter>
		</table>
		<br>
		
		<table class="order_info">
    		<colgroup>
        	<col style="width: 20%;">
        	<col style="width: 80%;">
    	</colgroup>
        <thead>
            <tr>
                <td class="order_title" colspan="2">결제정보</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>주문상품</td>
                <td>
                    <div class=order_Pirce>
                    <fmt:formatNumber value= "${total}" pattern="#,###" />원
                    </div>
                </td>
            </tr>
            <tr>
                <td>배송비</td>
                <td>
                    <div class=order_Pirce>0원</div>
                </td>
            </tr>
        </tbody>
        <tfooter>
            <tr>
                <td>할인금액</td>
                <td><div class=order_Pirce>-0원</div></td>
            </tr>
             <tr>
                <td>적립 포인트</td>
                <td><div class=order_Pirce>
					+<fmt:formatNumber value= "${total*0.02}" pattern="#,###" />p
				</div></td>
            </tr>
            <tr>
                <td>총 결제금액</td>
                <td>
                <div class=order_Pirce>
					<fmt:formatNumber value= "${total}" pattern="#,###" />원
					<input type="hidden" name="ordPrice" value="${total}">
				</div>
				</td>
            </tr>
            </tfooter>
		</table>
		<br>
		

	<table class="order_info">
	<colgroup>
        <col style="width: 4%;">
        <col style="width: 96%;">
    </colgroup>
    <thead>
        <tr>
            <td class="order_title" colspan="2">결제수단</td>
        </tr>
    </thead>
    <tbody>
        <tr>
        	<td><input type="checkbox" name="ordPay" value="toss_pay"></td>
            <td class="payment_imagesort">
                <img class="payment_image" src="<c:url value='/image/market/logo-toss-pay.png'/>"/>
            </td>
        </tr>
        <tr>
        	<td><input type="checkbox" name="ordPay" value="kakao_pay"></td>
            <td class="payment_imagesort">
                <img class="payment_image" src="<c:url value='/image/market/payment_icon_yellow_medium.png'/>"/>
            </td>
        </tr>
        <tr>
        	<td><input type="checkbox" name="ordPay" value="naver_pay"></td>
            <td class="payment_imagesort">
                <img class="payment_image" src="<c:url value='/image/market/btn_rd_ext_pay.svg'/>"/>
            </td>
        </tr>
        <tr>
        	<td><input type="checkbox"  name="ordPay" value="creditcard"></td>
            <td class="payment_text">
                카드 결제
            </td>
        </tr>
        <tr>
        	<td><input type="checkbox"  name="ordPay" value="phone"></td>
            <td class="payment_text">
                휴대폰 결제
            </td>
        </tr>
        <tr>
        	<td><input type="checkbox" name="ordPay" value="virtual_account"></td>
            <td class="payment_text">
                가상계좌
            </td>
        </tr>
    </tbody>
</table>
	<br>
	<br>
	<div>
		<button class="paument_button" type="submit">
			<p>${total }원 결제하기</p>
		</button>
	</div>
		</form>
	</section>
<c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>
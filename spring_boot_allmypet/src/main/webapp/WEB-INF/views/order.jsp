<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/order.css'/>" />

</head>
<body>
	<section class="order">
	<table class="order_info">
    <colgroup>
        <col style="width: 20%;">
        <col style="width: 80%;">
    </colgroup>
    <form>
        <thead>
            <tr>
                <td class="order_title" colspan="2">주문정보</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>주문자</td>
                <td><input type="text" class="order_input"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>
                    <div class="order_input_container">
                        <input type="text">@<input type="text">
                    </div>
                </td>
            </tr>
            <tr>
                <td>휴대전화</td>
                <td>
                    <div class="order_input_container">
                        <input type="text">-<input type="text">-<input type="text">
                    </div>
                </td>
            </tr>
        </tbody>
        </form>
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
                <td><input type="text" class="order_input"></td>
            </tr>
            <tr>
                <td>주소</td>
                <td>
                <input type="text" placeholder="우편번호"><button>주소검색</button><br>
                <input type="text" placeholder="기본주소"><br>
                <input type="text" placeholder="상세주소">
                </td>
            </tr>
            <tr>
                <td>휴대전화</td>
                <td>
                    <div class="order_input_container">
                        <input type="text">-<input type="text">-<input type="text">
                    </div>
                </td>
            </tr>
        </tbody>
        	<tr>
				<td colspan="2">
				<select>
					<option value="1" selected disabled hidden>메시지 선택(예시:현관문 앞에 두고 가주세요)</option>
					<option value="2">현관문 앞에 두고 가주세요</option>
					<option value="3">부재 시 경비실에 맡겨 주세요</option>
					<option value="4">택배함에 넣어주세요</option>
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
            <tr>
                <td>
                <img src="<c:url value='/image/logo.png'/>"/>
                </td>
                <td>
                    <div class="order_prdName">제품명(${prdVo.prdName})</div><br>
                    주문수량 :(${cartVo.cartQty})<br>
                    <div class="order_prdPirce">(${prdVo.prdPrice}*${cartVo.cartQty})원</div><br>
                    배송비 : 0원
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
                    <div class=order_Pirce>0원</div>
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
                <td><div class=order_Pirce>+0p</div></td>
            </tr>
            <tr>
                <td>총 결제금액</td>
                <td><div class=order_Pirce>0원</div></td>
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
        	<td><input type="checkbox"></td>
            <td class="payment_imagesort">
                <img class="payment_image" src="<c:url value='/image/logo-toss-pay.png'/>"/>
            </td>
        </tr>
        <tr>
        	<td><input type="checkbox"></td>
            <td class="payment_imagesort">
                <img class="payment_image" src="<c:url value='/image/payment_icon_yellow_medium.png'/>"/>
            </td>
        </tr>
        <tr>
        	<td><input type="checkbox"></td>
            <td class="payment_imagesort">
                <img class="payment_image" src="<c:url value='/image/btn_rd_ext_pay.svg'/>"/>
            </td>
        </tr>
        <tr>
        	<td><input type="checkbox"></td>
            <td class="payment_text">
                카드 결제
            </td>
        </tr>
        <tr>
        	<td><input type="checkbox"></td>
            <td class="payment_text">
                휴대폰 결제
            </td>
        </tr>
        <tr>
        	<td><input type="checkbox"></td>
            <td class="payment_text">
                가상계좌
            </td>
        </tr>
    </tbody>
</table>
	<br>
	<br>
	<div>
		<button class="paument_button" onclick="location.href='<c:url value='/market/order/complete'/>'">
			<p>0원 결제하기</p>
		</button>
	</div>
		
	</section>

</body>
</html>
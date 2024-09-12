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
<script src="<c:url value='/js/market/jquery-3.7.1.min.js'/>"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
const ptotal = ${ptotal};  // JSP에서 포인트 최대값 설정
const total = ${total};   // JSP에서 총 결제 금액 설정
</script>
<script src="<c:url value='/js/market/order.js'/>"></script>
</head>
<body>
<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
	<section class="order">
	<form action="<c:url value='/market/order/completeInstantOrder'/>" method="post">
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
                <td>받는사람</td>
                <td><input type="text" class="order_input" name="ordReceiver"></td>
            </tr>
            <tr>
                <td>주소</td>
                <td>
                <input type="button" id="addressSearchButton" onclick="sample4_execDaumPostcode()" value="주소 찾기"><br>
                <input type="text" id="sample4_postcode" placeholder="우편번호">
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
				<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress" placeholder="상세주소">
				<input type="text" id="sample4_extraAddress" placeholder="참고항목">
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
        	
            <tr>
                <td>
                    <img src="<c:url value='/image/market/${prd.prdImg }'/>"/>
                </td>
                <td>
                    <div class="order_prdName">${prd.prdName}</div><br>
                    주문수량 : ${cartQty}<br>
                    <div class="order_prdPirce">
                    <fmt:formatNumber value= "${prd.prdPrice *cartQty}" pattern="#,###" />원
                    <c:set var= "total" value="${total + (prd.prdPrice *cartQty)}"/>
                    </div><br>
                    배송비 : 0원
                    <input type="hidden" name="prdNo" value="${prd.prdNo}"/>
            		<input type="hidden" name="ordQty" value="${cartQty}"/>
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
			        <div class="order_Price">
			            <span id="couponDiscount">0원</span>
			            <button type="button" onclick="openCouponPopup()">쿠폰적용</button>
			        </div>
			        <!-- 쿠폰 ID를 저장할 숨김 필드 추가 -->
			        <input type="hidden" id="selectedCouponId" name="couponId" value="">
			    </td>
			</tr>
            <tr>
                <td>포인트</td>
                <td>
                    <c:set var="ptotal" value="0" />
                    <c:forEach items="${point}" var="p">
                        <c:set var="ptotal" value="${ptotal + p.point_change}" />
                    </c:forEach>
				    
					<div class="point">
					    사용할 포인트:
					    <input type="number" id="points" name="points" min="0" max="${ptotal}" value="0" oninput="updateDiscount()" onfocus="showMaxPoints()" onkeydown="preventEnter(event)" required />
					    <div id="maxPointsMessage" style="color: gray; display: none;"></div>
					</div>
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
                <td class="order_title" colspan="2">결제정보</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>주문상품</td>
                <td>
                    <div class=order_Price>
                    <fmt:formatNumber value= "${total}" pattern="#,###" />원
                    </div>
                </td>
            </tr>
            <tr>
                <td>배송비</td>
                <td>
                    <div class=order_Price>0원</div>
                </td>
            </tr>
        </tbody>
        <tfooter>
            <tr>
                <td>할인금액</td>
                <td>
                	<div class="order_Price" id="discountAmount"></div>
                </td>
            </tr>
             <tr>
                <td>적립 포인트</td>
                <td><div class="order_Price">
					+<fmt:formatNumber value= "${total*0.02}" pattern="#,###" />p
				</div></td>
            </tr>
            <tr>
                <td>결제금액</td>
	            <td>
	                <div class="order_Price" id="finalAmount">
	                    <fmt:formatNumber value="${total}" pattern="#,###" />원
	                </div>
	                <input type="hidden" name="ordPrice" id="ordPrice" value="${total}">
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
		<button class="paument_button" type="submit" >
			<p>결제하기</p>
		</button>
	</div>
		</form>
	</section>
<c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>
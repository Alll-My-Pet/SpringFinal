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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                        <input type="text" name="emailUser" id="emailUser">
                        @
                        <input type="text" name="emailDomain" id="emailDomain">
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
	                    <input type="number" id="points" name="points" min="1" max="${ptotal}" oninput="updateDiscount()" onfocus="showMaxPoints()" onkeydown="preventEnter(event)" required />
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
<script>
const ptotal = ${ptotal};  // 최대 사용할 수 있는 포인트
const total = ${total};  // 서버에서 전달된 총 결제 금액 (기본값)
let discountValue = 0;   // 할인 금액 초기화




//포인트 입력 시 총 결제 금액 업데이트
function updateDiscount() {
    const points = document.getElementById('points').value;  // 입력된 포인트 값

    // 포인트가 유효한 범위인지 확인
    if (points >= 1 && points <= ${ptotal}) {
        discountValue = points;  // 유효하면 포인트로 할인 금액 설정
    } else {
        discountValue = 0;  // 유효하지 않으면 할인 금액 0으로 설정
    }

    // 할인 금액을 HTML에 업데이트
    document.getElementById('discountAmount').innerText = "-"+discountValue+"원";

    
    // 총 결제 금액을 업데이트 (total에서 discountValue를 뺌)
    const finalAmount = total - discountValue;

    // 최종 금액을 HTML에 업데이트
    document.getElementById('finalAmount').innerText = finalAmount.toLocaleString() + "원";
    document.getElementById('ordPrice').value = finalAmount;  // hidden input 값도 업데이트
}

// 포인트 입력칸을 클릭할 때 최대 사용 가능한 포인트 메시지를 표시
function showMaxPoints() {
    const maxPoints = ${ptotal};  // 최대 사용 가능한 포인트 값
    const messageDiv = document.getElementById('maxPointsMessage');
    
    // 메시지 표시
    messageDiv.innerText = `최대 ${ptotal}포인트`;
    messageDiv.style.display = 'block';  // 메시지 표시
}

//페이지 로드 시 최대 포인트 표시
window.onload = function() {
    showMaxPoints();
};


// 엔터키 입력 방지
function preventEnter(event) {
    if (event.key === 'Enter') {
        event.preventDefault();  // 기본 동작(폼 제출)을 막음
    }
}

$(document).ready(function() {
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소
                var extraRoadAddr = ''; // 참고 항목

                // 법정동명 추가
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }

                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('sample4_postcode').value = data.zonecode; // 우편번호
                document.getElementById("sample4_roadAddress").value = roadAddr; // 도로명 주소
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress; // 지번 주소

                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr; // 참고 항목
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }

    // 주소 검색 버튼 클릭 시 Daum API 호출
    $('#addressSearchButton').on('click', function() {
        sample4_execDaumPostcode();
    });
    
});
function openCouponPopup() {
    // 팝업 창을 열어 쿠폰 UI를 표시
    window.open('/market/couponUI', 'couponPopup', 'width=600,height=600');
}

//쿠폰 선택 시 호출되는 함수
function applyCoupon(discountRate, couponId) {
    // 할인 비율을 계산하고 쿠폰 ID를 hidden 필드에 저장
    let discountAmount = total * (discountRate / 100); // 할인 금액 계산
    discountValue = discountAmount;  // 포인트와 동일한 변수에 저장

    // 쿠폰 할인 적용 UI 업데이트
    document.getElementById('couponDiscount').innerText = discountRate + "% 할인 적용";
    document.getElementById('discountAmount').innerText = "- " + discountAmount.toLocaleString() + "원";

    // 총 결제 금액 업데이트
    const finalAmount = total - discountValue;
    document.getElementById('finalAmount').innerText = finalAmount.toLocaleString() + "원";
    document.getElementById('ordPrice').value = finalAmount;  // hidden input 값도 업데이트

    // 선택한 쿠폰 ID를 hidden 필드에 저장
    document.getElementById('selectedCouponId').value = couponId;

    // 포인트 입력 비활성화
    document.getElementById('points').disabled = true;

    // 디버깅 로그 추가
    console.log("Coupon applied with discount rate: " + discountRate + "%, coupon ID: " + couponId);
}


function updateDiscount() {
    const points = document.getElementById('points').value;  // 입력된 포인트 값

    // 포인트가 입력되면 쿠폰 적용 버튼 비활성화
    if (points >= 1 && points <= ${ptotal}) {
        discountValue = points;  // 유효하면 포인트로 할인 금액 설정
        document.querySelector('.order_Price button').disabled = true;  // 쿠폰 적용 버튼 비활성화
    } else {
        discountValue = 0;  // 유효하지 않으면 할인 금액 0으로 설정
        document.querySelector('.order_Price button').disabled = false;  // 쿠폰 적용 버튼 활성화
    }

    document.getElementById('discountAmount').innerText = "-" + discountValue + "원";
    const finalAmount = total - discountValue;
    document.getElementById('finalAmount').innerText = finalAmount.toLocaleString() + "원";
    document.getElementById('ordPrice').value = finalAmount;
}
</script>
</html>
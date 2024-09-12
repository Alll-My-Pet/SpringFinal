<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문 취소</title>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/market/order_cancel.css'/>" />
	</head>
<body>
    <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>

    <div class="order-container">
        <br><br>
        <div class="header">
            <h1>주문 취소</h1>
        </div>

        <!-- 주문 상품 목록 반복 출력 -->
        
            <div class="order">
                <h3>취소 대상 상품</h3>
                <c:forEach var="orderProduct" items="${orderProducts}">
                <div class="product-info">
                	
                    <img class="order_image" src="<c:url value='/image/market/${orderProduct.productDetails.prdImg}'/>" />
                    <p>${orderProduct.productDetails.prdName}
                    <br>
                    <fmt:formatNumber value="${orderProduct.productDetails.prdPrice}" pattern="#,###" />원
                    <br>
                    ${orderProduct.ordQty}개<br>
                </div>
				</c:forEach>
            </div>
        
        <!-- 취소 사유 폼 -->
        <div class="order">
            <h3>취소 사유</h3>
            <form action="${pageContext.request.contextPath}/orderCancelSubmit" method="post">
			<input type="hidden" name="ordNo" value="${ordInfo.ordNo}" />
			<input type="hidden" name="memId" value="${ordInfo.memId}" />
			<input type="hidden" name="ordPrice" value="${ordInfo.ordPrice}" />
			<input type="hidden" name="ordDate" value="${ordInfo.ordDate}" />

                <!-- 필수 데이터: prdNo, ordQty, ordPrice도 여러 개일 경우 각각 전송 -->
                <c:forEach var="orderProduct" items="${orderProducts}">
                    <input type="hidden" name="prdNo" value="${orderProduct.prdNo}" />
                    <input type="hidden" name="ordQty" value="${orderProduct.ordQty}" />
                    
                </c:forEach>

                <!-- 취소 사유 선택 -->
                <label>
                    <input type="radio" name="canReason" value="상품이 마음에 들지 않음 (단순 변심)"> 상품이 마음에 들지 않음 (단순 변심)
                </label><br>
                <label>
                    <input type="radio" name="canReason" value="옵션/수량을 잘못 선택함 (주문실수)"> 옵션/수량을 잘못 선택함 (주문실수)
                </label><br>
                <label>
                    <input type="radio" name="canReason" value="다른 상품 추가 후 재주문 예정"> 다른 상품 추가 후 재주문 예정
                </label><br>
                <!-- 자유 입력 사유 추가 -->
                <label>
                    <input type="radio" name="canReason" value="기타"> 기타:
                </label>
                <textarea name="otherReason" rows="3" cols="50" placeholder="기타 사유를 입력해주세요"></textarea><br>

                <!-- 주문 취소 버튼 -->
                <button class="cancel-button" type="submit">주문 취소 신청</button>
            </form>
        </div>
    </div>

    <c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문 취소</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/market/order_cancel.css'/>" />
    <script>
        function showCancelComplete() {
            document.getElementById("cancelCompleteBox").style.display = "block";
        }
    </script>
</head>
<body>
<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>

    <div class="order-container">
        <div class="header">
            <h1>주문 취소</h1>
        </div>
        <div class="order">
            <p>주문번호: 10XXXXXXXXX</p>
	        <p>상품명: 고양이낚시대</p>
	        <p>주문취소일자: 20XX.XX.XX</p>
	        <h3>주문 취소 완료</h3>
        </div>
        <button class="cancel-button" onclick="showCancelComplete()">주문 취소 신청</button>
    </div>

    <c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>
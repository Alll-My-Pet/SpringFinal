<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>결제내역</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/market/order.css'/>" />
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
	</head>
	<body>
	<section class="order">
		<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
		<table class="order_info">
    <colgroup>
        <col style="width: 20%;">
        <col style="width: 80%;">
    </colgroup>
    
        <thead>
            <tr>
                <td class="order_title" colspan="2">결제 내역</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>주문번호</td>
                <td>${ord.ordNo }</td>
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
		<c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
		</section>
	</body>
</html>
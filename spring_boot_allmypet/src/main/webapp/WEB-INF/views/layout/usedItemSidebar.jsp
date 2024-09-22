<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="icon" type="image/png" href="#" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/layout/usedItemSidebar.css'/>">
    <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
</head>
<body>
	<div class="menu">
        <div class="menu-header">
            중고거래
        </div>
        <hr>
        <div class="menu-section">
            <div class="menu-item">
                <a href="/usedItem" class="menu-link">
                    <span>
                        팝니다
                    </span>
                </a>
            </div>
            <hr>
            <div class="menu-item">
                <a href="/usedItemBuy" class="menu-link">
                    <span>
                        삽니다
                    </span>
                </a>
            </div>
    	</div>
    </div>
</body>
</html>
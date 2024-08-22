<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/product.css'/>" />
	<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
	<!--<script src="<c:url value='/js/list.js'/>"></script> -->
</head>
<body>
    <section class="product">
            <h2>반려동물 마켓</h2>
            <div class="card-container">
        <div class="row"> <!-- 행 시작 -->
            <div class="col-sm-3 mb-3"> <!-- 첫 번째 카드 -->
                <a href="#" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/ctg_강아지.png'/>" class="card-img-top" alt="..." width="80px" height="80px">
                        <div class="card-body">
                            <h5 class="card-title">강아지</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 두 번째 카드 -->
                <a href="#" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/ctg_고양이.png'/>" class="card-img-top" alt="..." width="60px" height="60px">
                        <div class="card-body">
                            <h5 class="card-title">고양이</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 세 번째 카드 -->
                <a href="#" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/ctg_기타포유류.png'/>" class="card-img-top" alt="..." width="80px">
                        <div class="card-body">
                            <h5 class="card-title">기타 포유류</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 네 번째 카드 -->
                <a href="#" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/ctg_파충양서류.png'/>" class="card-img-top" alt="..." width="80px">
                        <div class="card-body">
                            <h5 class="card-title">파충류/양서류</h5>
                        </div>
                    </div>
                </a>
            </div>
        </div> <!-- 첫 번째 행 끝 -->
    
        <div class="row"> <!-- 두 번째 행 시작 -->
            <div class="col-sm-3 mb-3"> <!-- 다섯 번째 카드 -->
                <a href="#" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/ctg_어류.png'/>" class="card-img-top" alt="..." width="80px">
                        <div class="card-body">
                            <h5 class="card-title">어류</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 여섯 번째 카드 -->
                <a href="#" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/ctg_조류.png'/>" class="card-img-top" alt="..." width="55px">
                        <div class="card-body">
                            <h5 class="card-title">조류</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 일곱 번째 카드 -->
                <a href="#" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/ctg_설치류.png'/>" class="card-img-top" alt="..." width="70px">
                        <div class="card-body">
                            <h5 class="card-title">설치류</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 여덟 번째 카드 -->
                <a href="#" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/ctg_절지곤충류.png'/>" class="card-img-top" alt="..." width="80px">
                        <div class="card-body">
                            <h5 class="card-title">절지류/곤충류</h5>
                        </div>
                    </div>
                </a>
            </div>
        </div> <!-- 두 번째 행 끝 -->
    </div>
            <div class="filter-grid">
                <input type="checkbox" name="snack">반려동물식품
                <input type="checkbox" name="toy">장난감
                <input type="checkbox" name="bath">목욕용품
                <input type="checkbox" name="farm">사육장
                
            </div>
            <p class="product_total">전체상품 000개</p>
            
            <div class="product-grid">
            <c:forEach items="${prdList }" var="prd">
            <a class="product-item" data-type="${prd.prdCtgNo}" href="<c:url value='/market/product/detail/${prd.prdNo}'/>">
                    <img class="product-image" src="<c:url value='/image/${prd.prdImg }'/>"/>
                    <div class="product-name">${prd.prdName }</div>
                    <div class="product-price"><fmt:formatNumber value= "${prdVo.prdPrice}" pattern="#,###" />원</div>
            </a>
            </c:forEach>
            </div>
        </section>
</body>
</html>
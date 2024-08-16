<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/product.css'/>" />
</head>
<body>
    <div class="product">
        <div class="section">
            <div class="card-container">
            <h2>반려동물 굿즈</h2>
    <div class="row"> <!-- 행 시작 -->
            <div class="col-sm-3 mb-3"> <!-- 첫 번째 카드 -->
                <a href="#" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/앨범.png'/>" class="card-img-top" alt="..." width="80px" height="80px">
                        <div class="card-body">
                            <h5 class="card-title">앨범</h5>
                        </div>
                       
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 두 번째 카드 -->
                <a href="#" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/액자.png'/>" class="card-img-top" alt="..." width="60px" height="60px">
                        <div class="card-body">
                            <h5 class="card-title">액자</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 세 번째 카드 -->
                <a href="#" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/키링.png'/>" class="card-img-top" alt="..." width="80px">
                        <div class="card-body">
                            <h5 class="card-title">키링</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 네 번째 카드 -->
                <a href="#" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/달력.png'/>" class="card-img-top" alt="..." width="80px">
                        <div class="card-body">
                            <h5 class="card-title">달력</h5>
                        </div>
                    </div>
                </a>
            </div>
            </div>
            <br><br><br>
        </div> <!-- 첫 번째 행 끝 -->
            <p class="product_total">전체상품 000개</p>
            
            <div class="product-grid">
                <a class="product-item" href="<c:url value='/market/goods/detail'/>">
                    <img class="product-image" src="<c:url value='/image/logo.png'/>"/>
                    <div class="product-name">상품명</div>
                    <div class="product-price">가격</div>
            </a>
                <div class="product-item">
                    <div class="product-image">상품 이미지</div>
                    <div class="product-name">상품명</div>
                    <div class="product-price">가격</div>
                </div>
                <div class="product-item">
                    <div class="product-image">상품 이미지</div>
                    <div class="product-name">상품명</div>
                    <div class="product-price">가격</div>
                </div>
                <div class="product-item">
                    <div class="product-image">상품 이미지</div>
                    <div class="product-name">상품명</div>
                    <div class="product-price">가격</div>
                </div>
                <div class="product-item">
                    <div class="product-image">상품 이미지</div>
                    <div class="product-name">상품명</div>
                    <div class="product-price">가격</div>
                </div>
                <div class="product-item">
                    <div class="product-image">상품 이미지</div>
                    <div class="product-name">상품명</div>
                    <div class="product-price">가격</div>
                </div>
                <div class="product-item">
                    <div class="product-image">상품 이미지</div>
                    <div class="product-name">상품명</div>
                    <div class="product-price">가격</div>
                </div>
                <div class="product-item">
                    <div class="product-image">상품 이미지</div>
                    <div class="product-name">상품명</div>
                    <div class="product-price">가격</div>
                </div>
                <div class="product-item">
                    <div class="product-image">상품 이미지</div>
                    <div class="product-name">상품명</div>
                    <div class="product-price">가격</div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
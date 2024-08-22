<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>반려동물 페이지</title>
  		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
    	<link rel="stylesheet" type="text/css" href="<c:url value='/css/market/market_home.css'/>" />
</head>
<body>
<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
    <section class="market_home">
        <p class="home_title">반려동물 용품</p>
            <div class="card-container">
        <div class="row"> <!-- 행 시작 -->
            <div class="col-sm-3 mb-3"> <!-- 첫 번째 카드 -->
                <a href="<c:url value='/market/product'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/ctg_강아지.png'/>" class="card-img-top" alt="..." width="80px" height="80px">
                        <div class="card-body">
                            <h5 class="card-title">강아지</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 두 번째 카드 -->
                <a href="<c:url value='/market/product'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/ctg_고양이.png'/>" class="card-img-top" alt="..." width="60px" height="60px">
                        <div class="card-body">
                            <h5 class="card-title">고양이</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 세 번째 카드 -->
                <a href="<c:url value='/market/product'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/ctg_기타포유류.png'/>" class="card-img-top" alt="..." width="80px">
                        <div class="card-body">
                            <h5 class="card-title">기타 포유류</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 네 번째 카드 -->
                <a href="<c:url value='/market/product'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/ctg_파충양서류.png'/>" class="card-img-top" alt="..." width="80px">
                        <div class="card-body">
                            <h5 class="card-title">파충류/양서류</h5>
                        </div>
                    </div>
                </a>
            </div>
        </div> <!-- 첫 번째 행 끝 -->
    
        <div class="row"> <!-- 두 번째 행 시작 -->
            <div class="col-sm-3 mb-3"> <!-- 다섯 번째 카드 -->
                <a href="<c:url value='/market/product'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/ctg_어류.png'/>" class="card-img-top" alt="..." width="80px">
                        <div class="card-body">
                            <h5 class="card-title">어류</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 여섯 번째 카드 -->
                <a href="<c:url value='/market/product'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/ctg_조류.png'/>" class="card-img-top" alt="..." width="55px">
                        <div class="card-body">
                            <h5 class="card-title">조류</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 일곱 번째 카드 -->
                <a href="<c:url value='/market/product'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/ctg_설치류.png'/>" class="card-img-top" alt="..." width="70px">
                        <div class="card-body">
                            <h5 class="card-title">설치류</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 여덟 번째 카드 -->
                <a href="<c:url value='/market/product'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/ctg_절지곤충류.png'/>" class="card-img-top" alt="..." width="80px">
                        <div class="card-body">
                            <h5 class="card-title">절지류/곤충류</h5>
                        </div>
                    </div>
                </a>
            </div>
        </div> <!-- 두 번째 행 끝 -->
        <br><br>
    <p class="home_title">반려동물 굿즈</p>
    <div class="row"> <!-- 행 시작 -->
            <div class="col-sm-3 mb-3"> <!-- 첫 번째 카드 -->
                <a href="<c:url value='/market/goods'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/앨범.png'/>" class="card-img-top" alt="..." width="80px" height="80px">
                        <div class="card-body">
                            <h5 class="card-title">앨범</h5>
                        </div>
                        
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 두 번째 카드 -->
                <a href="<c:url value='/market/goods'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/액자.png'/>" class="card-img-top" alt="..." width="60px" height="60px">
                        <div class="card-body">
                            <h5 class="card-title">액자</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 세 번째 카드 -->
                <a href="<c:url value='/market/goods'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/키링.png'/>" class="card-img-top" alt="..." width="80px">
                        <div class="card-body">
                            <h5 class="card-title">키링</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 네 번째 카드 -->
                <a href="<c:url value='/market/goods'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/달력.png'/>" class="card-img-top" alt="..." width="80px">
                        <div class="card-body">
                            <h5 class="card-title">달력</h5>
                        </div>
                    </div>
                </a>
            </div>
        </div> <!-- 첫 번째 행 끝 -->
    
    </div>
        
    </section>
    <c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마켓</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/market/product.css'/>" />
	<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
	<style>
	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic&display=swap');
	</style>
</head>
<body>
<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
    <section class="product">
            <h2>반려동물 마켓</h2>
            <div class="card-container">
        <div class="row"> <!-- 행 시작 -->
            <div class="col-sm-3 mb-3"> <!-- 첫 번째 카드 -->
                <a href="<c:url value='/market/product?petCtgNo=1'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/ctg_강아지.png'/>" class="card-img-top" alt="..." width="80px" height="80px">
                        <div class="card-body">
                            <h5 class="card-title">강아지</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 두 번째 카드 -->
                <a href="<c:url value='/market/product?petCtgNo=2'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/ctg_고양이.png'/>" class="card-img-top" alt="..." width="60px" height="60px">
                        <div class="card-body">
                            <h5 class="card-title">고양이</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 세 번째 카드 -->
                <a href="<c:url value='/market/product?petCtgNo=3'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/ctg_기타포유류.png'/>" class="card-img-top" alt="..." width="80px">
                        <div class="card-body">
                            <h5 class="card-title">기타 포유류</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 네 번째 카드 -->
                <a href="<c:url value='/market/product?petCtgNo=4'/>" class="card-link">
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
                <a href="<c:url value='/market/product?petCtgNo=5'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/ctg_어류.png'/>" class="card-img-top" alt="..." width="80px">
                        <div class="card-body">
                            <h5 class="card-title">어류</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 여섯 번째 카드 -->
                <a href="<c:url value='/market/product?petCtgNo=6'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/ctg_조류.png'/>" class="card-img-top" alt="..." width="55px">
                        <div class="card-body">
                            <h5 class="card-title">조류</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 일곱 번째 카드 -->
                <a href="<c:url value='/market/product?petCtgNo=7'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/ctg_설치류.png'/>" class="card-img-top" alt="..." width="70px">
                        <div class="card-body">
                            <h5 class="card-title">설치류</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 여덟 번째 카드 -->
                <a href="<c:url value='/market/product?petCtgNo=8'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/image/market/ctg_절지곤충류.png'/>" class="card-img-top" alt="..." width="80px">
                        <div class="card-body">
                            <h5 class="card-title">절지류/곤충류</h5>
                        </div>
                    </div>
                </a>
            </div>
        </div> <!-- 두 번째 행 끝 -->
    </div>
            <div class="filter-grid">
			    <label><input type="checkbox" name="prdCtgNo" value="1" 
			        onchange="filterProducts()" 
			        <c:if test="${fn:contains(param.prdCtgNo, '1')}">checked</c:if>
			    >반려동물식품</label>
			    
			    <label><input type="checkbox" name="prdCtgNo" value="2" 
			        onchange="filterProducts()" 
			        <c:if test="${fn:contains(param.prdCtgNo, '2')}">checked</c:if>
			    >장난감</label>
			    
			    <label><input type="checkbox" name="prdCtgNo" value="3" 
			        onchange="filterProducts()" 
			        <c:if test="${fn:contains(param.prdCtgNo, '3')}">checked</c:if>
			    >목욕용품</label>
			    
			    <label><input type="checkbox" name="prdCtgNo" value="4" 
			        onchange="filterProducts()" 
			        <c:if test="${fn:contains(param.prdCtgNo, '4')}">checked</c:if>
			    >사육장</label>
			    
			    <button onclick="showAllProducts()">전체목록 보기</button>
			</div>
            
            <div class="product-grid">
            <c:forEach items="${prdList }" var="prd">
            <a class="product-item" data-type="${prd.prdCtgNo}" href="<c:url value='/market/product/detail/${prd.prdNo}'/>">
                    <img class="product-image" src="<c:url value='/prd_images/${prd.prdImg }'/>"/>
                    <div class="product-name">${prd.prdName }</div>
                    <div class="product-price"><fmt:formatNumber value= "${prd.prdPrice}" pattern="#,###" />원</div>
            </a>
            </c:forEach>
            </div>
        </section>
        <c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
<script>
function filterProducts() {
    const petCtgNo = new URLSearchParams(window.location.search).get('petCtgNo');
    const prdCtgNo = Array.from(document.querySelectorAll('input[name="prdCtgNo"]:checked'))
                        .map(cb => cb.value)
                        .join(',');

    let url = '/market/product';
    if (petCtgNo) {
        url += '?petCtgNo=' + petCtgNo;
    }
    if (prdCtgNo) {
        url += (petCtgNo ? '&' : '?') + 'prdCtgNo=' + prdCtgNo;
    }
    window.location.href = url;
}

function showAllProducts() {
    let url = '/market/product';
    
    window.location.href = url; 
}
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/market/product.css'/>" />
	<style>
	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic&display=swap');
	</style>
</head>
<body>
<c:import url = "/WEB-INF/views/layout/header.jsp"></c:import>
    <div class="product">
        <div class="section">
            <div class="card-container">
            <h2>반려동물 굿즈</h2>
    <div class="row"> <!-- 행 시작 -->
            <div class="col-sm-3 mb-3"> <!-- 첫 번째 카드 -->
                <a href="<c:url value='/market/goods?prdCtgNo=5'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/prd_images/앨범.png'/>" class="card-img-top" alt="..." width="80px" height="80px">
                        <div class="card-body">
                            <h5 class="card-title">앨범</h5>
                        </div>
                       
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 두 번째 카드 -->
                <a href="<c:url value='/market/goods?prdCtgNo=6'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/prd_images/액자.png'/>" class="card-img-top" alt="..." width="60px" height="60px">
                        <div class="card-body">
                            <h5 class="card-title">액자</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 세 번째 카드 -->
                <a href="<c:url value='/market/goods?prdCtgNo=7'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/prd_images/키링.png'/>" class="card-img-top" alt="..." width="80px">
                        <div class="card-body">
                            <h5 class="card-title">키링</h5>
                        </div>
                    </div>
                </a>
            </div>
    
            <div class="col-sm-3 mb-3"> <!-- 네 번째 카드 -->
                <a href="<c:url value='/market/goods?prdCtgNo=8'/>" class="card-link">
                    <div class="card">
                        <img src="<c:url value='/prd_images/달력.png'/>" class="card-img-top" alt="..." width="80px">
                        <div class="card-body">
                            <h5 class="card-title">달력</h5>
                        </div>
                    </div>
                </a>
            </div>
            </div>
             <button onclick="showAllProducts()">전체목록 보기</button>
            <br><br><br>
        </div> <!-- 첫 번째 행 끝 -->
            
            
            <div class="product-grid">
            <c:forEach items="${prdList }" var="prd">
            <a class="product-item" data-type="${prd.prdCtgNo}" href="<c:url value='/market/product/detail/${prd.prdNo}'/>">
                    <img class="product-image" src="<c:url value='/prd_images/${prd.prdImg }'/>"/>
                    <div class="product-name">${prd.prdName }</div>
                    <div class="product-price"><fmt:formatNumber value= "${prd.prdPrice}" pattern="#,###" />원</div>
            </a>
            </c:forEach>
            </div>
        </div>
    </div>
    <c:import url = "/WEB-INF/views/layout/footer.jsp"></c:import>
</body>
<script>
function filterProducts() {
    const prdCtgNo = Array.from(document.querySelectorAll('input[name="prdCtgNo"]:checked'))
                        .map(cb => cb.value)
                        .join(',');

    let url = '/market/goods';
    if (prdCtgNo) {
        url += '?prdCtgNo=' + prdCtgNo;
    }
    window.location.href = url;
}

function showAllProducts() {
    let url = '/market/goods';
    
    window.location.href = url; 
}
</script>
</html>
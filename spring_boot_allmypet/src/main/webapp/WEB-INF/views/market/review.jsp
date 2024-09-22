<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>리뷰작성</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/market/order_cancel.css'/>" />
		<script>
			// 이미지 미리보기 함수
			function previewImage(event) {
				const reader = new FileReader();
				reader.onload = function() {
					const output = document.getElementById('previewImg');
					output.src = reader.result; // 업로드한 이미지 파일의 URL을 img 태그에 설정
				};
				reader.readAsDataURL(event.target.files[0]); // 첫 번째 파일을 읽어 미리보기
			}
		</script>
		<style>
		@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic&display=swap');
		</style>
	</head>
<body>
    <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
	
    <div class="order-container">
        <br><br>
        <div class="header">
            <h1>리뷰 작성</h1>
        </div>
        <div class="order">
                <h3>상품 정보</h3>
        <div class="product-info">
            <img class="order_image" src="<c:url value='/image/market/${productDetails.prdImg}'/>" />
            <p>${productDetails.prdName}
            <br>
            <fmt:formatNumber value="${productDetails.prdPrice}" pattern="#,###" />원
            <br>
        </div>
        </div>
        
		<form action="/market/insertReview" method="post" enctype="multipart/form-data">
	        <input type="hidden" name="memId" value="${memId}" />
	        <input type="hidden" name="prdNo" value="${prdNo}" />
	        <input type="hidden" name="ordNo" value="${ordNo}" />
	        
	<table class="order_info">
    <colgroup>
        <col style="width: 20%;">
        <col style="width: 80%;">
    </colgroup>
        <tbody>
            <tr>
                <td>리뷰 이미지</td>
                <td>
                	<input type="file" name="revImg" id="revImg" onchange="previewImage(event)">
                	<img id="previewImg" src="#" alt="미리보기 이미지" style="display: none; max-width: 300px; max-height: 300px;"/>
                </td>
                
            </tr>
            <tr>
                <td>리뷰 내용</td>
                <td>
                    <textarea id="revText" name="revText" rows="4" cols="50" required></textarea>
                </td>
            </tr>
            <tr>
                <td>평점</td>
                <td>
                    <select id="revSco" name="revSco" required>
		                <option value="1">1점</option>
		                <option value="2">2점</option>
		                <option value="3">3점</option>
		                <option value="4">4점</option>
		                <option value="5">5점</option>
		            </select>
                </td>
            </tr>
        </tbody>
        </table>
        <button class="custom-btn btn-1" type="submit">리뷰 제출</button>
        
        </form>
    </div>
    <c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>

    <script>
        // 파일 선택 시 이미지 미리보기 활성화
        document.getElementById('revImg').addEventListener('change', function(event) {
            const previewImg = document.getElementById('previewImg');
            const file = event.target.files[0];

            if (file) {
                previewImg.style.display = 'block'; // 이미지가 있으면 표시
                previewImage(event); // 미리보기 호출
            } else {
                previewImg.style.display = 'none'; // 선택된 파일이 없으면 숨김
            }
        });
    </script>
</body>
</html>
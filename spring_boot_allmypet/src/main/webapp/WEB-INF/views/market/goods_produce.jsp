<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>굿즈 제작 페이지</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/goods_produce.css'/>" />
    <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
    <script src="<c:url value='/js/goods_produce.js'/>"></script>
</head>
<body>
    <div class="container">
        <h1>굿즈 제작하기</h1>
        
        <div class="upload-section">
            <h2>이미지 업로드</h2>
            <input type="file" id="imageUpload" accept="image/*">
        </div>

        <div class="product-type-section">
            <h2>굿즈 종류 선택</h2>
            <select id="productType">
                <option value="keyring">키링</option>
                <option value="album">앨범</option>
                <option value="frame">액자</option>
            </select>
        </div>

        <div class="preview-section">
            <h2>미리보기</h2>
            <div class="preview-container">
                <img id="imagePreview" src="" alt="미리보기 이미지">
                <div id="productPreviewText">굿즈 미리보기</div>
            </div>
        </div>

        <div class="create-section">
            <button id="createButton">굿즈 만들기</button>
        </div>
    </div>
</body>
</html>
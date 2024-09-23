<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 작성 페이지</title>
    <link rel="shortcut icon" type="image/x-icon" href="data:image/x-icon;,">
    <link rel="stylesheet" type="text/css"
        href="<c:url value='/css/common.css'/>">
    <link rel="stylesheet" type="text/css"
        href="<c:url value='/css/gallery/gallery_form.css' />" />
    <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
    <script src="<c:url value='/js/gallery/gallery_form.js'/>"></script>
    <style>
	@import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic&display=swap');
	</style>
</head>
<body>
    <div class="desktop-1">
        <div class="frame-1">
            <div class="frame-2">
                <!-- header -->
                <div id="header">
                    <c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
                </div>
                <div class="contents">
                    <section class="writeTextArea">
                        <div class="pageInfo">
                            <div class="bracket">
                                <img src="/image/index/bracket-light-left.svg" class="bLeft"
                                    alt="..." style="height: 128px;">
                            </div>
                            <c:set var="categoryName">
                                <c:choose>
                                    <c:when test="${petCtgNo == 1}">강아지</c:when>
                                    <c:when test="${petCtgNo == 2}">고양이</c:when>
                                    <c:when test="${petCtgNo == 3}">기타 포유류</c:when>
                                    <c:when test="${petCtgNo == 4}">파충류/양서류</c:when>
                                    <c:when test="${petCtgNo == 5}">어류</c:when>
                                    <c:when test="${petCtgNo == 6}">조류</c:when>
                                    <c:when test="${petCtgNo == 7}">설치류</c:when>
                                    <c:when test="${petCtgNo == 8}">절지류/곤충</c:when>
                                    <c:otherwise>Unknown Category</c:otherwise>
                                </c:choose>
                            </c:set>

                            <div class="page-title">
                                <div id="category-${petCtgNo}" class="titleInfo">${categoryName} 갤러리</div>
                                <span class="ctgTitle">게시글 작성</span>
                            </div>
                            <div class="bracket">
                                <img src="/image/index/bracket-light-right.svg" class="bRight"
                                    alt="..." style="height: 128px;">
                            </div>
                        </div>

                        <div class="writeBox">
					    <form id="mainSubmitFrm" method="post" action="/gallery/insert" enctype="multipart/form-data">
					        <div class="postInfo-box">
					        <div class="post-info">
						        <div class="author">
						        작성자 : <input type="text" name="memId" value="${memId}" style="width: 100px;">
						        </div>
					        </div>
						        <div class="mainPhotoBox">
						            <label for="postImgFile" class="imgBtn">이미지 선택</label>
						            <input type="file" name="postImgFile" id="postImgFile" style="display: none;"/>
						            <img id="imagePreview" src="" alt="이미지 미리보기" style="margin-top: 20px; display: none; max-width: auto; height: 200px;" />
						        <br>
						         <!-- 적합도 판정 버튼 -->
						         <label for="analyzeBtn" class="analyzeBtn">적합도 판정</label>
					    		 <button id="analyzeBtn" class="analyzeBtn " name="analyzeBtn" onclick="openAnalysisPopup()">적합도 판정</button>
						        </div>
					        </div>
					        <br><br>
					        <input type="hidden" id="petCtgNo" name="petCtgNo" value="${petCtgNo}" />
					        
					        <!-- 제목 입력 필드 -->
					        <div class="mainDetailTitleBox">
					            <input type="text" class="MainDetailTitle" id="postTitle" name="postTitle" placeholder="글 제목" required>
					        </div>
					
					        <!-- 내용 입력 필드 -->
					        <div class="mainDetailBodyBox">
					            <textarea class="mainDetailBody" id="postContent" name="postContent" placeholder="글 내용" required></textarea>
					        </div>
							<button type="submit" class="imgUploadBtn">작성하기</button>
					        <input type="hidden" id="postLike" name="postLike" value="0" />
					        
					    </form>
					</div>
                    </section>
                </div>
            </div>
        </div>
    </div>
<div id="footer">
   <c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
</div>
</body>
<script>
//적합도 판정 팝업 창 열기
function openAnalysisPopup() {
    const fileInput = document.getElementById('postImgFile');
    if (!fileInput.files.length) {
        alert("이미지를 선택해 주세요.");
        return;
    }

    const formData = new FormData();
    formData.append('file', fileInput.files[0]);

    // 팝업 창 열기
    const popupWindow = window.open('', 'popupWindow', 'width=600,height=600');
    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/uploadImage', true);
    xhr.onload = function() {
        if (xhr.status === 200) {
            popupWindow.document.write(xhr.responseText); // 분석 결과를 팝업 창에 표시
        } else {
            alert('분석 실패: ' + xhr.status);
        }
    };
    xhr.send(formData);
}
</script>
</html>

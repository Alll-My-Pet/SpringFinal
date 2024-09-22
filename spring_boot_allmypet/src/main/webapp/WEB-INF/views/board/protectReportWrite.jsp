<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
 <html>
  <head>
   <title>유기동물 신고 작성</title>
   <link rel="stylesheet" type="text/css" href="<c:url value='/css/board/protectReport.css'/>" />
   <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
   <script src="<c:url value='/js/Board/protectReport.js'/>"></script>
  </head>
	<body>
		<div class="All">
		
		<!-- header -->
		<div id="header">
			<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
		</div>
		
		  <form class="reportFrm" method="post" action="/reportInsert" enctype="multipart/form-data">
		  <input type="hidden" name="memId" value="${sessionScope.mid}">
		  	<h1 id="reportFont">유기동물 신고</h1>
		  
			<section class="reportHeader">
				<div class="headerBox">
					<div class="lossPetCtg">
						<input type="text"  id="lossPet" name="lossPet" placeholder="유기동물 종류:">
					</div>
					
					<div class="lossLocationBox">
						<input type="text"  id="lossLocation" name="lossLocation" placeholder="동물 보호/분실 위치">
					</div>
					
					<div class="TitleBox">
						<input type="text" id="postTitle" name="postTitle" placeholder="글 제목:">
					</div>
				</div>
			</section>
			
			<section class="contentBox">
				<textarea id="postContent" name="postContent" placeholder="글 내용"></textarea>
			</section>
			
			<section class="buttonAndInfo">
				<div class="buttonAndImg">
				
					<div class="imgAndPreview">
						<input type="file" class="thumbNailBtn" id="postImgFile" name="postImgFile">
						<label for="postImgFile" class="imgSelectLabel">파일 선택</label>
						
						<div class="ImgPreviewBox"></div>
					</div>
						<p id="thumbnailFont">썸네일 미리보기</p>
					
					<div class="notice">
						<ul class="writeInfo">
							<li>썸네일 사진은 해당 동물의 전신이나 특징을 알아볼 수 있는 사진으로 업로드 바랍니다.</li>
							<li>게시글 작성 시 구체적인 위치를 적어주시면 유기동물 구조나 보호에 큰 도움이 됩니다.</li>
							<li>글 제목에 유기동물을 보호하고 있거나 목격했다면 보호/목격을 써주시고 반려동물을<br> 분실하셨을 시에는 분실/잃어버림 으로 글 제목을 적어주시기 바랍니다.</li>
						</ul>
					</div>
					
					<button type=submit class="reportBtn" id="uploadBtn">업로드</button>
				</div>
			</section>
		  </form>
		</div>
		<!-- footer부착 -->
		<div id="footer">
			<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
		</div>
	</body>
 </html>
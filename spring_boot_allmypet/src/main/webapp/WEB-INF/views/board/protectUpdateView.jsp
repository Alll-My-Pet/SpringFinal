<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
 <html>
  <head>
   <title>동물보호 게시글 작성</title>
   <link rel="stylesheet" type="text/css" href="<c:url value='/css/board/protectWrite.css'/>" />
   <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
   <script src="<c:url value='/js/board/protectUpdate.js'/>"></script>
  </head>
	<body>
		<div class="All">
			<!-- header -->
			<div id="header">
				<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
			</div>
		
			<h1 class="protectWriteFont">반려동물 보호 게시글 작성</h1>
			<form class="protectUpdateFrm" method="post" action="<c:url value='/board/ProtectUpdate'/>">
			
				<section class="headerAndName">
					<div class="headerCtg">
						<select class="header" id="headerNo" name="headerNo">
							<option value="0">머릿말 선택</option>
							<option value="1" <c:if test="${protectBoard.headerNo == '1'}">selected</c:if>>유기동물 봉사</option>
							<option value="2" <c:if test="${protectBoard.headerNo == '2'}">selected</c:if>>봉사</option>
							<option value="3" <c:if test="${protectBoard.headerNo == '3'}">selected</c:if>>캠페인</option>
						</select>
					</div>
					
					<div class="nameBox">
						<input class="comName" id="companyName" name="companyName" placeholder="업체명:" value="${protectBoard.companyName }">
					</div>
					
					<div class="titleBox">
						<input class="protectTitle" id="postTitle" name="postTitle" placeholder="제목:" value="${protectBoard.postTitle }">
					</div>
				
				</section>
				
				<section class="protectContentBox">
					<textarea class="protectContent" id="postContent" name="postContent">${protectBoard.postContent }</textarea>
				</section>
				
				
					<button class="protectLocalBtn">업체 위치 등록</button>
					
					<p id="noticeFont">＊ 게시판의 성격과 맞지 않은 업체 홍보 글일 시 삭제조치 됩니다.</p>

				<div class="pwdCheck">
					<label for="password">비밀번호</label> 
					<input type="password" id="memPwd" name="memPwd" required />
				</div>

			<button type="submit" class="protectWriteBtn">업로드</button>
			</form>
			
		
		</div>
		
		<!-- footer부착 -->
		<div id="footer">
			<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
		</div>
		
	</body>
 </html>
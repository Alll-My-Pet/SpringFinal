<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
 <html>
  <head>
   <title>분양홍보 게시글</title>
   <link rel="stylesheet" type="text/css" href="<c:url value='/css/Board/PromoteDetail.css'/>" />
   <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
   <script src="<c:url value='/js/Board/promoteDetail.js'/>"></script>
  </head>
	<body>
		<div class="All">
			<section class="parcelOutInfo">
				<!-- header -->
				<div id="header">
					<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
				</div>
				
				<h2 id="promoteDetailFont">분양 홍보 게시판</h2>
				
				
				
				<div class="petInfoBox">
					<div class="petPhotoBox">${promoteBoard.postImg }</div>
					<div class="petExplain">분류:${promoteBoard.petCtgNo }<br>
				    						생물명:${promoteBoard.petName }<br>
				    						분양처:${promoteBoard.placeInfo }<br>
				    						분양 방법:${promoteBoard.parcelOutInfo }<br>
				    						작성자:${promoteBoard.memId}
				    </div>
				</div>
				
				<div class="parcelOutInfoBox">
					<div class="parcelOutPlace">
						<p id="parcelOutPlaceFont">분양처 위치</p>
						<button class="naverMapBtn">네이버 지도 바로가기</button>
					
					</div>
					
					<div class="parcelOutintroduce">
						<p id="parcelOutintroduceFont">분양처 소개글</p>
					
					</div>
				</div>
				
				<div class="promoteContentArea">
					${promoteBoard.postContent}
				</div>
				
				<div class="bookMarkAndLike">
					<button class="bookMarkBtn"><img src="<c:url value='/project_images/free-icon-bookmark-white-25667.png'/>" /></button>
					<button id="LikeBtn" class="LikeBtn" onclick="toggleLike(${promoteBoard.postNo})"><img src="<c:url value='/project_images/free-icon-thumb-up-5323424.png'/>" /></button>
				</div>
				
				
				
				<div class="udButtons">
					<c:if test="${promoteBoard.memId == logInUser}">
						<a href="<c:url value='/board/promoteUpdateForm/${promoteBoard.postNo}'/>" class="updateBtn">수정</a>
						<a href="<c:url value='/board/deletePromote/${promoteBoard.postNo}'/>" class="deleteBtn" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
					</c:if> 
				</div>
			</section>
			
			 <!-- footer -->
			 <div id="footer">
				<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
			 </div>
		
		</div>
	</body>
 </html>
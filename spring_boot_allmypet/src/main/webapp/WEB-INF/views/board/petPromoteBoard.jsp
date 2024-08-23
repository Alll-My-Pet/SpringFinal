<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분양 홍보 게시판</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/PetPromoteBoard.css'/>" />
</head>
<body>
	<div class="All">
		<section class="promoteBoard">
			<div class="promoteHeader">

                
				<h1 id="titleFont">분양 홍보 게시판</h1>
				<p id="titleFont2">인가받은 업체나 브리더에 한해서만 게시글 업로드 가능합니다</p>
                
				<div class="promoteHotBoard">
					<h3 style="margin-left: 2%;">분양 시 주의사항</h3>
					<div class="hot1">
						<p style="text-indent: 30px;">제목1</p>
						<p style="text-indent: 500px;">닉네임</p>
						<p style="text-indent: 50px;">2021-10-12</p>
					</div>
					<div class="hot2">
						<p style="text-indent: 30px;">제목1</p>
						<p style="text-indent: 500px;">닉네임</p>
						<p style="text-indent: 50px;">2021-10-12</p>
					</div>
				</div>

				<div class="promoteSearch">
					<h4 id="PSearchFont">동물별 검색</h4>
					<p id="ctgFont">분류</p>
					<form>
						<select class="promotePetCtg">
							<option value="Reptiles">양서류/파충류</option>
							<option value="option1">옵션1</option>
						</select> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; 
						
						<input type="text" class="PSearchBar" placeholder="게시판 내 검색">
						<button class="promoteBoardSearchBtn"><!-- 동물별 검색 div 버튼 -->
							<img src="<c:url value='/pet_images/free-icon-search-interface-symbol-54481.png'/>" />
						</button>
					</form>
				</div> <!-- promoteSearch 끝 -->

              <div class="promotePicBox">
                <div class="promotePic">
					<div class="promoteFont"></div>
				    <div class="promoteDescription">설명</div>
				</div>
              </div> <!-- promotePicBox 끝 -->
              
              <button class="promoteBrdBtn">게시글 작성</button>
              
              
			</div>
		</section>
		
		<nav class="boardCtg">
		  <div class="PetCtgBrd">
		  <p>카테고리별</p>
		  <p>▶전체게시판</p>
		  <p>▶양육 팁 게시판</p>
		  <p>▶반려동물 갤러리</p>
		  <br>
		  <p>전체 커뮤니티</p>
		  <p>▶자유게시판</p>
		  <p>▶분양홍보 게시판</p>
		  <p>▶반려동물 보호 게시판</p>
		  <p>▶이모지 게시판</p>
		  <br>
		  <p>반려동물 이름짓기가 어렵다면?</p>
		  <a href="#">작명소</a>
		  </div>
		  </nav>
		  
	</div>
</body>
</html>
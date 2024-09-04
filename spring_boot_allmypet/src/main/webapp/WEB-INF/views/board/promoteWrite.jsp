<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
 <html>
  <head>
   <title>분양홍보 작성</title>
   <link rel="stylesheet" type="text/css" href="<c:url value='/css/Board/promoteWrite.css'/>" />
   <script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
   <script src="<c:url value='/js/Board/promoteWrite.js'/>"></script>
  </head>
	<body>
		<div class="All">
				<!-- header -->
				<div id="header">
					<c:import url="/WEB-INF/views/layout/header.jsp"></c:import>
				</div>
				
				
		 <section class="promoteWrite">
		 
		  <form class="promoteFrm" method="post" action="<c:url value='/insertPromote'/>">
		  
		  <div class="animalCtg">
			<select class="animalCtg" name="petCtgNo" id="petCtgNo">
			  <option value="9">동물 분류 선택</option>
			  <option value="1">강아지</option>
			  <option value="2">고양이</option>
			  <option value="3">기타 포유류</option>
			  <option value="4">파충류/양서류</option>
			  <option value="5">어류</option>
			  <option value="6">조류</option>
			  <option value="7">설치류</option>
			  <option value="8">절지류/곤충류</option>
			</select>
		  </div>
		  
		  <div class="promoteMethod">
			<select class="promoteMethod" name="parcelOutInfo" id="parcelOutInfo">
			 <option value="default">분양 방법 선택</option>
			 <option value="FTF">대면</option>
			 <option value="NFTF">비대면</option>
			</select>
		  </div>
		  
		  <div class="animalInfo">
			<input class="animalName" placeholder="생물명" name="petName" id="petName">
			<input class="parcelOutPlace" placeholder="분양처명" name="placeInfo" id="placeInfo">
		  </div>
		  
		  <div class="promoteTextBox">
			<textarea class="promoteTextArea" name="postContent" id="postContent"></textarea>
		  </div>
		
		  <div class="btnAndPhoto">
		  
		    <div class="promoteLocation">
			 <button class="promoteLocationBtn">분양처 위치 등록</button>
			</div>
			
			<label for="thumbNail" class="thumbNailPhoto" >
        		파일 선택
   		    </label>
			<div class="thumbNail">
			 <input type="file" class="thumbNailBtn" name="postImg" id="postImg">
			</div>
			
			<div class="thumbNailPreview"></div>
		  </div>
		  
		  <ul class="postInfo">
		  	<li>분양과 상관없는 게시글일 경우 즉시 삭제 조치 됩니다.</li>
		  	<li>CITES 등록종일 경우 생물명 앞에 [CITES] 표기 바랍니다.</li>
		  	<li>생물분양으로 인한 불이익은 올마이펫의 책임이 아닙니다.</li>
		  </ul>
		  
		  <div class="uploadBox">
		  	<button type="submit" class="uploadBtn">업로드</button>
		  </div>
		  
		  
		  </form>
		 </section>
		 
		 
		 <!-- 플로팅버튼(탑버튼 포함) -->
			<div id="floatingBtn">
				<c:import url="/WEB-INF/views/layout/floating_btn.jsp"></c:import>
			</div>
			<!-- sidebar 부착 -->
			<div id="sidebar">
				<c:import url="/WEB-INF/views/layout/sidebar.jsp"></c:import>
			</div>
			<div id="footer">
			<c:import url="/WEB-INF/views/layout/footer.jsp"></c:import>
			</div>
		</div>
	</body>
 </html>
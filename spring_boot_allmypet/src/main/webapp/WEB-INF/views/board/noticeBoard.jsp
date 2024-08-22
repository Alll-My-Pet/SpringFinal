<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 게시판</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/Board/NoticeBoard.css'/>" />
</head>
<body>
	<div class="All">
		<section class="noticeBoard">
		 <h1 id="noticeFont">공지 게시판</h1>
		 
		 <div class="NBoardBox">
		 <table class="noticeBoardTB">
		  <tbody>
		   
		    <tr>
                <td>
                <a href="#">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
                </td>
                <td>작성자1</td>
                <td>2017.07.13</td>
            </tr>
            
		    <tr>
                <td>
                <a href="#">아무거나아무거나1</a>
                </td>
                <td>작성자2</td>
                <td>2017.07.14</td>
            </tr>
            
		    <tr>
                <td>
                <a href="#">아무거나아무거나2</a>
                </td>
                <td>작성자3</td>
                <td>2017.07.15</td>
            </tr>
            
		    <tr>
                <td>
                <a href="#">아무거나아무거나3</a>
                </td>
                <td>작성자4</td>
                <td>2017.07.16</td>
            </tr>
		     </tbody>
		    </table>
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
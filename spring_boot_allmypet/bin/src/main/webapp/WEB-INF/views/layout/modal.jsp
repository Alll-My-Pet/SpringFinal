<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지 modal</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- Modal -->
    <div class="modal fade" id="userguideModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">이용 가이드</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="community">
                            <h5>반려동물별 커뮤니티 이용법</h5>
                            <hr>
                            <span>
                                🐾자신이 기르는 반려동물 분류에 맞는 커뮤니티로 들어가보세요!<br>
                                🐾동물별 카테고리 커뮤니티 구성<br>
                                &nbsp;↪ 전체게시판<br>
                                &nbsp;↪ 반려동물 양육 팁 게시판<br>
                                &nbsp;↪ 반려동물 갤러리<br>
                                <br>
                                🐾헷갈리는 동물분류<br>
                                &nbsp;기타 포유류: 토끼, 미어캣 등 (고양이, 강아지, 설치류 제외 소동물)<br>
                                &nbsp;파충류/양서류: 거북, 악어, 뱀, 도마뱀, 개구리, 맹꽁이 등<br>
                                &nbsp;설치류: 햄스터, 기니피그, 친칠라, 프레리독 등<br>
                            </span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
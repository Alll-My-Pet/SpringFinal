/**
 * bulletin_detail 전체게시판 상세페이지
 */

$(document).ready(function() {
	const likeButton = document.getElementById('likeButton');
    const likeIcon = likeButton.querySelector('.like-icon');
    const bodlike = document.getElementById('bodlike');
    let likeCount = parseInt(bodlike.textContent);
    let isLiked = false; // 좋아요 상태를 추적

    likeButton.addEventListener('click', function() {
        isLiked = !isLiked; // 상태 토글

        if (isLiked) {
            likeIcon.src = '/image/board/like-checked.svg'; // 체크된 상태 아이콘으로 변경
            likeCount += 1; // 좋아요 수 증가
        } else {
            likeIcon.src = '/image/board/like-default.svg'; // 기본 상태 아이콘으로 변경
            likeCount -= 1; // 좋아요 수 감소
        }

        bodlike.textContent = likeCount; // 좋아요 수 업데이트
    });

    const bookmarkButton = document.getElementById('bookmarkButton');
    const bookmarkIcon = bookmarkButton.querySelector('.bookmark-icon');
    let isBookmarked = false; // 북마크 상태를 추적

    bookmarkButton.addEventListener('click', function() {
        isBookmarked = !isBookmarked; // 상태 토글

        if (isBookmarked) {
            bookmarkIcon.src = '/image/board/bookmark-checked.svg'; // 체크된 상태 아이콘으로 변경
        } else {
            bookmarkIcon.src = '/image/board/bookmark-default.svg'; // 기본 상태 아이콘으로 변경
        }
    });
});
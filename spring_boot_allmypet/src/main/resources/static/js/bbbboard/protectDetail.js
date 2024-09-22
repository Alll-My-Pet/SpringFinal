/**
 * protectDetail.js
 */
 
$(document).ready(function() {
    $('.protectLikeBtn').on('click', function() {
        var postNo = '${protect.postNo}'; // 문자열로 감싸야 하는 경우
        $.ajax({
            url: '/board/toggleLike/' + postNo,
            type: 'GET',
            success: function(response) {
                if (response === 'liked') {
                    alert('게시물을 좋아했습니다!');
                } else if (response === 'unliked') {
                    alert('게시물의 좋아요를 취소했습니다!');
                }
                // UI를 업데이트하여 새로운 좋아요 수를 반영할 수 있습니다.
            } // success 끝
        }); // ajax 끝
    }); // onClick 끝
}); // ready 끝
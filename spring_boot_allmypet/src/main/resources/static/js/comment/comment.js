/**
 * 
 */
 
 $(document).ready(function() {
    // 공감 버튼 클릭 처리
    $('.like-button').click(function() {
        var commentId = $(this).data('comment-id');
        var postNo = $(this).data('post-no');

        $.post('/comment/like', { commentId: commentId, postNo: postNo })
            .done(function() {
                location.reload(); // 페이지 새로고침
            })
            .fail(function() {
                alert('공감 처리 중 오류가 발생했습니다.');
            });
    });

    // 삭제 버튼 클릭 처리
    $('.delete-button').click(function() {
        var commentId = $(this).data('comment-id');
        var postNo = $(this).data('post-no');

        if (confirm('정말 삭제하시겠습니까?')) {
            $.post('/comment/delete', { commentId: commentId, postNo: postNo })
                .done(function() {
                    location.reload(); // 페이지 새로고침
                })
                .fail(function() {
                    alert('삭제 처리 중 오류가 발생했습니다.');
                });
        }
    });

    // 댓글 작성 폼 제출 처리
    $('#comment-form').submit(function(e) {
        e.preventDefault(); // 기본 폼 제출 방지

        var formData = $(this).serialize();

        $.post('/comment/insert', formData)
            .done(function() {
                location.reload(); // 페이지 새로고침
            })
            .fail(function() {
                alert('댓글 작성 중 오류가 발생했습니다.');
            });
    });
});
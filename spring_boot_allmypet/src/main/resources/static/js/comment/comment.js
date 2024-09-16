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

        // 선택된 이모지를 댓글에 추가
        var selectedEmoji = $('#selectedEmoji').val();
        var commentText = $('textarea[name="commentText"]').val();

        // 이모지를 텍스트 앞에 추가
        if (selectedEmoji) {
            commentText = `<img src='/image/emoji/${selectedEmoji}' alt='emoji' style='width: 50px; height: 50px;'> ` + commentText;
        }

        // 폼 데이터 생성
        var formData = $(this).serializeArray();
        var newFormData = [];

        // 기존 폼 데이터에서 commentText를 업데이트
        $.each(formData, function(index, field) {
            if (field.name === 'commentText') {
                newFormData.push({ name: 'commentText', value: commentText });
            } else {
                newFormData.push(field);
            }
        });

        $.post('/comment/insert', $.param(newFormData))
            .done(function() {
                location.reload(); // 페이지 새로고침
            })
            .fail(function() {
                alert('댓글 작성 중 오류가 발생했습니다.');
            });
    });
});

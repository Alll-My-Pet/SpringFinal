$(document).ready(function() {
    $('#changePwdForm').on('submit', function(event) {
        event.preventDefault(); // 기본 폼 제출 방지

        // 입력값 가져오기
        var memId = $('#memId').val();
        var newMemPwd = $('#newMemPwd').val();
        var pwcheck = $('#pwcheck').val();

        // 유효성 검사
        var isValid = true;

        // 비밀번호 확인 검사
        if (newMemPwd !== pwcheck) {
            $('#pwcheckError').text('비밀번호가 일치하지 않습니다.');
            isValid = false;
        } else {
            $('#pwcheckError').text('');
        }

        // 모든 유효성 검사를 통과한 경우
        if (isValid) {
            // AJAX 요청
            $.ajax({
                url: '/member/changePwd', // 비밀번호 변경 API URL
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    memId: memId,
                    newMemPwd: newMemPwd
                }),
                success: function(response) {
                    if (response === "success") {
                        alert("비밀번호가 성공적으로 변경되었습니다.");
                        window.location.href = '/login.jsp'; // 로그인 페이지로 리다이렉트
                    } else {
                        alert("비밀번호 변경에 실패했습니다. 다시 시도해 주세요.");
                    }
                },
                error: function(xhr, status, error) {
                    alert("문제가 발생했습니다. 나중에 다시 시도해 주세요.\n" + error);
                }
            });
        }
    });
});


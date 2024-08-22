

    // 회원가입 폼 제출
    $('#submitBtn').on('click', function() {
        var formData = $('#joinForm').serialize();
        $.ajax({
            type: 'POST',
            url: '/member/insertmem',
            data: formData,
            success: function(response) {
                if (response === 'success') {
                    alert("회원가입이 완료되었습니다.");
                    location.href = "/login";
                } else {
                    alert("회원가입에 실패했습니다.");
                }
            },
            error: function() {
                alert("문제가 발생했습니다. 나중에 다시 시도해 주세요.");
            }
        });
    });

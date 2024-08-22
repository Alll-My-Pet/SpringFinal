$(function() {
    $('#findPwd').on('submit', function() {
    	event.preventDefault();
        $.ajax({
            url: '/member/findPwd',
            type: "post",
            data: { "memId": $('#memId').val(),
            		"memEmail": $('#memEmail').val()},
            dataType: 'text',
            success: function(result) {
                    if (result != null) {
                        window.opener.location.href = "/changePW";
                        window.close();
                    } else {
                        alert('아이디를 찾을 수 없습니다.');
                    }
            },
            error: function() {
                alert('문제가 발생했습니다. 나중에 다시 시도해 주세요.');
            }
        });
    });
});
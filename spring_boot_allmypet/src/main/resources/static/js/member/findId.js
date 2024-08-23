$(function() {
    $('#findIDForm').on('submit', function() {
    	event.preventDefault();
        $.ajax({
            url: '/member/findId',
            type: "post",
            data: { "memName": $('#memName').val(), 
            		"memEmail": $('#memEmail').val(), 
            		"memHP": $('#memHP').val()},
            dataType: 'text',
            success: function(result) {
                    if ( result != "") {
                        alert('찾은 아이디: ' + result);
						let username = window.opener.document.getElementById('memId');
                        username.value = result;
                        window.close();
                        //location.href="/loginAfterFindId/" + result;
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
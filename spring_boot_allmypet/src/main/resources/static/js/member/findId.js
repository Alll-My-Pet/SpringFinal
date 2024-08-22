$(function() {
    $('#findIDForm').on('submit', function() {
    	event.preventDefault();
        $.ajax({
            url: '/member/findId',
            type: "post",
            data: { "memName": $('#memName').val(),
            		"memHP": $('#memHP').val(),
            		"memEmail": $('#memEmail').val()},
            dataType: 'text',
            success: function(result) {
                    if ( result != "") {
                        alert('찾은 아이디: ' + result);
                        window.close();
                        
                        //location.href="/loginAfterFindId/" + result;
                    } else {
                        alert('아이디를 찾을 수 없습니다.');
                    }
            },
            error: function() {
                alert('실패');
            }
        });
    });
});
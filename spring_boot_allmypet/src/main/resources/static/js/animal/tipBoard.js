/**
 *  양육팁 게시판 tipBoard.js
 */

$(document).ready(function() {
	$('#notLoginBtn').click(function() {
        if (confirm('로그인이 필요합니다. 로그인 하시겠습니까?')) {
            window.location.href = '/login';
        }
    });

    
});
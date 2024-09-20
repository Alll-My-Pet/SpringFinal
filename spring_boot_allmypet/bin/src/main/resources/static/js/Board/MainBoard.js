/**
 *  MainBoard.js
 */
 
$(document).ready(function() {
   /* $('.mainWriteBtn').click(function() {
        if (isLoggedIn) {
            // 로그인된 경우, 게시글 작성 폼으로 이동
            window.location.href = '/Board/MainBoardText';
        } else {
            // 로그인되지 않은 경우, 확인 후 로그인 페이지로 이동
            if (confirm('로그인이 필요합니다. 로그인 하시겠습니까?')) {
                window.location.href = '/login';
            }
        }
    }); */
    
    $('#notLoginBtn').click(function() {
    	if (confirm('로그인이 필요합니다. 로그인 하시겠습니까?')) {
                window.location.href = '/login';
            }
    });

    $('#BoardSearchBar').on('submit', function() {
        event.preventDefault();
        
        // 폼에 입력한 여러 개의 값을 쿼리스트링 방식의 데이터로 변환: serialize() 사용
        let keyword = $('#SearchBox').val();
        let type = $('#BFilter').val();
        
        $.ajax({
            type: "post",
            url: "/board/boardSearch",
            data: { keyword: keyword, type: type },
            success: function(result) {
                $('#boardList').empty();
                
                if (result.length === 0) { // 검색 결과 없는 경우
                    $('#boardList').append('<tr align="center"><td colspan="4">찾는 게시글이 존재하지 않습니다.</td></tr>');
                } else {
                    result.reverse();
                    
                    for (let i = 0; i < result.length; i++) {
                        let board_date = new Date(result[i].bodDate);
                        let year = board_date.getFullYear();
                        let month = (board_date.getMonth() + 1).toString().padStart(2, '0');
                        let date = board_date.getDate().toString().padStart(2, '0');
                        let bodDate = `${year}-${month}-${date}`;
                        
                        $('#boardList').append('<tr><td>' + result[i].postNo + '</td><td>' + result[i].postTitle + '</td><td>' + result[i].memId + '</td><td>' + bodDate + '</td></tr>');
                    }
                }
            },
            error: function() {
                alert("실패");
            }
        });
    });
});

/**
 *  MainBoard.js
 */

$(document).ready(function() {

    $('#notLoginBtn').click(function() {
        if (confirm('로그인이 필요합니다. 로그인 하시겠습니까?')) {
            window.location.href = '/login';
        }
    });

    $('#BFilter2').on('change', function(event) {
        event.preventDefault();

        let boardCtgNo = $('#BFilter2').val();
        console.log(boardCtgNo);
        let petCtgNo = $('#petCtgNo').val(); /// JSP에서 petCtgNo 가져오기

        $.ajax({
            url: '/animal_home/bulletin/filtered', // 요청할 URL
            type: 'POST',
            data: {
                petCtgNo: petCtgNo,
                isFiltered: true,
                headerNo: boardCtgNo // boardCtgNo를 headerNo로 전송                           
            },
            success: function(data) {
                // 성공적으로 데이터를 가져왔을 때  
                $('#filtering_result_box').empty();
                $('#filtering_result_box').html(data); // 게시판 테이블을 업데이트                
            },
            error: function() {
                alert('데이터를 가져오는 데 실패했습니다.');
            }
        });
    });

    /*    $('#BoardSearchBar').on('submit', function(event) {
            event.preventDefault();

            let keyword = $('#keyword').val();
            let type = $('#type').val();

            $.ajax({
                type: "post",
                url: "/board/boardSearch",
                data: { keyword: keyword, type: type },
                success: function(boardList) {
                    $('#boardList').empty(); // 기존 게시글 목록을 비움

                    if (boardList.length === 0) { // 검색 결과가 없는 경우
                        $('#boardList').append('<tr align="center"><td colspan="6">찾는 게시글이 존재하지 않습니다.</td></tr>');
                    } else {
                        boardList.reverse(); // 최신 글이 위로 오도록 순서를 뒤집음

                        // 검색 결과를 테이블에 추가
                        for (let i = 0; i < boardList.length; i++) {
                            let board_date = new Date(boardList[i].postDate);
                            let year = board_date.getFullYear();
                            let month = (board_date.getMonth() + 1).toString().padStart(2, '0');
                            let date = board_date.getDate().toString().padStart(2, '0');
                            let postDate = `${year}-${month}-${date}`;

                            $('#boardList').append('<tr><td>' + boardList[i].boardCthNo + '</td><td>' + boardList[i].postNo + '</td><td>' + boardList[i].postTitle + '</td><td>' + boardList[i].memId + '</td><td>' + postDate + '</td><td>' + boardList[i].postView + '</td><td>' + boardList[i].postLike + '</td></tr>');
                        }
                    }
                },
                error: function() {
                    alert("검색에 실패했습니다.");
                }
            }); // ajax끝
        }); // BoardSearchBar 끝*/

}); // ready 끝
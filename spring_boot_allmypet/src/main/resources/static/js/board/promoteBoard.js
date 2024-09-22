/**
 *  MainBoard.js
 */
$(document).ready(function() {
    /*alert("js확인용");*/
    $('#notLoginBtn').click(function() {
    	if (confirm('로그인이 필요합니다. 로그인 하시겠습니까?')) {
                window.location.href = '/login';
            }
    });
    
     $('.promoteBoardSearchBtn').click(function(event) {
        event.preventDefault(); // 기본 폼 제출 방지

        // 폼 데이터 수집
        var form = $('#promoteSearch');
        var formData = form.serialize(); // 폼 데이터 직렬화

        // AJAX 요청 보내기
        $.ajax({
            url: form.attr('action'),
            type: 'GET',
            data: formData,
            dataType: 'json',
            success: function(response) {
                // 검색 결과를 처리
                displaySearchResults(response);
            },
            error: function(xhr, status, error) {
                console.error('검색 중 오류 발생:', status, error);
            }
        });
    });

    // 검색 결과를 표시하는 함수
    function displaySearchResults(results) {
        var container = $('.promoteBoardBox');

        if (results.length === 0) {
            // 검색 결과가 없을 때 경고 메시지 표시
            alert("검색 결과가 없습니다");
            return; // 더 이상의 작업을 수행하지 않음
        }

        // 검색 결과가 있을 때만 기존 결과 삭제
        container.empty();

        $.each(results, function(index, item) {
            var html = '<a href="/board/promoteDetailView/' + item.postNo + '">';
            html += '<div class="promotePic">';
            html += '<div class="promoteFont">' + item.postImg + '</div>';
            html += '<div class="promoteDescription">';
            html += '분류:' + item.petCtgNo + '<br>';
            html += '생물명:' + item.petName + '<br>';
            html += '분양처:' + item.placeInfo + '<br>';
            html += '분양 방법:' + item.parcelOutInfo;
            html += '</div>';
            html += '</div>';
            html += '</a>';
            container.append(html);
        });
    }

}); // ready 끝


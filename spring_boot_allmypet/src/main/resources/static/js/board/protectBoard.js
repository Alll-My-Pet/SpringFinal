/**
 *  protectBoard.js
 */
$(document).ready(function() {
    $('#notLoginBtn').click(function() {
        if (confirm('로그인이 필요합니다. 로그인 하시겠습니까?')) {
            window.location.href = '/login';
        }
    });

    $('.ProtectSearchBtn').click(function(event) {
        event.preventDefault(); // 기본 폼 제출 방지

        // 폼 데이터 수집
        var form = $('.boardListForm');
        var formData = form.serialize(); // 폼 데이터 직렬화

        // AJAX 요청 보내기
        $.ajax({
            url: form.attr('action'),
            type: 'GET',
            data: formData,
            dataType: 'json',
            success: function(response) {
                displaySearchResults(response);
            },
            error: function(xhr, status, error) {
                console.error('검색 중 오류 발생:', status, error);
            }
        });
    });

    // 검색 결과를 표시하는 함수
    function displaySearchResults(results) {
        var container = $('.protectBoard');
        container.empty(); // 기존 결과 삭제

        if (results.length === 0) {
            alert("검색 결과가 없습니다");
            return;
        }

        var table = $('<table class="PttTable"></table>');
        var header = '<thead><tr><th>종류</th><th>제목</th><th>작성자</th><th>작성일</th></tr></thead>';
        var tbody = $('<tbody></tbody>');

        $.each(results, function(index, item) {
            var row = '<tr>';
            row += '<td>' + (item.headerNo === 1 ? '[유기동물 봉사]' :
                              item.headerNo === 2 ? '[봉사]' :
                              item.headerNo === 3 ? '[캠페인]' :
                              item.headerNo === 4 ? '<span class="header-text-red">[유기동물 신고]</span>' : '') + '</td>';
            row += '<td><a href="/board/ProtectDetailView/' + item.postNo + '">' + item.postTitle + '</a></td>';
            row += '<td>' + item.memId + '</td>';
            row += '<td>' + formatDate(item.postDate) + '</td>';
            row += '</tr>';
            tbody.append(row);
        });

        table.append(header).append(tbody);
        container.append(table);
    }

    // 날짜 포맷팅 함수
    function formatDate(dateString) {
        var date = new Date(dateString);
        return date.toISOString().slice(0, 10); // 'YYYY-MM-DD' 형식으로 반환
    }
});


/**
 * 중고거래 - 삽니다.
 */

$(document).ready(function() {
    document.querySelectorAll('td').forEach(td => {
        console.log(td);
        if (td.textContent.includes('완')) { // 특정 글자
            td.classList.add('highlight');
        }
    });

});
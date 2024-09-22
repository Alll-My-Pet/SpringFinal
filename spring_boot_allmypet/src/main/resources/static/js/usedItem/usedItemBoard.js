/**
 *  중고거래 - 팝니다
 */

$(document).ready(function() {

    function changeColor() {
        const div = document.getElementById('itemState');
        console.log("itemState: ", div);
        const text = div.innerText;

        // 기존 클래스 유지
        div.classList.remove('red', 'blue'); // 이전 색상 클래스 제거

        if (text.includes('중고')) {
            div.classList.add('red'); // 빨간색 추가
        } else if (text.includes('새 제품')) {
            div.classList.add('blue'); // 파란색 추가
        }
    }
    changeColor();
});

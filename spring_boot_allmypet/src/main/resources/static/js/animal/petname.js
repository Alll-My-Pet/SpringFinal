/**
 * petname.js 반려동물 작명소
 */

$(document).ready(function() {
    // gender-button을 클릭했을 때 호출되는 함수
    function selectGender(button) {
        // 버튼의 value 속성을 가져옴
        const genderValue = button.value;

        // genderOutput div의 텍스트를 업데이트
        const genderOutput = document.getElementById('genderOutput');

        // genderValue에 색상을 적용한 HTML 생성
        let colorClass = '';
        if (button.classList.contains('male')) {
            colorClass = 'style="color: blue; font-weight:bold;"'; // 수컷 색상
        } else if (button.classList.contains('female')) {
            colorClass = 'style="color: red;font-weight:bold;"'; // 암컷 색상
        } else if (button.classList.contains('unknown')) {
            colorClass = 'style="color: gray;font-weight:bold;"'; // 무성/모름 색상
        }

        // innerHTML을 사용하여 genderValue의 색상만 변경
        genderOutput.innerHTML = `💫 선택된 성별: <span ${colorClass}> ${genderValue} </span> 💫`;
    }
    
    // 모든 gender-button에 클릭 이벤트 리스너 추가
    document.querySelectorAll('.gender-button').forEach(button => {
        button.addEventListener('click', function () {
            selectGender(this);
        });
    });


}); // document.ready 끝
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
        console.log('genderOutput');

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

    // 작명 시작 버튼
    // generateBtn 클릭 시
    document.querySelector('.generateBtn').addEventListener('click', function (event) {
        event.preventDefault(); // 기본 submit 동작 방지
        // form-container 숨기기, resultContainer 보이기
        document.getElementById('formBtn').style.display = 'none';
        document.getElementById('spinnerContainer').style.display = 'flex'; // 스피너 보이기

        // 3초 후에 resultContainer 보이기
        setTimeout(function () {
            document.getElementById('spinnerContainer').style.display = 'none'; // 스피너 숨기기
            document.getElementById('resultContainer').style.display = 'flex'; // resultContainer 보이기
            document.getElementById('resultContainer').classList.add('show'); // 애니메이션 추가
        }, 1500); 
    });


    // 다시하기 
    // resetBtn 클릭 시
    document.querySelector('.resetBtn').addEventListener('click', function () {
        // name-result 내용 새로 로드 (여기서는 예시로 빈 내용으로 설정)
        const nameResult = document.querySelector('.name-result');
        nameResult.innerHTML = ''; // 결과 내용 초기화
        document.getElementById('resultContainer').style.display = 'flex'; // resultContainer 숨기기
        document.getElementById('formBtn').style.display = 'none'; // formBtn 보이게 하기
    });
    

    // 새로운 작명 시작
    // generateNewBtn 클릭 시
    document.querySelector('.generateNewBtn').addEventListener('click', function () {
        // 입력 필드 초기화
        document.getElementById('petType').value = ''; // 종류 초기화
        document.getElementById('petColor').value = ''; // 색깔 초기화
        document.getElementById('genderOutput').innerText = '💫 선택된 성별:없음 💫'; // 성별 초기화

        // formBtn div 다시 보이게 하기
        document.getElementById('formBtn').style.display = 'flex';
        document.getElementById('resultContainer').style.display = 'none'; // resultContainer 숨기기
    });


}); // document.ready 끝
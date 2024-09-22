/**
 * petname.js 반려동물 작명소
 */

$(document).ready(function() {
    let selectedGender = '없음'; // 기본 성별 설정

    // gender-button을 클릭했을 때 호출되는 함수
    function selectGender(button) {
        const genderValue = button.value; // 버튼의 value 속성을 가져옴
        const genderOutput = document.getElementById('genderOutput');

        // genderValue에 색상을 적용한 HTML 생성
        let colorClass = '';
        if (button.classList.contains('male')) {
            colorClass = 'style="color: blue; font-weight:bold;"'; // 수컷 색상
        } else if (button.classList.contains('female')) {
            colorClass = 'style="color: red; font-weight:bold;"'; // 암컷 색상
        } else if (button.classList.contains('unknown')) {
            colorClass = 'style="color: gray; font-weight:bold;"'; // 무성/모름 색상
        }

        // innerHTML을 사용하여 genderValue의 색상만 변경
        genderOutput.innerHTML = `💫 선택된 성별: <span ${colorClass}> ${genderValue} </span> 💫`;
    }

    // 모든 gender-button에 클릭 이벤트 리스너 추가
    document.querySelectorAll('.gender-button').forEach(button => {
        button.addEventListener('click', function() {
            selectedGender = this.value; // 선택된 성별 저장
            selectGender(this);
        });
    });

    // 작명 시작 버튼 클릭 이벤트
    $('#petNameForm').on('submit', function(event) {
        event.preventDefault(); // 기본 제출 동작 방지

        const petColor = $('#petColor').val().trim();
        const petType = $('#petType').val().trim();

        console.log("petColor: " + petColor);
        console.log("selectedGender: " + selectedGender);

        // petType 필수 입력 검사
        if (!petType) {
            alert("반려동물 종류를 입력해주세요.");
            return;
        }

        // 유효성 검사
        if (!petColor) {
            alert("반려동물 색깔이 정확하지 않습니다! 반려동물 특징과 상관이 없는 이름이 매칭됩니다.");
            fetchPetNames('미정', selectedGender); // AJAX 요청: color_group='미정'으로 요청
            /*return;*/
        }

        if (petColor && !petColor.endsWith("색")) {
            alert("색으로 끝나게 해주세요."); // 경고 메시지
            return; // 더 이상 진행하지 않음
        }

        // 성별 선택 검사 추가
        if (selectedGender === '없음') {
            alert("성별을 선택해 주세요."); // 경고 메시지
            return; // 더 이상 진행하지 않음
        }


        // AJAX 요청: colors 테이블에서 color_group 찾기
        $.ajax({
            url: '/api/colors',
            method: 'GET',
            data: { specificColor: petColor },
            success: function(colorGroup) {
                if (colorGroup) {
                    fetchPetNames(colorGroup, selectedGender); // 색깔이 유효한 경우
                    /*alert("ajax요청 들어감");*/

                    console.log("colorGroup: " + colorGroup);

                } else {
                    alert("반려동물 색깔이 정확하지 않습니다! 반려동물 특징과 상관이 없는 이름이 매칭됩니다.");
                    fetchPetNames('미정', selectedGender); // 색깔이 유효하지 않은 경우
                }
            },
            error: function() {
                alert('서버 오류가 발생했습니다.');
            }
        });

        document.getElementById('formBtn').style.display = 'none';
        document.getElementById('spinnerContainer').style.display = 'flex'; // 스피너 보이기

        // 3초 후에 resultContainer 보이기
        setTimeout(function() {
            document.getElementById('spinnerContainer').style.display = 'none'; // 스피너 숨기기
            document.getElementById('resultContainer').style.display = 'flex'; // resultContainer 보이기
            document.getElementById('resultContainer').classList.add('show'); // 애니메이션 추가
        }, 1500);
    });

    // AJAX 요청으로 pet_names에서 이름 가져오기
    function fetchPetNames(colorGroup, gender) {
        $.ajax({
            url: '/api/petnames',
            method: 'GET',
            data: { colorGroup: colorGroup, petGender: gender },
            success: function(names) {

                console.log("fetchNames에서의 colorGroup: " + colorGroup);
                console.log("fetchNames에서의 gender: " + gender);

                console.log("Server response names:", names); // 서버 응답 확인

                const nameResult = $('.name-result');

                console.log("nameResult" + nameResult);
                console.log("nameResult DOM 요소:", nameResult[0]);

                nameResult.empty();
                if (names.length > 0) {
                    names.forEach(name => {
                        console.log("Name candidate:", name.nameCandidate); // 각 이름 후보 확인
                        /*const color = colors[index % colors.length];*/ // 배열 길이에 따라 색상을 순환
                        nameResult.append(`<div class="name-item">${name.nameCandidate}</div>`);
                        // nameResult.append(`<div class="name-item" style="background-color: ${color};">${name.nameCandidate}</div>`); // name-item 클래스를 추가
                    });
                } else {
                    nameResult.append(`<div>이름 후보가 없습니다.</div>`);
                }
            },
            error: function() {
                alert('이름을 가져오는 데 실패했습니다.');
                /* $('#spinnerContainer').hide();*/
            }
        });
    }

    // 다시하기 버튼 클릭 이벤트
    $('.resetBtn').click(function() {
        const petColor = $('#petColor').val().trim(); // 현재 색깔 유지
        const petType = $('#petType').val().trim(); // 현재 종류 유지

        console.log("다시하기 petColor: " + petColor);
        console.log("다시하기 petType: " + petType);
        console.log("다시하기 selectedGender: " + selectedGender);

        // petColor가 비어 있지 않은 경우 색깔군 조회
        if (petColor) {
            $.ajax({
                url: '/api/colors', // 색깔군을 조회하는 API
                method: 'GET',
                data: { specificColor: petColor }, // 입력된 petColor를 사용
                success: function(colorGroup) {
                    if (colorGroup) {
                        // 색깔군이 유효한 경우 fetchPetNames 호출
                        fetchPetNames(colorGroup, selectedGender);
                    } else {
                        // 색깔군이 유효하지 않은 경우 '미정'으로 요청
                        fetchPetNames('미정', selectedGender);
                    }
                },
                error: function() {
                    alert('색깔군을 가져오는 데 실패했습니다.');
                }
            });
        } else {
            // petColor가 비어 있을 경우 '미정'으로 요청
            fetchPetNames('미정', selectedGender);
        }

    });

    // 새로운 작명 시작 버튼 클릭 이벤트
    $('.generateNewBtn').click(function() {
        $('#petNameForm')[0].reset(); // 폼 초기화
        $('#genderOutput').text('💫 선택된 성별:없음 💫'); // 성별 초기화
        $('#formBtn').show();
        $('#resultContainer').hide(); // resultContainer 숨기기
    });
});
/**
 *  동물 카테고리별 메인 화면(animal_index.js)
 */

$(document).ready(function () {
    /*alert("확인용!");*/
    /**사진 슬라이드쇼: 최근 사진 10개를 보여줌 */
    let currentIndex = 0; // 현재 보여지는 사진의 인덱스
    const photos = []; // 사진 URL 목록
    console.log(photos);

     // AJAX 요청을 통해 서버에서 이미지 목록 가져오기
    const petCtgNo = document.getElementById('petCtgNo').value;
    console.log("확인용" + petCtgNo);
    

    /*function updatePhotos() {
        const photoElements = document.querySelectorAll('.photo');
        for (let i = 0; i < photoElements.length; i++) {
            const index = (currentIndex + i) % photos.length; // 현재 인덱스에 i를 더해 표시할 사진의 인덱스를 계산, % 연산으로 순환
            photoElements[i].style.backgroundImage = `url(${photos[index]})`; // 사진 배경 설정
            photoElements[i].style.backgroundSize = 'cover'; // 배경 크기 조정
            photoElements[i].style.display = 'block'; // display 설정
        }
    }*/

    function updatePhotos() {
        const photoElements = document.querySelectorAll('.photo');
        const visibleCount = Math.min(5, photos.length); // 최대 5개만 표시

        for (let i = 0; i < photoElements.length; i++) {
            if (i < visibleCount) {
                photoElements[i].style.backgroundImage = `url(${photos[(currentIndex + i) % photos.length]})`; // 사진 배경 설정
                photoElements[i].style.display = 'block'; // display 설정
            } else {
                photoElements[i].style.display = 'none'; // 5개 초과는 숨김
            }
        }
    }

    document.querySelector('.chevron-right').addEventListener('click', () => {
        currentIndex = (currentIndex + 1) % photos.length; // 오른쪽 버튼 클릭 시 인덱스 증가
        updatePhotos(); // 사진 업데이트
    });

    document.querySelector('.chevron-left').addEventListener('click', () => {
        currentIndex = (currentIndex - 1 + photos.length) % photos.length; // 왼쪽 버튼 클릭 시 인덱스 감소, +photos.length로 음수를 방지
        updatePhotos(); // 사진 업데이트
    });

    // 초기 사진 세팅
    updatePhotos();


});
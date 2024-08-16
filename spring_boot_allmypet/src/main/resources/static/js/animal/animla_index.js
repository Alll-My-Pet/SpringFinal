/**
 *  동물 카테고리별 메인 화면(animal_index.js)
 */

$(document).ready(function () {

    /**사진 슬라이드쇼: 최근 사진 10개를 보여줌 */
    let currentIndex = 0; // 현재 보여지는 사진의 인덱스
    const photos = [
        'image/index/slide_강아지.jpg',
        'image/index/slide_고양이.jpg',
        'image/index/slide_다람쥐.jpg',
        'image/index/slide_도마뱀.jpg',
        'image/index/slide_베타.jpg',
        'image/index/slide_퀘이커.jpg',
        'image/index/slide_토끼.jpg',
        'image/index/slide_풍뎅이.jpg',
        'image/index/slide_미어캣.jpg',
        'image/index/slide_친칠라.jpg'
    ]; // 사진 URL 목록

    function updatePhotos() {
        const photoElements = document.querySelectorAll('.photo');
        for (let i = 0; i < photoElements.length; i++) {
            const index = (currentIndex + i) % photos.length; // 현재 인덱스에 i를 더해 표시할 사진의 인덱스를 계산, % 연산으로 순환
            photoElements[i].style.backgroundImage = `url(${photos[index]})`; // 사진 배경 설정
            photoElements[i].style.backgroundSize = 'cover'; // 배경 크기 조정
            photoElements[i].style.display = 'block'; // display 설정
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
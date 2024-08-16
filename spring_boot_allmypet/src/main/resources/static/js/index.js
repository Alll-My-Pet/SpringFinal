/**
 * index.js
 */

$(document).ready(function () {

    // 이번달 BEST 사진 갤러리 슬라이드쇼
    let currentIndex = 0; // 현재 보여지는 사진의 인덱스
    const photos = [
        'image/index/slide_강아지.jpg',
        'image/index/slide_고양이.jpg',
        'image/index/slide_다람쥐.jpg', 
        'image/index/slide_도마뱀.jpg',
        'image/index/slide_베타.jpg',
        'image/index/slide_퀘이커.jpg',
        'image/index/slide_토끼.jpg',
        'image/index/slide_풍뎅이.jpg'
    ]; // 사진 URL 목록

    function updatePhotos() {
        const photoElements = document.querySelectorAll('.photo');
        for (let i = 0; i < photoElements.length; i++) {
            const index = currentIndex + i; // 현재 인덱스에 i를 더해 표시할 사진의 인덱스를 계산
            if (index < photos.length) {
                photoElements[i].style.backgroundImage = `url(${photos[index]})`; // 사진 배경 설정
            } else {
                photoElements[i].style.backgroundImage = 'none'; // 사진이 없으면 비움
            }
        }
    }

    document.querySelector('.chevron-right').addEventListener('click', () => {
        currentIndex = Math.min(currentIndex + 1, photos.length - 4); // 오른쪽 버튼 클릭 시 인덱스 증가
        updatePhotos(); // 사진 업데이트
    });

    document.querySelector('.chevron-left').addEventListener('click', () => {
        currentIndex = Math.max(currentIndex - 1, 0); // 왼쪽 버튼 클릭 시 인덱스 감소
        updatePhotos(); // 사진 업데이트
    });

    // 초기 사진 세팅
    updatePhotos();



});
/**
 * bestTipBoard 양육팁 게시판
 */

$(document).ready(function() {

    const carousels = document.querySelectorAll('.carousel-container'); // 모든 Carousel 선택

    carousels.forEach((carousel) => {
        let currentIndex = 0; // 현재 인덱스
        const items = carousel.querySelectorAll('.carousel-item'); // 해당 Carousel의 아이템 선택
        const totalItems = items.length; // 총 아이템 수

        // Carousel 초기화
        updateCarousel(carousel);

        // 이전 버튼 클릭 이벤트
        carousel.querySelector('.chevron-left').addEventListener('click', () => {
            currentIndex = (currentIndex === 0) ? totalItems - 1 : currentIndex - 1; // 인덱스 감소
            updateCarousel(carousel);
        });

        // 다음 버튼 클릭 이벤트
        carousel.querySelector('.chevron-right').addEventListener('click', () => {
            currentIndex = (currentIndex === totalItems - 1) ? 0 : currentIndex + 1; // 인덱스 증가
            updateCarousel(carousel);
        });

        // Carousel 업데이트 함수
        function updateCarousel(carousel) {
            const inner = carousel.querySelector('.carousel-inner'); // 해당 Carousel의 .carousel-inner 선택
            const newTransformValue = -currentIndex * 100; // 이동할 거리 계산
            inner.style.transform = `translateX(${newTransformValue}%)`; // 이동 적용
        }
    });

});
/**
 * bestTipBoard 양육팁 게시판
 */

$(document).ready(function() {
    
    let currentIndex = 0; // 현재 인덱스
    const items = document.querySelectorAll('.carousel-item'); // Carousel 아이템 선택
    const totalItems = items.length; // 총 아이템 수

    // Carousel 초기화
    updateCarousel();

    // 이전 버튼 클릭 이벤트
    document.querySelector('.chevron-left').addEventListener('click', () => {
        currentIndex = (currentIndex === 0) ? totalItems - 1 : currentIndex - 1; // 인덱스 감소
        updateCarousel();
    });

    // 다음 버튼 클릭 이벤트
    document.querySelector('.chevron-right').addEventListener('click', () => {
        currentIndex = (currentIndex === totalItems - 1) ? 0 : currentIndex + 1; // 인덱스 증가
        updateCarousel();
    });

    // Carousel 업데이트 함수
    function updateCarousel() {
        const newTransformValue = -currentIndex * 100; // 이동할 거리 계산
        document.querySelector('.carousel-inner').style.transform = `translateX(${newTransformValue}%)`; // 이동 적용
    }

});

/**
 * floating 버튼(FAB)
 */

$(document).ready(function () {
    document.getElementById('toggleButton').addEventListener('click', function () {
        const elementContainer = document.getElementById('elementContainer');
        const toggleButton = document.getElementById('toggleButton');

        if (elementContainer.style.display === 'block') {
            elementContainer.style.display = 'none'; // 닫기
            toggleButton.classList.remove('open'); // 회전 원복
            toggleButton.textContent = '+'; // 텍스트 변경
        } else {
            elementContainer.style.display = 'block'; // 열기
            toggleButton.classList.add('open'); // 회전
            toggleButton.textContent = '×'; // 텍스트 변경
        }
    });

    const topButton = document.getElementById('topButton');

    // 버튼 클릭 시 스크롤
    topButton.addEventListener('click', function () {
        window.scrollTo({
            top: 0, // 페이지 맨 위
            behavior: 'smooth' // 부드러운 스크롤
        });
    });
	
	// 반려동물 지도 팝업 열기
    const petMapButton = document.getElementById('petMapButton');
    petMapButton.addEventListener('click', function () {
        openPetMapPopup();
    });
});

// 팝업 창 열기 함수
function openPetMapPopup() {
    window.open('/map', 'PetMapPopup', 'width=900,height=500,scrollbars=yes,resizable=yes');
}

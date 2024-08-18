/**
 * header.js
 */

$(document).ready(function () {
    $(".searchBtn").click(function () {
        // 검색 기능 구현
        alert("검색 기능을 실행합니다."); // 예시로 알림창을 띄움
        // 실제 검색 기능을 여기에 추가하기

    }); // 검색버튼 끝

    // 윈도우 스크롤 시 메인 메뉴 고정 
    $(window).on('scroll', function () {
        // 스크롤되는 문서의 top이 #headerBox 이상이면 메인 메뉴 고정되고 그림자 표시 
        if ($(document).scrollTop() >= $('.top-bar').height()) {
            $('#navBar').addClass('navBarFixed');
        } else {
            $('#navBar').removeClass('navBarFixed');
        }
    });

    /**
     * 네비게이션 바 표시/숨김 기능
     */
    // menuToggle 요소와 overallDropdown 요소를 선택
    const menuToggle = document.querySelector('.menuBtn'); // 클래스 선택
    const overallDropdown = document.querySelector('.overall-dropdown');

    // menuToggle 클릭 시 overallDropdown의 표시 상태를 토글
    menuToggle.addEventListener('click', function () {
        overallDropdown.classList.toggle('show'); // show 클래스를 토글하여 드롭다운 표시/숨김
    });

    // 드롭다운 외부 클릭 시 숨기기
    document.addEventListener('click', function (event) {
        if (!menuToggle.contains(event.target) && !overallDropdown.contains(event.target)) {
            overallDropdown.classList.remove('show'); // show 클래스 제거하여 드롭다운 숨김
        }
    });
}); 
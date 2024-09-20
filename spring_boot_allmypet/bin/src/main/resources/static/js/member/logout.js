// 로그아웃 버튼 클릭 시 호출되는 함수
function logout() {
    fetch('/logout', {
        method: 'GET', // 로그아웃 요청을 GET으로 전송
        credentials: 'same-origin' // 현재 도메인과 동일한 오리진에서의 쿠키 전송
    })
    .then(response => {
        if (response.ok) {
            window.location.href = "/";
        } else {
            alert('로그아웃에 실패했습니다. 다시 시도해 주세요.');
        }
    })
    .catch(error => {
        console.error('로그아웃 중 오류 발생:', error);
        alert('로그아웃에 실패했습니다. 다시 시도해 주세요.');
    });
}

// 페이지 로드 시 로그아웃 버튼 클릭 이벤트 등록
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('logoutButton').addEventListener('click', logout);
});


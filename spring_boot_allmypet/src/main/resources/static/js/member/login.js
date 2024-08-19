document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('loginForm');
    const errorMessage = document.createElement('p');
    errorMessage.style.color = 'red';
    form.appendChild(errorMessage);

    form.addEventListener('submit', (event) => {
        event.preventDefault(); // 폼의 기본 동작을 방지

        const memId = form.elements['memId'].value.trim();
        const memPwd = form.elements['memPwd'].value.trim();

        if (validateLogin(memId, memPwd)) {
            // 서버로 폼을 제출
            form.submit();
        } else {
            errorMessage.textContent = '아이디와 비밀번호를 입력해 주세요.';
        }
    });

    function validateLogin(username, password) {
        // 기본적인 입력 검증 로직 (이곳에서 서버 검증을 대체할 수 없음)
        if (memId === '' || memPwd === '') {
            return false;
        }

        // 클라이언트 측에서 검증할 수 있는 로직을 추가할 수 있습니다.
        // 실제 로그인 검증은 서버 측에서 처리해야 합니다.

        return true;
    }
});

function openForgotWindow(event, value) {
  event.preventDefault();
  const width = 700;
  const height = 700;
  const left = (screen.width / 2) - (width / 2);
  const top = (screen.height / 2) - (height / 2);
  if(value == 0){
    window.open('/forgotID', 'ForgotID', `width=${width},height=${height},top=${top},left=${left}`);
  }
  else if(value == 1){
    window.open('/forgotPW', 'ForgotPW', `width=${width},height=${height},top=${top},left=${left}`);
  }
}
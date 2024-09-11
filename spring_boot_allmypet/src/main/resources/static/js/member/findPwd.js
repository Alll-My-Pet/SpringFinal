// findPwd.js
function sendNum() {
    const memId = document.getElementById('memId').value;
    const memEmail = document.getElementById('memEmail').value;

    // AJAX 요청을 통해 인증번호 발송
    $.ajax({
        type: 'POST',
        url: '/mail', // 서버에서 인증번호를 보내는 URL
        data: { id: memId, email: memEmail },
        success: function(response) {
            if (response.success) {
                alert('인증번호가 발송되었습니다.');
                // 추가적인 로직이 필요할 경우 여기에 작성
            } else {
                document.getElementById('emailError').innerText = response.message;
            }
        },
        error: function() {
            alert('메일 발송에 실패했습니다.');
        }
    });
}

function checkNum() {
    const chnum = document.getElementById('chnum').value;
    const memEmail = document.getElementById('memEmail').value;

    // AJAX 요청을 통해 인증번호 확인
    $.ajax({
        type: 'POST',
        url: '/checkNum', // 서버에서 인증번호를 확인하는 URL
        data: { memEmail: memEmail, code: chnum },
        success: function(response) {
            const res = JSON.parse(response);
            if (res.success) {
                // 인증번호가 맞으면 changePwd.jsp로 리다이렉트
                window.location.href = '/changePwd.jsp';
            } else {
                document.getElementById('chnumError').innerText = res.message;
            }
        },
        error: function() {
            alert("인증번호 확인에 실패했습니다.");
        }
    });
}
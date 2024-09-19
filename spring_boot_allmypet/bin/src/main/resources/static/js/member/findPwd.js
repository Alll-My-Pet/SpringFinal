function sendNum() {
	const memEmail = $("#memEmail").val();
    
    if (!memEmail) {
        alert("이메일을 입력해 주세요.");
        return;
    }
    
	    $.ajax({
	        url: "/mail",
	        type: "post",
	        data: { "memEmail": memEmail },
	        success: function(data) {
	            alert("인증번호가 발송되었습니다.");
	            $("#confirm").val(data);
	        }, 
	        error: function(xhr, status, error) {
            	alert("이메일 발송에 실패했습니다. 다시 시도해 주세요.");
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
                window.close();
                window.opener.location.href = 'changePwd';
            } else {
                document.getElementById('chnumError').innerText = res.message;
            }
        },
        error: function() {
            alert("인증번호 확인에 실패했습니다.");
        }
    });
}
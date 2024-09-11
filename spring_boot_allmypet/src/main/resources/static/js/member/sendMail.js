function sendNum() {
	const email = $("#memEmail").val();
    
    if (!email) {
        alert("이메일을 입력해 주세요.");
        return;
    }
    
	    $.ajax({
	        url: "/mail",
	        type: "post",
	        dataType: "json",
	        data: { "memEmail": $("#memEmail").val() },
	        success: function(data) {
	            alert("인증번호가 발송되었습니다.");
	            $("#confirm").val(data);
	        }
	        error: function(xhr, status, error) {
            	alert("이메일 발송에 실패했습니다. 다시 시도해 주세요.");
        	}
	    });
}

function checkNum() {
    var inputNum = $("#chnum").val();
    var confirmNum = $("#confirm").val();

    if (inputNum == confirmNum) {
        alert("인증되었습니다.");
    } else {
        alert("번호가 다릅니다.");
    }
}
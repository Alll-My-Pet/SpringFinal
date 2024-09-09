function sendEmail(){
        $("#mailCheck");
        $.ajax({
            url:"/mail",
            type:"post",
            data:{"mail" : $("#mail").val()},
            success: function(data){
                alert("인증번호 발송");
                $("#confirm").attr("value",data);
            },
	        }
        });
    }

function confirmNumber(){
    var number1 = $("#chnum").val();
    var number2 = $("#confirm").val();

    if(number1 == number2){
        alert("인증되었습니다.");
    }else{
        alert("번호가 다릅니다.");
    }
}
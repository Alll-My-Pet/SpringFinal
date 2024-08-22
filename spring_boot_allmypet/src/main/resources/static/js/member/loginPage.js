/**
 * 
 */
 $(function(){
	$('#loginForm').on('submit',function(){
		event.preventDefault();
		$.ajax({
			type:"post",
			url:"/member/loggingIn",
			data : {"username":$('#memId').val(),
 					"password": $('#memPwd').val()}, 
 			dataType:'text',
 			success:function(result) {
 				if(result.trim() == "success") {
 					location.href= "/";
 				} else {
 					alert("아이디 또는 비밀번호가 일치하지 않습니다");
 					$('#memId').val("");
 					$('#memPwd').val("");
 				}
 			},
 			error:function() {
 				alert("문제가 발생했습니다. 나중에 다시 시도해 주세요.");
 			}
		});
	});
});

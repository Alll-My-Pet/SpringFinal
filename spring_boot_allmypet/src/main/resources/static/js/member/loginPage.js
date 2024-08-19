/**
 * 
 */
 $(function(){
	$('#loginForm').on('submit',function(){
		event.preventDefault();
		$.ajax({
			type:"post",
			url:"/memger/loggingIn",
			data : {"id":$('#memId').val(),
 						"pwd": $('#memPwd').val()}, 
 			dataType:'text',
 			success:function(result) {
 				if(result == "success") {
 					location.href= "/";
 				} else {
 					alert("아이디 또는 비밀번호가 일치하지 않습니다");
 					$('#username').val("");
 					$('#password').val("");
 				}
 			},
 			error:function() {
 				alert("실패");
 			}
		})
	});
});

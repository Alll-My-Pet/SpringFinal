/**
 * 
 */
  $(function() {
  	let idch=false;
  	let nickch=false;
  	
  	/*아이디 체크*/
  	$('#searchId').on('click',function(){
		event.preventDefault();
		let insertId = $('#memId').val();
		if(insertId == ""){
			alert("아이디를 입력 하세요.");
		}else if(insertId.length > 10){
			alert("아이디는 10글자를 초과하실 수 없습니다.");
		}else{
			$.ajax({
	 			type:"post",
	 			url:"/member/idCheck", 
	 			data : {"memId": insertId}, 
	 			dataType:'text', 
	 			success:function(result) {
	 				if(result == "success") {
	 					alert("사용 가능한 아이디입니다");
	 					idch = true;
	 				} else {
	 					alert("사용할 수 없는 아이디입니다.");
	 				}
	 			},
	 			error:function() {
	 				alert("문제가 발생했습니다. 나중에 다시 시도해 주세요.");
	 			}
	 		});
	 	};
  	});
  	
  	/*닉네임 체크*/
  	$('#searchNN').on('click',function(){
		event.preventDefault();
		let insertNN = $('#memNickName').val();
		if(insertNN == ""){
			alert("닉네임을 입력 하세요.");
		}else if(insertNN.length > 10){
			alert("닉네임은 10글자를 초과하실 수 없습니다.");
		}else{
			$.ajax({
	 			type:"post",
	 			url:"/member/nnCheck", 
	 			data : {"memNickName": insertNN}, 
	 			dataType:'text', 
	 			success:function(result) {
	 				if(result == "success") {
	 					alert("사용 가능한 닉네임 입니다");
	 					nickch = true;
	 				} else {
	 					alert("사용할 수 없는 닉네임 입니다.");
	 					nickch = false;
	 				}
	 			},
	 			error:function() {
	 				alert("문제가 발생했습니다. 나중에 다시 시도해 주세요.");
	 			}
	 		});
	 	};
  	});
  	
  	
  	$('#submitBtn').on('click', function() {
		event.preventDefault();
		let pwV = $('#memPwd').val();
		let pwVC = $('#pwcheck').val();
		
		if(idch ==false){
			alert("아이디 중복체크가 필요 합니다.")
		}else if(pwV != pwVC){
			alert("비밀번호가 같지 않습니다.")			
		}else if(nickch==false){
			alert("닉네임 중복체크가 필요 합니다.")		
		}else{
			$('#joinForm').submit();
		}
	});
  	
  });
 
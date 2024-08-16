/**
 * 
 */
  $(function() {
  
  
  	$('#searchId').on('click',function(){
		event.preventDefault();
		let insertId = $('#id').val();
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
	 				alert("실패");
	 			}
	 		});
	 	};
  	
  	});
  });
 
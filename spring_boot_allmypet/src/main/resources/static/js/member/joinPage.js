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
	 				}
	 			},
	 			error:function() {
	 				alert("문제가 발생했습니다. 나중에 다시 시도해 주세요.");
	 			}
	 		});
	 	};
  	});
  	
  	// 포지션 체크박스 하나만 선택 가능 함수
    function restrictPositionSelection(checkbox) {
        $('input[name="position"]').not(checkbox).prop('checked', false);
    }
    // 포지션 체크박스 클릭 이벤트
    $('input[name="position"]').on('click', function() {
        restrictPositionSelection(this);
    });
    
    // 필터링 체크박스 선택 제한 함수
    function restrictFilteringSelection() {
        const maxAllowed = 5; // 최대 선택 개수
        const selectedCount = $('input[name="filtering"]:checked').length;
        
        if (selectedCount > maxAllowed) {
            alert("최대 ${maxAllowed}개까지 선택할 수 있습니다.");
            $('input[name="filtering"]').prop('checked', false); // 선택 해제
        }
    }
    // 필터링 체크박스 클릭 이벤트
    $('input[name="filtering"]').on('change', function() {
        restrictFilteringSelection();
    });
  	
  	// 폼 제출
  	$('#joinBtn').on('click', function() {
		event.preventDefault();
		let pwV = $('#memPwd').val();
		let pwVC = $('#pwcheck').val();
		
		if(idch == false){
			alert("아이디 중복체크가 필요 합니다.")
		}else if(pwV != pwVC){
			alert("비밀번호가 같지 않습니다.")			
		}else if(nickch == false){
			alert("닉네임 중복체크가 필요 합니다.")		
		}else{
			
			// 폼 제출
			$('#joinForm').submit();
		}
	});	
  	
  });
 
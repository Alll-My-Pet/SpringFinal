/**
 * 
 */
 $(function(){
 	/*추가 버튼 클릭시 div생성*/
 	
    $('#info_pet_addition_btn').click(function() {
        // 선택된 div 요소들을 찾기
        const divs = $('div.info_pet_area.div_display_none');

        // 현재 index가 범위 내에 있는지 확인 후 div_display_none 클래스 제거
        if (1 < divs.length) {
            $(divs[0]).removeClass('div_display_none');
        }else if(0<divs.length){
        	$(divs[0]).removeClass('div_display_none');
        	$('.info_pet_addition').addClass('div_display_none');
        };
        

    });
	/*버튼 클릭시 특정 div안보이게*/
    $('.pet_cancel_btn ').click(function() {
		$(this).parent().parent().find('input[type="text"]').val('');
		$(this).parent().parent().addClass('div_display_none');
		$(this).siblings('.pet_radio').prop('checked', false);
		$(this).siblings('.representative_pet').addClass('div_display_none');
		
		const divs = $('div.info_pet_area.div_display_none');
		if (0 < divs.length) {
            $('.info_pet_addition').removeClass('div_display_none');
        }
    });
    
    /* 대표 동물 선택 */
    $('.pet_radio').change(function() {
        // 모든 .representative_pet 요소에서 .div_display_none 클래스를 추가하여 숨김 처리
        $('.representative_pet').addClass('div_display_none');
        
        // 선택된 라디오 버튼의 부모 .pet_name_area 안의 .representative_pet 요소에서 .div_display_none 클래스를 제거
        $(this).siblings('.representative_pet').removeClass('div_display_none');
    });
    
    /*이미지 변경*/
    
    $('#edit_img_btn').click(function() {
        $('#imageInput').click(); // 파일 선택 다이얼로그 열기
    });
    $('#imageInput').change(function() {
        var file = this.files[0]; // 사용자가 선택한 파일
        if (file) {
            // 이미지 영역에 출력
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#edit_t_img_area').html('<img id="edit_img" src="' + e.target.result + '" alt="Image Preview" >');
            }
            reader.readAsDataURL(file); // 파일을 읽어 미리보기로 표시

            // 파일 정보를 서버로 전송 ( Ajax)
            // 이부분은 당장에 안올리고 수정 버튼 눌렀을시에 반응해도 좋을듯
            var formData = new FormData();
            formData.append('image', file);

            $.ajax({
                url: '/upload', // 서버의 이미지 처리 경로 추후 변경
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                success: function(response) {
                    console.log('File uploaded successfully', response);
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error('File upload failed', textStatus, errorThrown);
                }
            });
        }
    });
    /*회원 정보 수정*/
    $('#phone_num').on('input', function() {
        // 숫자 이외의 문자를 제거
        this.value = this.value.replace(/[^0-9]/g, '');
    });
    let nickname_check=true;
    var default_nickname = $('#nickname_text_area').data('nickname');
    
    $('#nickname_text_area').on('change',function(){
    	nickname_check=false;
    });
    $('#nickname_check_btn').on('click',function(){
    	event.preventDefault();
    	var nickname = $('#nickname_text_area').val();
    	if(nickname == ""){
			alert("닉네임을 입력 하세요.");
		}else if(nickname.length > 10){
			alert("닉네임은 10글자를 초과하실 수 없습니다.");
		}else{
			$.ajax({
	 			type:"post",
	 			url:"/member/nnCheck", 
	 			data : {"memNickName": nickname}, 
	 			dataType:'text', 
	 			success:function(result) {
	 				if(result == "success"|| nickname==default_nickname) {
	 					alert("사용 가능한 닉네임 입니다");
	 					nickname_check = true;
	 				} else {
	 					alert("사용할 수 없는 닉네임 입니다.");
	 				}
	 			},
	 			error:function() {
	 				alert("실패");
	 			}
	 		});
	 	};
    });
    
    $('#edit_regis_btn').on('click',function(){
    	//e.preventDefault();
    	var file = $('#imageInput')[0].files[0];
    	
        var petData = [];

        $(".info_pet_area").each(function(index, element) {
            if (!$(element).hasClass("div_display_none")) {
                var pet = {
                    petCtgNo: $(element).find(".pet_species").val(),
                    petName: $(element).find(".pet_name").val(),
                    birth:$(element).find(".pet_birth_year").val()+"-"+$(element).find(".pet_birth_month").val()+"-"+$(element).find(".pet_birth_day").val(),
                    rep_pet: $(element).find(".pet_radio").is(":checked")
                };
                petData.push(pet);
            }
        });

        $.ajax({
            type: "POST",
            url: "/mypage/petDateUpdate", // 데이터를 보낼 컨트롤러의 URL
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: JSON.stringify(petData)
        });
    	
    	
    	
    	
    	if(!nickname_check){
    		alert("닉네임 중복체크를 해주세요");
    	}else if (file) {
            var formData = new FormData();
            formData.append('image', file);

            $.ajax({
                url: '/mypage/uploadImage', // 서버에 파일을 업로드할 경로
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                success: function(response) {
                	console.log(response);
                    // 서버에서 반환한 이미지 파일명을 hidden input에 설정
                    $('#profileImage').val(response);
                    // 나머지 폼 데이터를 서버로 전송
                    $('#edit_info_area').off('submit').submit();
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error('File upload failed', textStatus, errorThrown);
                }
            });
        } else{
    		$('#edit_info_area').off('submit').submit();
    	}
    });
 });
 
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
 })
 
/**
 * 
 */
 $(function(){
 	let mgtNo_check=false; // 인허가 번호 확인
 	$('#mgtNo_btn').click(function() {
            var licenseNumber = $('#mgtNo_input').val();
            $.ajax({
                url: '/api/dealer',
                type: 'GET',
                data: { licenseNumber: licenseNumber },
                success: function(data) {
                    if (data) {
                    	$('#apvPermYmd_input').val(data.apvPermYmd);
                    	$('#apvCancelYmd_input').val(data.apvCancelYmd);
                    	$('#bplcNm_input').val(data.bplcNm);
                    	$('#siteTel_input').val(data.siteTel);
                    	$('#address_no').val(data.rdnPostNo);
                    	$('#address_f').val(data.siteWhlAddr);
                    	mgtNo_check =true;
                    } else {
                        alert('찾을수 없습니다.');
                        $('#mgtNo_input').val("");
                    }
                }
            });
        });
	$('#breaders_info_submit').on('click',function(){
		
		if(!mgtNo_check){
			alert("인허가 번호를 확인하세요.");
			$("#mgtNo_input").focus();
		}else if(!$('#bplcNm_input').val()){
			alert("사업장명을 입력해 주세요.");
			$("#bplcNm_input").focus();
		}else if(!$('#siteTel_input').val()){
			alert("사업장 번호를 입력해 주세요.");
			$("#siteTel_input").focus();
		}else if(!$('#address_no').val()){
			alert("우편번호를 입력해 주세요.");
			$("#address_no").focus();
		}else if(!$('#address_f').val()){
			alert("사업장 주소를 입력해 주세요.");
			$("#address_f").focus();
		}else{
			$('#breaders_info_form').off('submit').submit();
		}
		
	});
	$('#breaders_update_btn').on('click',function(){
		var formData = $("#breaders_info_form").serialize();
		if(!mgtNo_check){
			alert("인허가 번호를 확인하세요.");
			$("#mgtNo_input").focus();
		}else if(!$('#bplcNm_input').val()){
			alert("사업장명을 입력해 주세요.");
			$("#bplcNm_input").focus();
		}else if(!$('#siteTel_input').val()){
			alert("사업장 번호를 입력해 주세요.");
			$("#siteTel_input").focus();
		}else if(!$('#address_no').val()){
			alert("우편번호를 입력해 주세요.");
			$("#address_no").focus();
		}else if(!$('#address_f').val()){
			alert("사업장 주소를 입력해 주세요.");
			$("#address_f").focus();
		}else{
			$.ajax({
			    url: '/mypage/breederUpdate', // 데이터를 보낼 컨트롤러 URL
			    type: 'POST',
			    data: formData
			});
		}
		
	});
 });
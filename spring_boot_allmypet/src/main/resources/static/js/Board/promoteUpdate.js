/**
 * mainBoardText.js
 */
 
 window.onload = function() {
	document.getElementById('promoteUpdateFrm').onsubmit = function() {
    event.preventDefault();
		
	let petCtgNo = document.getElementById('petCtgNo');
		let parcelOutInfo = document.getElementById('parcelOutInfo');
		let petName = document.getElementById('petName');
		let placeInfo = document.getElementById('placeInfo');
	
		if(petName.value == ""){
		
			alert("반려동물 이름을 입력하세요");
			petName.focus(petName);
			return false;
			
		}else if(placeInfo.value == ""){
		
			alert("분양처 명을 입력하세요");
			placeInfo.focus(placeInfo);
			return false;
			
		}else if(petCtgNo.value == 0){
		
			alert("반려동물 종을 선택해 주세요");
			return false;
			
		}else if(parcelOutInfo.value == 0){
		
			alert("분양 방법을 선택해 주세요");
			return false;
			
		};	
		
		this.submit();
		
	}; // onsubmit 끝
	
	
};  // window.onload 끝


$(document).ready(function() {
    $('.promoteUpdateFrm').on('submit', function(event) {
        event.preventDefault();

        var formData = $(this).serialize(); // 폼 데이터 직렬화
        var postNo = $('#postNo').val();

        $.ajax({
            type: "POST",
            url: "/board/updatePromote", 
            data: formData,
            dataType: 'text',
            success: function(result) {
                if (result == "success") {
                    alert("게시글 수정 완료.");
                    location.href = "/board/promoteDetailView/" + postNo; // 해당 게시글 상세 페이지로 이동
                } else if (result == "fail") {
                    alert("비밀번호가 일치하지 않습니다");
                    location.reload(); // 현재 페이지 새로고침
                } else {
                    alert("수정 실패");
                }
            },
            error: function() {
                alert("오류가 발생했습니다");
            }
        });
    });
    
    $('#postImgFile').change(function(event) {
        var file = event.target.files[0]; // 선택된 파일 가져오기
        if (file) {
            var reader = new FileReader();
            
            reader.onload = function(e) {
                // 파일이 읽혀졌을 때 미리보기 이미지 설정
                $('.thumbNailPreview').html('<img src="' + e.target.result + '" alt="미리보기 이미지">');
            };
            
            reader.readAsDataURL(file); // 파일을 Data URL로 읽기
        } else {
            $('.thumbNailPreview').html(''); // 파일이 선택되지 않았을 때 미리보기 영역 비우기
        }
    });
    
    
});
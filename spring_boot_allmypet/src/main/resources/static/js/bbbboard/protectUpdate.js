/**
 * mainBoardText.js
 */
 
 window.onload = function() {
	document.getElementById('protectUpdateFrm').onsubmit = function() {
    event.preventDefault();
    
		let headerNo = document.getElementById('headerNo');
		let companyName = document.getElementById('companyName');
		let postTitle = document.getElementById('postTitle');
	
		if(companyName.value == ""){
		
			alert("업체명을 입력하세요");
			companyName.focus(companyName);
			return false;
			
		}else if(postTitle.value == ""){
		
			alert("제목을 입력하세요");
			postTitle.focus(postTitle);
			return false;
			
		}else if(headerNo.value == 0){
		
			alert("머");
			return false;
			
		};
		
		
		
		this.submit();
		
	}; // onsubmit 끝
	
	
};  // window.onload 끝


$(document).ready(function() {
    $('.protectUpdateFrm').on('submit', function(event) {
        event.preventDefault();

        var formData = $(this).serialize(); // 폼 데이터 직렬화
        var bodNo = $('#postNo').val();

        $.ajax({
            type: "POST",
            url: "/board/ProtectUpdate", 
            data: formData,
            dataType: 'text',
            success: function(result) {
                if (result == "success") {
                    alert("게시글 수정 완료.");
                    location.href = "/board/ProtectDetailView/" + bodNo; // 해당 게시글 상세 페이지로 이동
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
});
/**
 *  
 */

 window.onload = function() {
    // 이미지 업로드 파일 변경 시 미리보기
    document.getElementById('postImgFile').onchange = function(event) {
        const file = event.target.files[0];
        const imagePreview = document.getElementById('imagePreview');
        const analyzeBtn = document.getElementById('analyzeBtn');

        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                imagePreview.src = e.target.result;
                imagePreview.style.display = 'block';
                analyzeBtn.style.display = 'block'; // "적합도 판정" 버튼 보이기
            };
            reader.readAsDataURL(file);
        } else {
            imagePreview.src = '';
            imagePreview.style.display = 'none';
            analyzeBtn.style.display = 'none'; // 이미지 없으면 버튼 숨기기
        }
    };

    
    
    // 게시글 작성 폼 제출 시 유효성 검사
    document.getElementById('mainSubmitFrm').onsubmit = function(event) {
        event.preventDefault();
        
        let postTitle = document.getElementById('postTitle');
        let postContent = document.getElementById('postContent');
        
        // 제목이 없는 경우
        if (postTitle.value.trim() === "") {
            alert("제목을 입력하세요");
            postTitle.focus();
            return false;
        }

        // 내용이 없는 경우
        if (postContent.value.trim() === "") {
            alert("내용을 입력하세요");
            postContent.focus();
            return false;
        }

        // 유효성 검사를 통과하면 폼을 제출
        this.submit();
    };
};  // window.onload 끝

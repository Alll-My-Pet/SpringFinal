/**
 * emojiWrite.js 하단 페이징 관련
 */

function previewImage(event) {
    const file = event.target.files[0];
    const reader = new FileReader();
    
    reader.onload = function(e) {
        const imgPreview = document.getElementById('emoImgPreview');
        imgPreview.src = e.target.result; // 업로드한 이미지의 데이터를 src에 설정
        imgPreview.style.display = 'block'; // 미리보기 이미지를 표시
    }
    
    if (file) {
        reader.readAsDataURL(file); // 파일을 데이터 URL로 읽기
    }
}
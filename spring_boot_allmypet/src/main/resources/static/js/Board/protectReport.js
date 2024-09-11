/**
 * protectReport.js
 */
 $(document).ready(function() {
    $('#postImg').change(function(event) {
        var file = event.target.files[0]; // 선택된 파일 가져오기
        if (file) {
            var reader = new FileReader();
            
            reader.onload = function(e) {
                // 파일이 읽혀졌을 때 미리보기 이미지 설정
                $('.ImgPreviewBox').html('<img src="' + e.target.result + '" alt="미리보기 이미지">');
            };
            
            reader.readAsDataURL(file); // 파일을 Data URL로 읽기
        } else {
            $('.ImgPreviewBox').html(''); // 파일이 선택되지 않았을 때 미리보기 영역 비우기
        }
    });
});
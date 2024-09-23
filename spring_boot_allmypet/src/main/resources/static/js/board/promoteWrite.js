/**
 * mainBoardText.js
 */
 
 window.onload = function() {
	document.getElementById('promoteFrm').onsubmit = function() {
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
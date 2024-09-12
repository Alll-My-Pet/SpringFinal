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
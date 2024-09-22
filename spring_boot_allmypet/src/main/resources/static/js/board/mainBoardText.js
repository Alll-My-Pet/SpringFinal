/**
 * mainBoardText.js
 */
 
 window.onload = function() {
	document.getElementById('mainSubmitFrm').onsubmit = function() {
    event.preventDefault();
    
		let postTitle = document.getElementById('postTitle');
		let postContent = document.getElementById('postContent');
		let boardCtgNo = document.getElementById('boardCtgNo');
		let postTypeNo = document.getElementById('postTypeNo');
	
		if(postTitle.value == ""){
		
			alert("제목을 입력하세요");
			postTitle.focus(postTitle);
			return false;
			
		}else if(postContent.value == ""){
		
			alert("내용을 입력하세요");
			postContent.focus(postContent);
			return false;
			
		}else if(boardCtgNo.value == 0){
		
			alert("게시판 종류를 선택하세요");
			return false;
			
		}else if(postTypeNo.value == 0){
		
			alert("머리글 종류를 선택하세요");
			return false;
			
		};
		
		this.submit();
		
	}; // onsubmit 끝
	
	
};  // window.onload 끝
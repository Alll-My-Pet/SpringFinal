/**
 *  bulletin_form.js 전체게시판 게시글 작성
 */

 window.onload = function() {
	document.getElementById('mainSubmitFrm').onsubmit = function() {
    event.preventDefault();
    	
    	let petCtgNo = document.getElementById('petCtgNo');
		let postTitle = document.getElementById('postTitle');
		let postContent = document.getElementById('postContent');
	
		if(postTitle.value == ""){
		
			alert("제목을 입력하세요");
			postTitle.focus(postTitle);
			return false;
			
		}else if(postContent.value == ""){
		
			alert("내용을 입력하세요");
			postContent.focus(postContent);
			return false;
			
		}
		
		this.submit();
		
	}; // onsubmit 끝
	
	
};  // window.onload 끝
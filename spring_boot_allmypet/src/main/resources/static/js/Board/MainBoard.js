/**
 *  MainBoard.js
 */
 
 $(document).ready(function() {
 
$('#BoardSearchBar').on('submit', function() {
 		event.preventDefault();
 		
 		// 폼에 입력한 여러 개의 값을 쿼리스트링 방식의 데이터로 변환: serialize() 사용
 		// type=prdName&keyword=노트북
 		let formData = $(this).serialize();
 		
 		let keyword = $('#SearchBox').val();
 		let type = $('#BFilter').val();
 		

 		$.ajax({
 			type:"post",
 			url:"/board/boardSearch", 
 			data : formData,
 			success:function(result) { // 컨트롤러에서 반환한 boardList를 result가 받음
 			// 반환된 결과(ArrayList<ProductVO>를 searchResultBox에 테이블 형태로 출력
 				$('#boardList').empty();
 			
 				if(result == ""){ // 검색 결과 없는 경우
 					$('#boardList').append('<tr align="center"><td colspan="4">찾는 게시글이 존재하지 않습니다.</td></tr>');
 				} else {
 				
 					result.reverse()
 					
 					for(let i=0; i<result.length; i++) {
 						let board_date = new Date(result[i].bodDate);
 						let year = board_date.getFullYear();
 						let month = (board_date.getMonth() + 1).toString().padStart(2, '0');
 						let date = (board_date.getDate().toString().padStart(2, '0'));
 						let bodDate = `${year}-${month}-${date}`;	 							
						$('#boardList').append('<tr><td>' + result[i].bodNo + '</td><td>'+
												result[i].bodTitle + '</td><td>' +
											    result[i].memId + '</td><td>' +
											    bodDate + '</td><tr>');
						
	 					}
 				}
 				
 				
 			},
 			error:function() {
 				alert("실패");
 			}
 		});
 		
 	  
 	});
 	
});

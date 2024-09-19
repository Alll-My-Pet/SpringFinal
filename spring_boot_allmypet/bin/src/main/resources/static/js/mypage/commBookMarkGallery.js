/**
 * 
 */
 $(function(){
 	// 북마크한 이미지 마우스 호버 시 액션
 	$(".bmg_gallery_list").each(function(){
 		let child = $(this).children(".bmg_img_overlay");
 		$(this).hover(function(){
			child.css('background-color', 'rgba(0, 0, 0, 0)');
			},function(){
			child.css('background-color', 'rgba(0, 0, 0, 0.2)');
		});
	});
 })
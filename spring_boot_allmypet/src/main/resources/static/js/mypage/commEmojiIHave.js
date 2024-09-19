/**
 * 
 */
 $(function{
 	function updateFavorites(purchaseId){
  	    
        $.ajax({
            url: '/mypage/emoji/updateFavorites',
            type: 'POST',
            data: { purchaseId: purchaseId },
            success: function(response) {
                if(response){
					location.reload(true);
            	}else{
            		 alert('이미 등록된 이모지 입니다.');
            	}
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Failed to fetch points', textStatus, errorThrown);
            }
        });
        
    };
 	$('.purch_favorites_btn').on('click',function(){
 		var purchaseId = $(this).data('emo-no');
 		updateFavorites(purchaseId);
 	});    
 });
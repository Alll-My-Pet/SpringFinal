/**
 * 
 */
 $(function(){
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
    }
 	function deleteFavorites(purchaseId){
  	    
        $.ajax({
            url: '/mypage/emoji/deleteFavorites',
            type: 'POST',
            data: { purchaseId: purchaseId },
            success: function() {
				location.reload(true);
				console.log("test")
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Failed to fetch points', textStatus, errorThrown);
            }
        });
    }
 
 	$('.purch_favorites_btn').on('click',function(){
 		var purchaseId = $(this).data('emo-no');
 		updateFavorites(purchaseId);
 	});
 	$('.my_favorites_btn').on('click',function(){
 		var purchaseId = $(this).data('emo-no');
 		var check = $(this).data('emj-check');
 		if(check==="승인완료"){
 			updateFavorites(purchaseId);
 		}else{
 			alert('승인되지 않은 이모지 입니다.');
 		}
 	});
 	$('.mej_favorites_cancel').on('click',function(){
 		var purchaseId = $(this).data('emjno');
 		deleteFavorites(purchaseId);
 	});
 });
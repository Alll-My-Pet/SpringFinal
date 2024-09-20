/**
 * 
 */
 $(function(){
	
    $('#total_check').on('click',function(){
    	if ($('#total_check').is(':checked')) {
    		$('.mbl_checkbox').prop('checked', true);
    	}else{
    		$('.mbl_checkbox').prop('checked', false)
    	}	
    });
    $('.mbl_checkbox').on('click',function(){
    	if(!$(this).is(':checked')){
    		$('#total_check').prop('checked', false)
    	}
    })
    /* 블락리스트에서 삭제 */
    $('#mbl_delete_btn').on('click',function(){
    	var selectedIds = [];

        $('.mbl_checkbox:checked').each(function() {
            var blockedMemId = $(this).closest('.mbl_list').find('.mbl_id').text();
            selectedIds.push(blockedMemId.trim());
        });
        
        if (selectedIds.length > 0) {
            $.ajax({
                url: '/blockList/delete',
                type: 'POST',
                data: JSON.stringify({ ids: selectedIds }),
                contentType: 'application/json; charset=utf-8',
                success: function(response) {
                
					if(response){
						location.reload(true);
					}
                    
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error('블락 멤버를 선택해 주세요', textStatus, errorThrown);
                }
            });
        } else {
            alert('블락 멤버를 선택해 주세요');
        }
    });
    /* 블락리스트에서 수정*/
    $('#mbl_edit_btn').on('click',function(){
    	var selectedInfoList = [];
    	$('.mbl_checkbox:checked').each(function() {
            var blockedMemId = $(this).closest('.mbl_list').find('.mbl_id').text();
            var blockedReason = $(this).closest('.mbl_list').find('.mbl_reason').val();
            var selectedInfo=[blockedMemId,blockedReason]
            selectedInfoList.push(selectedInfo);
        });
        console.log(selectedInfoList);
        if (selectedInfoList.length > 0) {
            $.ajax({
                url: '/blockList/update',
                type: 'POST',
                data: JSON.stringify({ lists: selectedInfoList }),
                contentType: 'application/json; charset=utf-8',
                success: function(response) {
					if(response){
						location.reload(true);
					}
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error('블락 멤버를 선택해 주세요', textStatus, errorThrown);
                }
            });
        } else {
            alert('블락 멤버를 선택해 주세요');
        }
    	
    });
    
    /*블락리스트 검색*/
    $('#mbl_searchIcon').on('click',function(){
    	var searchValue = $('#mbl_search_text').val();
    	if (searchValue != ""){
    		$.ajax({
            url: '/blockList/search',
            type: 'POST',
            data: {searchValue: searchValue},
            success: function(response) {
            	console.log(response)
            	var blockListHtml='';
            	
                $.each(response.blockLists, function(index, blockList) {
                	var bld = blockList.block_date.split('T')[0];
	        		blockListHtml +='<div class="mbl_list">'+
									'<div class="list_checkbox_area"><input type="checkbox" class="mbl_checkbox"></div>' +
									'<div class="mbl_id">'+blockList.blocked_memId+'</div>'+
									'<div class="mbl_name">'+blockList.memNickName+'</div>'+
									'<div class="mbl_reason_area"><input class="mbl_reason"type="text" value="'+blockList.block_reason+'"></div>'+
									'<div class="mbl_date">'+bld + '</div></div>'
                });
                $('#mbl_lists').html(blockListHtml);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('검색어를 입력하세요', textStatus, errorThrown);
            }
        });	
    	}else{
    		alert('검색어를 입력하세요');
    	}
    	
    });
 })
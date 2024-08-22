/**
 * 
 */
 $(function(){
 	function updateDivision(selectedValue){
        var requestData = { selectedValue: selectedValue };
        $.ajax({
            url: '/mypage/post_comment/updateDiv',
            type: 'POST',
            data: requestData,
            success: function(response) {
                var mpcHTML='';
                            $.each(response.postsComments, function(index, pC) {
                var type = pC.source_table == 'comment' ? '댓글' : '게시글';
                
                var date = new Date(pC.date);
                var formattedDate = date.getFullYear() + '-' + 
                                    ('0' + (date.getMonth() + 1)).slice(-2) + '-' + 
                                    ('0' + date.getDate()).slice(-2) + ' ' + 
                                    ('0' + date.getHours()).slice(-2) + ':' + 
                                    ('0' + date.getMinutes()).slice(-2) + ':' + 
                                    ('0' + date.getSeconds()).slice(-2);

                mpcHTML += '<div class="mpc_post_list">' +
                    '<div class="mpc_list_type">' + type + '</div>' +
                    '<div class="mpc_list_title inner_text_div">' + pC.content + '</div>' +
                    '<div class="mpc_list_date">' + formattedDate + '</div>' +
                    '</div>';
            	});
            $('#mpc_lists').html(mpcHTML);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Failed to fetch points', textStatus, errorThrown);
            }
        });
    }
    function updateSearch(searchDiv,searchContents){
    	var serachData = { searchDiv: searchDiv, searchContents: searchContents };
 			
 		$.ajax({
            url: '/mypage/post_comment/updateSearch',
            type: 'POST',
            data: serachData,
            success: function(response) {
                var mpcHTML='';
                $.each(response.postsComments, function(index, pC) {
                var type = pC.source_table == 'comment' ? '댓글' : '게시글';
                
                var date = new Date(pC.date);
                var formattedDate = date.getFullYear() + '-' + 
                                    ('0' + (date.getMonth() + 1)).slice(-2) + '-' + 
                                    ('0' + date.getDate()).slice(-2) + ' ' + 
                                    ('0' + date.getHours()).slice(-2) + ':' + 
                                    ('0' + date.getMinutes()).slice(-2) + ':' + 
                                    ('0' + date.getSeconds()).slice(-2);

                mpcHTML += '<div class="mpc_post_list">' +
                    '<div class="mpc_list_type">' + type + '</div>' +
                    '<div class="mpc_list_title inner_text_div">' + pC.content + '</div>' +
                    '<div class="mpc_list_date">' + formattedDate + '</div>' +
                    '</div>';
            	});
            $('#mpc_lists').html(mpcHTML);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Failed to fetch points', textStatus, errorThrown);
            }
        });	
 			
    }
    
 	$('#mpc_type').on('change', function() {
        var selectedValue = $(this).val();
        if (selectedValue === "mpc_all_post") {
            selectedValue = -1;
        }
        updateDivision(selectedValue);
    });
    $('#search_btn').on('click',function(){
    	var searchDiv=$('.mpc_filter').val();
    	var searchContents =$('.mpc_search_text').val();
    	
    	updateSearch(searchDiv,searchContents);
    });
 
 });
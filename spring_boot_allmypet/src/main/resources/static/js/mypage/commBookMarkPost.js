/**
 * 
 */
  $(function(){
  
    function updateDivision(selectedValue){
  	    
        var requestData = { selectedValue: selectedValue };
        $.ajax({
            url: '/mypage/bookMark_post/updateDiv',
            type: 'POST',
            data: requestData,
            success: function(response) {
                var bookMarkHtml='';
                $.each(response.bookMarkList, function(index, bookMark) {
                    var bmd = bookMark.bookmarkDate.split('T')[0];
                    bookMarkHtml += '<div class="bmp_post_list">' +
                        '<div class="bmp_list_type">'+ bookMark.headerName + '</div>' +
                        '<div class="bmp_list_title inner_text_div">' + bookMark.postTitle + '</div>' +
                        '<div class="bmp_list_writer inner_text_div">' + bookMark.author + '</div>' +
                        '<div class="bmp_list_post_date">' +bookMark.postDate + '</div>' +
                        '<div class="bmp_list_date">' + bmd +
                        '</div></div>';
                });
                $('#bookMark_List').html(bookMarkHtml);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Failed to fetch points', textStatus, errorThrown);
            }
        });
    }
    function updateSearch(searchDiv,searchContents){
    	var serachData = { searchDiv: searchDiv, searchContents: searchContents };
 			
 		$.ajax({
            url: '/mypage/bookMark_post/updateSearch',
            type: 'POST',
            data: serachData,
            success: function(response) {
            	var bookMarkHtml='';
                $.each(response.bookMarkList, function(index, bookMark) {
                    var bmd = bookMark.bookmarkDate.split('T')[0];
                    bookMarkHtml += '<div class="bmp_post_list">' +
                        '<div class="bmp_list_type">'+ bookMark.headerName + '</div>' +
                        '<div class="bmp_list_title inner_text_div">' + bookMark.postTitle + '</div>' +
                        '<div class="bmp_list_writer inner_text_div">' + bookMark.author + '</div>' +
                        '<div class="bmp_list_post_date">' +bookMark.postDate + '</div>' +
                        '<div class="bmp_list_date">' + bmd +
                        '</div></div>';
                });
                $('#bookMark_List').html(bookMarkHtml);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Failed to fetch points', textStatus, errorThrown);
            }
        });	
 			
    }

    $('#bmp_type').on('change', function() {
        var selectedValue = $(this).val();
        if (selectedValue === "bmp_all_post") {
            selectedValue = -1;
        }
        updateDivision(selectedValue);
    });
    $('#search_btn').on('click',function(){
    	var searchDiv=$('.bmp_filter').val();
    	var searchContents =$('.bmp_search_text').val();
    	
    	updateSearch(searchDiv,searchContents);
    });
  });
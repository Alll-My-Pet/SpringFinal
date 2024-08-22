/**
 * 
 */
 $(function(){
 	
 	function updatePoints(month) {
        $.ajax({
            url: '/mypage/getMonthlyPoints',
            type: 'POST',
            data: { month: month },
            success: function(response) {
                $('#mp_pd_month_num').text(month);
                $('#pd_tbc_plus').text(response.positive + ' P');
                $('#pd_tbc_minus').text(response.negative + ' P');

                var historyHtml = '';
                $.each(response.pointList, function(index, pointInfo) {
                    var pointClass = pointInfo.point_change > 0 ? 'mp_point_plus' : 'mp_point_minus';
                    var pointSign = pointInfo.point_change > 0 ? '+' : '';
                    historyHtml += '<div class="mp_point_history_div ' + pointClass + '">' +
                        '<div class="point_class">' + pointInfo.reason + '</div>' +
                        '<div class="point_date">' + pointInfo.change_date + '</div>' +
                        '<div class="point_count">' + pointSign + pointInfo.point_change + '</div>' +
                        '</div>';
                });

                $('#mp_pd_point_history').html(historyHtml);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Failed to fetch points', textStatus, errorThrown);
            }
        });
    };
    function onlyPMclass(month, check){
    	$.ajax({
            url: '/mypage/onlyPMclass',
            type: 'POST',
            data: { month: month,
            		check: check },
            success: function(response) {
                $('#mp_pd_month_num').text(month);
                $('#pd_tbc_plus').text(response.positive + ' P');
                $('#pd_tbc_minus').text(response.negative + ' P');

                var historyHtml = '';
                $.each(response.pointList, function(index, pointInfo) {
                    var pointClass = pointInfo.point_change > 0 ? 'mp_point_plus' : 'mp_point_minus';
                    var pointSign = pointInfo.point_change > 0 ? '+' : '';
                    historyHtml += '<div class="mp_point_history_div ' + pointClass + '">' +
                        '<div class="point_class">' + pointInfo.reason + '</div>' +
                        '<div class="point_date">' + pointInfo.change_date + '</div>' +
                        '<div class="point_count">' + pointSign + pointInfo.point_change + '</div>' +
                        '</div>';
                });

                $('#mp_pd_point_history').html(historyHtml);
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error('Failed to fetch points', textStatus, errorThrown);
            }
        });
    }
 	$('.month_arrow_btn').on('click', function(){
        var month = parseInt($('#mp_pd_month_num').text(), 10);
        if ($(this).is('#mp_pd_month_left_btn') && month > 1) {
            month -= 1;
        } else if ($(this).is('#mp_pd_month_right_btn') && month < 12) {
            month += 1;
        }
        $('#mp_pd_month_num').text(month);
        
        updatePoints(month);
    });
 	$('#mp_pd_total_btn').on('click',function(){
 		var month = parseInt($('#mp_pd_month_num').text(), 10);
 		updatePoints(month);
 	});
 	$('.mp_pd_btn').on('click',function(){
 		var check=0;
 		var month = parseInt($('#mp_pd_month_num').text(), 10);
 		if($(this).is('#mp_pd_plus_btn')){
 			check+=1;
 		}else if($(this).is('#mp_pd_minus_btn')){
 			check-=1;
 		};
 		onlyPMclass(month, check);
 	});
 })
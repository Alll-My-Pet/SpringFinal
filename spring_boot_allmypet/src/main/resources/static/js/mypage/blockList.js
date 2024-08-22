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
    
    
 })
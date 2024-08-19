/*FB받은 부분 */
  function searchAddress() {
    new daum.Postcode({
		oncomplete:function(data){
			let findaddress='  ';
			
			if(data.userSelectedType==='R'){
				findaddress=data.roadAddress;
			}else{
				findaddress=data.jibunAddress;
			}
  document.getElementById('address1').value = findaddress;
 				 }
		
	}).open();



  }
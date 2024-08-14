/**
 * searchZip.js
 */
 
 $(document).ready(function() {
  	$('#address_btn').on('click', function() {
  		new daum.Postcode({
  			oncomplete:function(data) {
  				let address1 = "";
  				
  				// 도로명 주소인 경우
  				if(data.userSelectedType == 'R') {
  					address1 = data.roadAddress + "(" + data.bname + data.buildingName + ")";
  				}else { // 지번 주소인 경우
  					address1 = data.jibunAddress;
  				}
  			
  				// 입력란에 우편번오, 주소1 출력 
  				document.getElementById('address_no').value = data.zonecode;
  				document.getElementById('address_f').value = address1;
  				
  				// address2에 입력 시 이미 입력되어 있는 값 삭제하고 포커스
  				let address2 = document.getElementById('address_s');
  				address2.value = "";
  				address2.focus();
  			}  		
  		}).open();
  	});  	
});

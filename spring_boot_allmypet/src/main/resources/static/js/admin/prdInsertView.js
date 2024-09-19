$(function(){
  var prdNo_check = false;
  var imgForm = new FormData();

  $('#no_check_btn').on('click',function(){
    event.preventDefault();
    var prdNo = $('#prdNo').val();
    if(prdNo == ""){
      alert("상품 번호를 입력 하세요.");
    }else if(isNaN(prdNo)){
      alert("숫자를 입력해 주세요");
    }else{
      $.ajax({
        type:"post",
        url:"/admin/prdNoCheck", 
        data : {"prdNo": prdNo}, 
        dataType:'text', 
        success:function(result) {
          if(result == "success") {
            alert("사용 가능한 상품번호 입니다");
            prdNo_check = true;
          } else {
            alert("사용할 수 없는 상품번호 입니다.");
          }
        },
        error:function() {
          alert("실패");
        }
      });
    };
  });

  $('#prd_img_btn').on('click',function(){
    $('#imageInput').click();
  });

  $('#prd_info_btn').on('click',function(){
    $('#infoInput').click();
  });

  $('#imageInput').change(function() {
    var file = this.files[0]; // 사용자가 선택한 파일
    if (file) {
      var reader = new FileReader();
      reader.onload = function(e) {
        $('#prd_img_area').html('<img id="prd_img" src="' + e.target.result + '" alt="Image Preview" >');
      }
      reader.readAsDataURL(file); 
      imgForm.append('prdImg', file); // 이미지 파일 추가
    }
  });

  $('#infoInput').change(function() {
    var file = this.files[0]; // 사용자가 선택한 파일
    if (file) {
      var reader = new FileReader();
      reader.onload = function(e) {
        $('#prd_info_area').html('<input id="prd_info" type="text" value="'+file.name+'" readonly>');
      }
      reader.readAsDataURL(file);
      imgForm.append('infoImg', file); // info 파일 추가
    }
  });

  $('#submit_btn').on('click',function(){
    event.preventDefault();
    
    // 상품 번호 체크
    if (!prdNo_check) {
      alert("상품번호를 확인해 주세요");
      return;
    }
    
    // 동물 분류 체크
    if (!$('input[name="petCtgNo"]:checked').val()) {
      alert("동물 분류를 해주세요");
      return;
    }

    // 상세 분류 체크
    if (!$('input[name="prdCtgNo"]:checked').val()) {
      alert("상세 분류를 해주세요");
      return;
    }

    // 상품명 체크
    if (!$('#prdName').val()) {
      alert("상품명을 입력해 주세요");
      return;
    }

    // 가격 체크
    if (!$('#prdPrice').val()) {
      alert("가격을 입력해 주세요");
      return;
    }

    // 제조사 체크
    if (!$('#prdCompany').val()) {
      alert("제조사를 입력해 주세요");
      return;
    }

    // 재고 체크
    if (!$('#prdStock').val()) {
      alert("재고를 입력해 주세요");
      return;
    }

    // 이미지 파일 체크
    if (!imgForm.has('prdImg')) {
      alert("상품 이미지를 추가해 주세요");
      return;
    }

    // 정보 파일 체크
    if (!imgForm.has('infoImg')) {
      alert("상품 정보를 추가해 주세요");
      return;
    }
    $.ajax({
    url: '/admin/prdImg_insert', // 서버의 이미지 처리 경로 추후 변경
    type: 'POST',
    data: imgForm,
    contentType: false,
    processData: false,
    success: function(result) {
        $('<input>').attr({
          type: 'hidden',
          name: 'prdImg',
          value: result.prdImg
        }).appendTo('#prd_insert_form');
        
        $('<input>').attr({
          type: 'hidden',
          name: 'infoImg',
          value: result.infoImg
        }).appendTo('#prd_insert_form');
        
        $('#prd_insert_form').off('submit').submit();
    },
    error: function(jqXHR, textStatus, errorThrown) {
        console.error('File upload failed', textStatus, errorThrown);
    }
    });
	

  });
});

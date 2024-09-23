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
        url:"/admin/prdInfoLoad", 
        data : {"prdNo": prdNo}, 
        dataType:'json', 
        success:function(prdInfo) {
           if (prdInfo==null) {
            alert("없는 상품번호 입니다.");  // prdInfo가 null일 경우 경고창
	        } else {
	            $("input[name='petCtgNo'][value='" + prdInfo.petCtgNo + "']").prop("checked", true);
	            $("input[name='prdCtgNo'][value='" + prdInfo.prdCtgNo + "']").prop("checked", true);
	            $("#prdName").val(prdInfo.prdName);
	            $("#prdPrice").val(prdInfo.prdPrice);
	            $("#prdCompany").val(prdInfo.prdCompany);
	            $("#prdStock").val(prdInfo.prdStock);
	            
	            // 이미지 표시 및 hidden 필드에 저장
	            $('#prd_img_area').html('<img id="prd_img" src="/prd_images/' + prdInfo.prdImg + '" alt="Image Preview" >');
	            $('#prdImgHidden').val(prdInfo.prdImg);  // 기존 이미지 경로
	
	            // 상세 이미지 경로
	            $('#prd_info').val(prdInfo.prdDescript);
	            $('#prdDescriptHidden').val(prdInfo.prdDescript);  // 기존 상세 이미지 경로
	        }
        },
        error:function() {
          alert("없는 상품번호 입니다.");
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
	$('#delete_btn').on('click', function() {
    var prdNo = $('#prdNo').val();
    console.log(prdNo);
    if (confirm('정말로 삭제 하시겠습니까?')) {
        $.ajax({
            type: "post",
            url: "/admin/prdDelete",
            data: {"prdNo": prdNo},
            dataType: "text",
            success: function(response) {
                if (response === "success") {
                    alert("삭제가 완료되었습니다.");
                    window.location.href = "/admin/product_modify_view";  
                }
            },
            error: function() {
                alert("삭제에 실패하였습니다.");
            }
        });
    }
});

  $('#submit_btn').on('click',function(){
    event.preventDefault();
    
 
    
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
    
	$('#prd_insert_form').off('submit').submit();
  });
	
});

$(document).ready(function() {
    var all_check = document.querySelector(".select_all");
    var select_check = document.querySelectorAll(".select");
    var del = document.querySelector("button[name='del']");
    
    // 전체 선택 체크박스 클릭 시
    all_check.onclick = () => {
        for (var i = 0; i < select_check.length; i++) {
            select_check[i].checked = all_check.checked;
        }
    };
    
    // 삭제 버튼 클릭 시
    del.onclick = () => {
        var selectedItems = [];
        for (var i = 0; i < select_check.length; i++) {
            if (select_check[i].checked) {
                // 체크된 항목의 cartNo 값을 수집
                selectedItems.push(select_check[i].dataset.cartno);
            }
        }
        
        if (selectedItems.length > 0) {
            // AJAX를 이용해 서버로 삭제 요청
            $.ajax({
                type: "POST",
                url: "/market/cart/delete",
                data: JSON.stringify(selectedItems),
                contentType: "application/json",
                success: function(response) {
                    if (response === "success") {
                        // 삭제 성공 시 페이지를 새로고침
                        location.reload();
                    }
                },
                error: function(error) {
                    console.error("Error deleting items:", error);
                }
            });
        } else {
            alert("삭제할 상품을 선택해주세요.");
        }
    };
    

});
function continueShopping() {
    // 쇼핑 계속하기 버튼 클릭 시 마켓홈으로 이동
    location.href = '/market/home';
}

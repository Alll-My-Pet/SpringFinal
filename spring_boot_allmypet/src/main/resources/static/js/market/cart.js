$(document).ready(function() {
    var all_check = document.querySelector(".select_all");
    var select_check = document.querySelectorAll(".select");
    var del = document.querySelector("button[name='del']");

    // 전체 선택 체크박스 클릭 시
    all_check.onclick = () => {
        for (var i = 0; i < select_check.length; i++) {
            select_check[i].checked = all_check.checked;
        }
        updateTotal(); // 총합 업데이트
    };

    // 개별 체크박스 변경 시 총합 업데이트
    select_check.forEach(function(check) {
        check.addEventListener('change', function() {
            updateTotal(); // 총합 업데이트
        });
    });

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

    // 주문하기 버튼 클릭 시 장바구니 체크
    $('.cart__bigorderbtn.right').click(function(event) {
        var hasItems = false;
        for (var i = 0; i < select_check.length; i++) {
            if (select_check[i].checked) {
                hasItems = true;
                break;
            }
        }
        if (!hasItems) {
            event.preventDefault();  // 폼 제출 막기
            alert("장바구니에 담긴 상품이 없습니다.");
        }
    });

    // 체크된 항목의 총합을 계산하는 함수
    function updateTotal() {
	    let total = 0;
	    select_check.forEach(function(check) {
	        if (check.checked) {
	            let cartRow = $(check).closest("tr");
	            // 가격에서 숫자만 추출하고 정수로 변환
	            let itemTotal = parseInt(cartRow.find(".price").text().replace(/[^0-9]/g, ''));
	            total += itemTotal;
	        }
	    });
	    // 화면에 중복 없이 업데이트
	    $(".order_Pirce.total").text(total.toLocaleString() + "원"); // 총합 업데이트
	    $(".order_Pirce.points").text("+" + (total * 0.02).toLocaleString() + "p"); // 포인트 업데이트
	}

    // 페이지 로드 시 기본 총합 계산
    updateTotal();
});

function continueShopping() {
    // 쇼핑 계속하기 버튼 클릭 시 마켓홈으로 이동
    location.href = '/market/home';
}

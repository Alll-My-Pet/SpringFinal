// 즉시 구매 함수
function submitInstantOrder() {
    const form = document.createElement('form');
    form.method = 'POST';
    form.action = '/market/product/instantOrder';  // 즉시 구매용 경로
    
    const prdNoInput = document.createElement('input');
    prdNoInput.type = 'hidden';
    prdNoInput.name = 'prdNo';
    prdNoInput.value = document.querySelector('[name="prdNo"]').value;  // prdNo 값 가져오기
    
    const qtyInput = document.createElement('input');
    qtyInput.type = 'hidden';
    qtyInput.name = 'cartQty';
    qtyInput.value = document.querySelector('.quantity-input').value;  // 수량 가져오기
    
    form.appendChild(prdNoInput);
    form.appendChild(qtyInput);
    
    document.body.appendChild(form);
    form.submit();
}

// 경고를 띄우고 로그인 페이지로 리다이렉트하는 함수
    function redirectToLogin() {
        alert("로그인이 필요합니다."); // 경고 메시지 표시
        window.location.href = "/login"; // 로그인 페이지로 이동
    }

$(document).ready(function() {
    let decreaseBtn = document.querySelector('.quantity-btn.decrease');  // let으로 변경
    let increaseBtn = document.querySelector('.quantity-btn.increase');  // let으로 변경
    let quantityInput = document.querySelector('.quantity-input');       // let으로 변경
    let insertCartBtn = document.querySelector('#insertCart');           // let으로 변경
    let insertOrderBtn = document.querySelector('#insertOrder');         // let으로 변경
	
	
    // 수량 감소
    decreaseBtn.addEventListener('click', function (event) {
        event.preventDefault();
        let currentQty = parseInt(quantityInput.value);
        if (currentQty > 1) {
            quantityInput.value = currentQty - 1;
        }
    });

    // 수량 증가
    increaseBtn.addEventListener('click', function (event) {
        event.preventDefault();
        let currentQty = parseInt(quantityInput.value);
        quantityInput.value = currentQty + 1;
    });

    // 장바구니 담기
    insertCartBtn.addEventListener('click', function(event) {
        event.preventDefault();
        if (!memId || memId === "null" || memId === "") {  // 로그인하지 않은 경우
            redirectToLogin();
        } else {
            const form = event.target.closest('form');
            form.action = '/market/product/insertCart';  // 장바구니에 담기
            form.submit();
        }
    });

    // 즉시 구매하기
    insertOrderBtn.addEventListener('click', function(event) {
        event.preventDefault();
        if (!memId || memId === "null" || memId === "") {  // 로그인하지 않은 경우
            redirectToLogin();
        } else {
            submitInstantOrder();  // 즉시 구매 함수 호출
        }
    });
});
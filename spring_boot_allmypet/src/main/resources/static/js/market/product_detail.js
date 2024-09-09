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


$(document).ready(function() {
    const decreaseBtn = document.querySelector('.quantity-btn.decrease');
    const increaseBtn = document.querySelector('.quantity-btn.increase');
    const quantityInput = document.querySelector('.quantity-input');
    const insertCartBtn = document.querySelector('#insertCart');
    const insertOrderBtn = document.querySelector('#insertOrder');

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
    insertCartBtn.addEventListener('click', function (event) {
        event.preventDefault();
        const form = event.target.closest('form');
        form.action = '/market/product/insertCart';  // 장바구니에 담기
        form.submit();
    });

    // 즉시 구매하기
    insertOrderBtn.addEventListener('click', function (event) {
        event.preventDefault();
        submitInstantOrder();  // 즉시 구매 함수 호출
    });
});
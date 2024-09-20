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
        const form = event.target.closest('form');
        form.action = '/market/order';  // 즉시 구매
        form.submit();
    });
});
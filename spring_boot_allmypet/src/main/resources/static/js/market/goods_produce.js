document.addEventListener('DOMContentLoaded', function () {
    const imageUpload = document.getElementById('imageUpload');
    const imagePreview = document.getElementById('imagePreview');
    const productType = document.getElementById('productType');
    const productPreviewText = document.getElementById('productPreviewText');
    const createButton = document.getElementById('createButton');

    // 이미지 업로드 시 미리보기 표시
    imageUpload.addEventListener('change', function () {
        const file = this.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                imagePreview.src = e.target.result;
                productPreviewText.style.display = 'block';
            }
            reader.readAsDataURL(file);
        } else {
            imagePreview.src = "";
            productPreviewText.style.display = 'none';
        }
    });

    // 굿즈 타입 선택 시 미리보기 텍스트 변경
    productType.addEventListener('change', function () {
        const selectedType = this.value;
        switch (selectedType) {
            case 'keyring':
                productPreviewText.textContent = '키링 미리보기';
                break;
            case 'album':
                productPreviewText.textContent = '앨범 미리보기';
                break;
            case 'frame':
                productPreviewText.textContent = '액자 미리보기';
                break;
            default:
                productPreviewText.textContent = '굿즈 미리보기';
        }
    });

    // 굿즈 만들기 버튼 클릭 시
    createButton.addEventListener('click', function () {
        if (imagePreview.src && productType.value) {
            alert(`선택된 이미지로 ${productType.options[productType.selectedIndex].text}를(을) 제작합니다!`);
        } else {
            alert('이미지를 업로드하고 굿즈 종류를 선택해주세요.');
        }
    });
});
// 서버에서 전달된 값 (서버 사이드에서 ${ptotal}과 ${total}을 변수로 제공해야 합니다)
//const ptotal = 0;  // 초기값, 서버 사이드에서 설정됨
//const total = 0;   // 초기값, 서버 사이드에서 설정됨
//let discountValue = 0;   // 할인 금액 초기화

// 포인트 입력 시 총 결제 금액 업데이트
function updateDiscount() {
    const points = document.getElementById('points').value;  // 입력된 포인트 값

    // 포인트가 유효한 범위인지 확인
    if (points >= 1 && points <= ptotal) {
        discountValue = points;  // 유효하면 포인트로 할인 금액 설정
        document.querySelector('.order_Price button').disabled = true;  // 쿠폰 적용 버튼 비활성화
    } else {
        discountValue = 0;  // 유효하지 않으면 할인 금액 0으로 설정
        document.querySelector('.order_Price button').disabled = false;  // 쿠폰 적용 버튼 활성화
    }

    // 할인 금액을 HTML에 업데이트
    document.getElementById('discountAmount').innerText = "-" + discountValue + "원";

    // 총 결제 금액 업데이트 (total에서 discountValue를 뺌)
    const finalAmount = total - discountValue;

    // 최종 금액을 HTML에 업데이트
    document.getElementById('finalAmount').innerText = finalAmount.toLocaleString() + "원";
    document.getElementById('ordPrice').value = finalAmount;  // hidden input 값도 업데이트
}

// 포인트 입력칸을 클릭할 때 최대 사용 가능한 포인트 메시지를 표시
function showMaxPoints() {
    const messageDiv = document.getElementById('maxPointsMessage');
    messageDiv.innerText = `최대 ${ptotal}포인트`;  // 메시지 표시
    messageDiv.style.display = 'block';  // 메시지 표시
}

// 쿠폰 팝업 열기
function openCouponPopup() {
    window.open('/market/couponUI', 'couponPopup', 'width=600,height=600');
}

// 쿠폰 선택 시 호출되는 함수
function applyCoupon(discountRate, couponId) {
    // 할인 비율을 계산하고 쿠폰 ID를 hidden 필드에 저장
    let discountAmount = total * (discountRate / 100);  // 할인 금액 계산
    discountValue = discountAmount;  // 할인 금액 업데이트

    // 쿠폰 할인 적용 UI 업데이트
    document.getElementById('couponDiscount').innerText = discountRate + "% 할인 적용";
    document.getElementById('discountAmount').innerText = "- " + discountAmount.toLocaleString() + "원";

    // 총 결제 금액 업데이트
    const finalAmount = total - discountValue;
    document.getElementById('finalAmount').innerText = finalAmount.toLocaleString() + "원";
    document.getElementById('ordPrice').value = finalAmount;  // hidden input 값도 업데이트

    // 선택한 쿠폰 ID를 hidden 필드에 저장
    document.getElementById('selectedCouponId').value = couponId;

    // 포인트 입력 비활성화
    document.getElementById('points').disabled = true;

    // 디버깅 로그
    console.log(`Coupon applied with discount rate: ${discountRate}%, coupon ID: ${couponId}`);
}

// Daum 주소 API 호출
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            let roadAddr = data.roadAddress; // 도로명 주소
            let extraRoadAddr = ''; // 참고 항목

            // 법정동명 추가
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                extraRoadAddr += data.bname;
            }

            if (data.buildingName !== '' && data.apartment === 'Y') {
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }

            if (extraRoadAddr !== '') {
                extraRoadAddr = ` (${extraRoadAddr})`;
            }

            document.getElementById('sample4_postcode').value = data.zonecode; // 우편번호
            document.getElementById("sample4_roadAddress").value = roadAddr; // 도로명 주소
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress; // 지번 주소

            if (roadAddr !== '') {
                document.getElementById("sample4_extraAddress").value = extraRoadAddr; // 참고 항목
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            let guideTextBox = document.getElementById("guide");
            if (data.autoRoadAddress) {
                let expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = `(예상 도로명 주소: ${expRoadAddr})`;
                guideTextBox.style.display = 'block';
            } else if (data.autoJibunAddress) {
                let expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = `(예상 지번 주소: ${expJibunAddr})`;
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

// 폼 제출 시 호출되는 함수
function combine() {
    const phone1 = document.getElementById('phone1').value;
    const phone2 = document.getElementById('phone2').value;
    const phone3 = document.getElementById('phone3').value;
    
    const address1 = document.getElementById("sample4_roadAddress").value;
    const address2 = document.getElementById("sample4_detailAddress").value;
    const address3 = document.getElementById("sample4_extraAddress").value;

    // 세 개의 전화번호 입력값을 하나로 결합
    const fullPhoneNumber = phone1 + '-' + phone2 + '-' + phone3;
    const fullAddress = address1 + " " + address2 + " " + address3;

    // hidden input 필드에 결합된 전화번호 및 주소 설정
    document.getElementById('ordHP').value = fullPhoneNumber;
    document.getElementById('ordAddress').value = fullAddress;

    // 유효성 검사
    const ordReceiver = document.querySelector('input[name="ordReceiver"]').value.trim();
    const ordPrice = document.getElementById('ordPrice').value.trim();
    const ordPay = document.querySelectorAll('input[name="ordPay"]:checked').length > 0;

    let errorMessage = '';
    if (ordReceiver === '') {
        errorMessage += '받는사람을 입력해주세요.\n';
    }
    if (fullPhoneNumber.trim() === '') {
        errorMessage += '전화번호를 입력해주세요.\n';
    }
    if (fullAddress.trim() === '') {
        errorMessage += '주소를 입력해주세요.\n';
    }
    if (ordPrice === '') {
        errorMessage += '결제금액을 입력해주세요.\n';
    }
    if (!ordPay) {
        errorMessage += '결제수단을 선택해주세요.\n';
    }

    // 유효성 검사가 실패하면 오류 메시지 출력
    if (errorMessage) {
        alert(errorMessage);
        return false; // 폼 제출 방지
    }

    // 유효성 검사가 통과하면 폼 제출
    return true;
}

// 엔터키가 눌렸을 때 폼이 제출되지 않도록 하는 함수
function preventEnter(event) {
    if (event.key === 'Enter') {
        event.preventDefault(); // 기본 동작(폼 제출) 막기
    }
}

// 페이지 로드 후 실행
$(document).ready(function() {

    // 폼 입력 필드에서 엔터키 방지
    $('#orderForm').on('keydown', preventEnter);

    // 페이지 로드 시 최대 포인트 메시지 표시
    showMaxPoints();

    // 폼 제출 버튼 클릭 시 호출되는 함수
    $('#orderCompleteButton').on('click', function(event) {
        event.preventDefault(); // 기본 폼 제출 방지


        // 폼을 직접 제출할 경우를 대비하여 유효성 검사
        const pointsValue = document.getElementById('points').value;
        const couponId = document.getElementById('selectedCouponId').value;

        // 포인트와 쿠폰 모두 사용하지 않는 경우에도 제출
        if (pointsValue === "" && couponId === "") {
            document.getElementById('orderForm').submit(); // 폼 제출
        } else {
            // 포인트 또는 쿠폰 사용 시 서버에 필요한 추가 작업
            // 예를 들어, AJAX를 통해 서버에 데이터를 전송할 수 있습니다.

            // 여기서 AJAX 호출 예시
            $.ajax({
                url: '/market/orderComplete', // 서버의 주문 처리 URL
                type: 'POST',
                data: $('#orderForm').serialize(), // 폼 데이터 직렬화
                success: function(response) {
                    // 주문 완료 후의 처리 (예: 성공 메시지 표시)
                    alert('주문이 완료되었습니다.');
                },
                error: function(error) {
                    // 에러 처리
                    alert('주문 처리 중 오류가 발생했습니다.');
                }
            });
        }
    });
});

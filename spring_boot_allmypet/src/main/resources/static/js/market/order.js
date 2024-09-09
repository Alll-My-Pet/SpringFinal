$(document).ready(function() {
	var memEmail = "<%= memVo.getMemEmail() != null ? memVo.getMemEmail() : "" %>";

    // 이메일 값이 존재하면 @ 기준으로 분리하여 각 input에 값 입력
    if (memEmail) {
        var emailParts = memEmail.split("@");
        if (emailParts.length === 2) {
            document.getElementById('emailUser').value = emailParts[0];
            document.getElementById('emailDomain').value = emailParts[1];
        }
    }

    function combine() {
        var phone1 = document.getElementById("phone1").value;
        var phone2 = document.getElementById("phone2").value;
        var phone3 = document.getElementById("phone3").value;
        var ordHP = phone1 + "-" + phone2 + "-" + phone3;

        var address1 = document.getElementById("sample4_roadAddress").value;
        var address2 = document.getElementById("sample4_detailAddress").value;
        var address3 = document.getElementById("sample4_extraAddress").value;
        var ordAddress = address1 + " " + address2 + " " + address3;

        // 최종 값 확인
        console.log("ordHP:", ordHP);
        console.log("ordAddress:", ordAddress);

        document.getElementById("ordHP").value = ordHP;
        document.getElementById("ordAddress").value = ordAddress;
        return true; // 폼이 정상적으로 제출되도록 true 반환
    }

    // `combine` 함수가 폼 제출 전에 실행되도록 설정
    $("form").on("submit", function(event) {
        return combine(); // combine이 true를 반환해야 폼이 제출됨
    });

    // Daum 주소 API 통합
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }

    // 주소 검색 버튼 클릭 시 Daum API 호출
    $('#addressSearchButton').on('click', function() {
        sample4_execDaumPostcode();
    });
});
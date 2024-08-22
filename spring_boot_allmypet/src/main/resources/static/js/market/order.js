$(document).ready(function() {
    function combine() {
        var phone1 = document.getElementById("phone1").value;
        var phone2 = document.getElementById("phone2").value;
        var phone3 = document.getElementById("phone3").value;
        var ordHP = phone1 + "-" + phone2 + "-" + phone3;

        var address1 = document.getElementById("address1").value;
        var address2 = document.getElementById("address2").value;
        var ordAddress = address1 + " " + address2;

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
});

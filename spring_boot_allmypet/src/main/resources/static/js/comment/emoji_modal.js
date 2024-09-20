function openEmojiModal() {
    $('#emojiModal').show();
}

function closeEmojiModal() {
    $('#emojiModal').hide();
}

$(document).ready(function() {
    // 모달 닫기 버튼 클릭 시 모달 닫기
    $(document).on('click', '#close-emoji-modal', function() {
        closeEmojiModal();
    });

    // 모달 외부 클릭 시 모달 닫기
    $(window).on('click', function(event) {
        if ($(event.target).is('#emojiModal')) {
            closeEmojiModal();
        }
    });

    // 이모지 선택
    window.selectEmoji = function(emojiImg) {
        $('#selectedEmoji').val(emojiImg); // 선택된 이모지의 이미지를 숨겨진 필드에 저장
        $('#selectedEmojiImg').attr('src', '/image/emoji/' + emojiImg).show(); // 선택된 이모지 미리보기
        closeEmojiModal();
    };
});

/**
 * promoteDetail.js
 */
 
function toggleLike(postNo) {
    $.ajax({
        url: '<c:url value="/board/toggleLike"/>',
        type: 'POST',
        data: { postNo: postNo },
        success: function(response) {
            if (response === 'liked') {
                $('#LikeBtn img').attr('src', '<c:url value="/project_images/liked-icon.png"/>');
            } else if (response === 'unliked') {
                $('#LikeBtn img').attr('src', '<c:url value="/project_images/free-icon-thumb-up-5323424.png"/>');
            }
        }
    });
}
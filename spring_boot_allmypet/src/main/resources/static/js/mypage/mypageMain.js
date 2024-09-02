/**
 * 
 */
 $(function(){
 	const inquiryDiv = document.getElementById("breeder_inquiry");
    if (inquiryDiv.classList.contains("general_member")) {
        const parentLink = inquiryDiv.closest("a");
        if (parentLink) {
            parentLink.addEventListener("click", function(event) {
                event.preventDefault(); // 링크 클릭을 막음
            });
        }
    }
 });
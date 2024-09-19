/**
 * paging.js 하단 페이징 관련
 */

$(document).ready(function() {

	function goPage(no) {
		const frm = document.pageFrm;

		if (no == "prev") {
			no = frm.pageNo.value - 1;
			if (no <= 0)
				no = 1;
		} else if (no == "next") {
			no = parseInt(frm.pageNo.value) + 1;
		}

		frm.action = "/board/listAllBoard";
		frm.pageNo.value = no;
		frm.submit();
	}
});
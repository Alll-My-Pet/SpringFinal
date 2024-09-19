
$(document).ready(function() {

	function filterList() {
		// 모든 리스트 항목을 숨김
		$('.product-item').hide();

		// 필터링 조건을 가져옴
		var types = [];
		$('input[name="snack"]:checked').each(function() {
			types.push("snack");
		});
		$('input[name="toy"]:checked').each(function() {
			types.push("toy");
		});
		$('input[name="bath"]:checked').each(function() {
			types.push("bath");
		});
		$('input[name="farm"]:checked').each(function() {
			types.push("farm");
		});
		
		var pets = [];
		$('input[name="s_dog"]:checked').each(function() {
			pets.push(1);
		});
		$('input[name="b_dog"]:checked').each(function() {
			pets.push(2);
		});
		$('input[name="cat"]:checked').each(function() {
			pets.push(3);
		});
		$('input[name="bird"]:checked').each(function() {
			pets.push(4);
		});
		$('input[name="reptile"]:checked').each(function() {
			pets.push(5);
		});
		$('input[name="etc"]:checked').each(function() {
			pets.push(6);
		});

		
		// 필터링 조건에 맞는 항목을 표시
		$('.list').each(function() {
			var show = true;
			var type = $(this).data('type');
			var pet = $(this).data('pet');

			if (types.length > 0 && !types.includes(type)) {
				show = false;
			}
			
			if (pets.length > 0 && pets.includes(pet)) {
				show = false;
			}

			if (prices.length > 0) {
				var priceCategory;
				if (price <= 100000) {
					priceCategory = 0;
				} else if (price <= 200000) {
					priceCategory = 1;
				} else if (price <= 300000) {
					priceCategory = 2;
				} else if (price <= 400000) {
					priceCategory = 3;
				} else if (price <= 500000) {
					priceCategory = 4;
				} else {
					priceCategory = 5;
				}

				if (!prices.includes(priceCategory)) {
					show = false;
				}
			}

			if (show) {
				$(this).show();
			}
		});
	}

	// 필터링 조건이 변경될 때마다 filterList 함수 호출
	$('input[type="checkbox"]').on('change', filterList);

	// 초기 필터링 적용
	filterList();






	function sortList(criteria, ascending) {
		var listContainer = $('.list-container');
		var lists = $('.list').get();

		lists.sort(function(a, b) {
			var valA = $(a).data(criteria);
			var valB = $(b).data(criteria);

			if (ascending) {
				return (valA > valB) ? 1 : (valA < valB) ? -1 : 0;
			} else {
				return (valA < valB) ? 1 : (valA > valB) ? -1 : 0;
			}
		});

		$.each(lists, function(index, list) {
			listContainer.append(list);
		});
	}

	$('#sort-button').click(function() {
		var buttonOffset = $(this).offset();
		var buttonHeight = $(this).outerHeight();
		$('#sort-menu').css({
			top: buttonOffset.top + buttonHeight,
			left: buttonOffset.left,
			display: 'block'
		});
	});


	$('#sort-name').click(function() {
		sortList('name', true);
		$('#sort-menu').hide();
	});

	$('#sort-rating').click(function() {
		sortList('mark', true);
		$('#sort-menu').hide();
	});

	$('#sort-price').click(function() {
		sortList('price', true); // 가격순 오름차순 정렬
		$('#sort-menu').hide();
	});

	// 메뉴 외부 클릭 시 메뉴 숨기기
	$(document).click(function(event) {
		if (!$(event.target).closest('#sort-button, #sort-menu').length) {
			$('#sort-menu').hide();
		}
	});
});


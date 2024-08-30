$(function() {
	// 여러 개의 경찰서 위치 표시 
 	// 마커와 정보창 배열
 	let markerArr = new Array();
 	let infoWindowArr = new Array();



    $.ajax({
        type: "get",
        url: "/petmap",
        success: function(petList) {
            for (let i = 0; i < petList.length; i++) {
                // 마커 표시
                var marker = new naver.maps.Marker({
                    map: map,
                    title: petList[i].facilityName,
                    position: new naver.maps.LatLng(petList[i].latitude, petList[i].longitude)
                });

                // 정보창
                var infowindow = new naver.maps.InfoWindow({
                    content: '<div><b>' + petList[i].facilityName + '</b></div>'
                });

                // 배열에 저장
                markerArr.push(marker);
                infoWindowArr.push(infowindow);
            }

            // 각 마커 클릭 시 정보창 출력
            markerArr.forEach(function(marker, index) {
                naver.maps.Event.addListener(marker, "click", function(e) {
                    if (infoWindowArr[index].getMap()) {
                        infoWindowArr[index].close();
                    } else {
                        infoWindowArr[index].open(map, marker);
                    }
                });
            });
        },
        error: function() {
            alert("전송 실패");
        },
        
        success: function(petList) {
    console.log(petList);  // 여기서 반환된 데이터를 확인
    // 이후 처리
}
    });
});
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
	<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=p8d8z1bubk&submodules=geocoder"></script>
	<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
</head>
<body>
    <div>
        <!-- 카테고리 선택 드롭다운 -->
        <label for="categorySelect">카테고리 선택:</label>
        <select id="categorySelect">
            <option value="">모든 카테고리</option>
            <option value="동물병원">동물병원</option>
            <option value="동물약국">동물약국</option>
            <option value="문예회관">동반가능문예회관</option>
            <option value="미술관">동반가능미술관</option>
            <option value="미용">미용</option>
            <option value="박물관">박물관</option>
            <option value="반려동물용품">반려동물용품</option>
            <option value="식당">동반가능식당</option>
            <option value="여행지">동반가능여행지</option>
            <option value="위탁관리">반려동물위탁</option>
            <option value="카페">동반가능카페</option>
            <option value="펜션">동반가능펜션</option>
        </select>
    </div>

    <div id="map" style="width:1000px;height:500px;"></div>
</body>

<script type="text/javascript">
    var map = new naver.maps.Map('map', {
        center: new naver.maps.LatLng(37.5666805, 126.9784147),
        zoom: 18,
        mapTypeId: naver.maps.MapTypeId.NORMAL
    });

    var infowindow = new naver.maps.InfoWindow();

    $(window).on("load", function() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
        } else {
            var center = map.getCenter();
            infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
            infowindow.open(map, center);
        }

        loadPetMarkers();
    });

    function onSuccessGeolocation(position) {
        var location = new naver.maps.LatLng(position.coords.latitude,
                                             position.coords.longitude);

        map.setCenter(location); 
        map.setZoom(18); 

        infowindow.setContent('<div style="padding:20px;">' + '현재 내 위치' + '</div>');

        infowindow.open(map, location);
        console.log('Coordinates: ' + location.toString());
    }

    function onErrorGeolocation() {
        var center = map.getCenter();

        infowindow.setContent('<div style="padding:20px;">' +
            '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');

        infowindow.open(map, center);
    }

    let markerArr = [];
    let infoWindowArr = [];

    function loadPetMarkers() {
        var bounds = map.getBounds();
        var sw = bounds.getSW(); 
        var ne = bounds.getNE(); 

        var selectedCategory = $('#categorySelect').val();  // 선택된 카테고리

        console.log('SW Lat: ' + sw.lat(), 'SW Lng: ' + sw.lng());
        console.log('NE Lat: ' + ne.lat(), 'NE Lng: ' + ne.lng());
        console.log('Selected Category: ' + selectedCategory);

        $.ajax({
            type: "post",
            url: "/petmap",
            data: {
                swLat: sw.lat(),  
                swLng: sw.lng(),  
                neLat: ne.lat(),  
                neLng: ne.lng(),
                category: selectedCategory  // 선택된 카테고리를 서버로 전송
            },
            success: function(petList) {
                console.log(petList);

                markerArr.forEach(marker => marker.setMap(null));
                markerArr = [];

                for (let i = 0; i < petList.length; i++) {
                    var marker = new naver.maps.Marker({
                        map: map,
                        title: petList[i].facilityName,
                        position: new naver.maps.LatLng(petList[i].latitude, petList[i].longitude)
                    });

                    var infowindow = new naver.maps.InfoWindow({
                        content: '<div><b>' + petList[i].facilityName + '</b></div>'
                    });

                    markerArr.push(marker);
                    infoWindowArr.push(infowindow);
                }

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
            }
        });
    }

    // 지도 이동 또는 확대/축소 후 마커 재로드
    naver.maps.Event.addListener(map, 'idle', function() {
        loadPetMarkers();
    });

    // 카테고리 선택 변경 시 마커 재로드
    $('#categorySelect').on('change', function() {
        loadPetMarkers();
    });
</script>
</html>

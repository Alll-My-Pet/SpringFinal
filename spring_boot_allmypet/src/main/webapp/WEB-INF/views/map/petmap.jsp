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
    <div id="map" style="width:1000px;height:500px;"></div>
</body>

<script type="text/javascript">
    // 여기에 수정된 스크립트를 넣습니다.
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

        // 지도가 로드된 후, 범위 내 데이터를 가져옴
        loadPetMarkers();
    });

    function onSuccessGeolocation(position) {
        var location = new naver.maps.LatLng(position.coords.latitude,
                                             position.coords.longitude);

        map.setCenter(location); 
        map.setZoom(18); 

        infowindow.setContent('<div style="padding:20px;">' + 'geolocation.getCurrentPosition() 위치' + '</div>');

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

        console.log('SW Lat: ' + sw.lat(), 'SW Lng: ' + sw.lng());
        console.log('NE Lat: ' + ne.lat(), 'NE Lng: ' + ne.lng());

        $.ajax({
            type: "post",
            url: "/petmap",
            data: {
                swLat: sw.lat(),  
                swLng: sw.lng(),  
                neLat: ne.lat(),  
                neLng: ne.lng()   
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

    naver.maps.Event.addListener(map, 'idle', function() {
        loadPetMarkers();
    });
</script>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
    <title>오픈 API Map Test - 마커, InfoWindow 테스트</title>
    <!-- prevent IE6 flickering -->
    <script type="text/javascript">
        try {
            document.execCommand('BackgroundImageCache', false, true);
        } catch (e) {
        }
    </script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=D0h5OSVIck0uZuiAAaAy"></script>
<body>
	<div id="map" style="width: 800px; height: 600px;"></div>
	<script	type="text/javascript">

	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(37.5666805, 126.9784147),
	    zoom: 5,
	    mapTypeId: naver.maps.MapTypeId.NORMAL
	});

	var infowindow = new naver.maps.InfoWindow();

	function onSuccessGeolocation(position) {
	    var location = new naver.maps.LatLng(position.coords.latitude,
	                                         position.coords.longitude);

	    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
	    map.setZoom(10); // 지도의 줌 레벨을 변경합니다.

	    infowindow.setContent('<div style="padding:20px;">' +
	        'latitude: '+ location.lat() +'<br />' +
	        'longitude: '+ location.lng() +'</div>');

	    infowindow.open(map, location);
	}

	function onErrorGeolocation() {
	    var center = map.getCenter();

	    infowindow.setContent('<div style="padding:20px;">' +
	        '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');

	    infowindow.open(map, center);
	}

	$(window).on("load", function() {
	    if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
	    } else {
	        var center = map.getCenter();

	        infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');
	        infowindow.open(map, center);
	    }
	});
	</script>
	<input type="text" id="x" name="x" disabled="disabled"/> 
	<input type="text" id="y" name="y" disabled="disabled"/>
</body>
</html>
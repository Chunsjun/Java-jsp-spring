<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/etc/scripts.jsp"%>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=w_PbmPMvvatEUYzaCwJb&submodules=geocoder"></script>
<title>::: ChanBoard :::</title>
</head>
<body>

	<div class="container" align="center">
		<%@include file="/WEB-INF/views/etc/top.jsp"%>
		<div id="map" style="width: 330px; height: 300px;"></div>
	</div>
	
	<script type="text/javascript">
		/* -- 맵 생성 -- */
		var map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(36.992176, 127.089013),
			zoom : 13,
			zoomControl : true,
			minZoom : 1,
			mapTypeId : naver.maps.MapTypeId.NORMAL
		});

		var marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(36.992176, 127.089013),
			map : map
		});

		var contentString = [ 'TEST' ].join('');

		var infowindow = new naver.maps.InfoWindow({
			content : contentString
		});

		naver.maps.Event.addListener(marker, "click", function(e) {
			if (infowindow.getMap()) {
				infowindow.close();
			} else {
				infowindow.open(map, marker);
			}
		});

		infowindow.open(map, marker);
	</script>
</body>
</html>

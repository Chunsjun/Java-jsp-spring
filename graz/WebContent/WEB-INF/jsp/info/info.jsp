<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=w_PbmPMvvatEUYzaCwJb"></script>
<title>Info</title>
</head>
<body>
<div class="container">
	<table>
		<tr>
			<td>
				<%@include file="/WEB-INF/jsp/main/top.jsp"%>
			</td>
		</tr>
		<tr>
			<td align="center">
				<div id="map" style="width: 330px; height: 300px;"></div> 
				<script type="text/javascript">
					/* -- 맵 생성 -- */
				var map = new naver.maps.Map('map',
			            {
			               center : new naver.maps.LatLng(36.992176, 127.089013),
			               zoom : 14,
			               zoomControl : true,
			               minZoom : 1,
			               mapTypeId : naver.maps.MapTypeId.NORMAL
			            });
					
				var marker = new naver.maps.Marker({
				    position: new naver.maps.LatLng(36.992176, 127.089013),
				    map: map
				});
				
				var contentString = ['<h2>Coffee Graz</h2>',
				                     '<h5>2층 ~ 3층</h5>'
				                     ].join('');

				             var infowindow = new naver.maps.InfoWindow({
				                 content: contentString
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
			</td>
		</tr>
		<tr>
			<td align="center">
				<table>
					<tr>
						<td style="padding: 10px; font-weight: bold;">
							상호명
						</td>
						<td>
							그라츠 (Coffee Graz)
						</td>
					</tr>
					<tr>
						<td style="padding: 10px; font-weight: bold;">
							연락처
						</td>
						<td>
							031-655-4892
						</td>
					</tr>
					<tr>
						<td style="padding: 10px; font-weight: bold;">
							주소
						</td>
						<td>
							[450-828] 경기도 평택시 평택동 290-3번지 // 2층~3층 그라츠 
						</td>
					</tr>
					<tr>
						<td style="padding: 10px; font-weight: bold;">
							도로명주소
						</td>
						<td>
							[17909] 경기도 평택시 평택2로10번길 25 // 2층~3층 그라츠
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<hr>
	개발문의사항 : <a href="https://open.kakao.com/o/gNFREls">오픈카톡</a><p>
</div>
</body>
</html>
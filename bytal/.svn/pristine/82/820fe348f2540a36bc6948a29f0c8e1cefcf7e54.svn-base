<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>:::Bytal Web:::</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<script src="/bootstrap/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=w_PbmPMvvatEUYzaCwJb"></script>
</head>
<body>
<div class="container">
	<table width="100%" height="100%">
		<tr height="20%">
			<td colspan="3"><%@include file="/WEB-INF/jsp/web/main/top.jsp"%>
			</td>
		</tr>
		<tr>
			<td width="20%" valign="top"><%@include file="left.jsp"%>
			</td>
			<td align="center">
				<div id="map" style="width: 800px; height: 600px;"></div> 
				<script type="text/javascript">
				
					/* -- 맵 생성 -- */
				var map = new naver.maps.Map('map',
			            {
			               center : new naver.maps.LatLng(36.797938, 127.074593),
			               zoom : 11,
			               zoomControl : true,
			               minZoom : 1,
			               mapTypeId : naver.maps.MapTypeId.NORMAL
			            });
					
						var markers = [], infoWindows = [];
						
					/* --마커 반복문-- */
		              <c:forEach var="list" items="${listMap}" varStatus="status">
		                   var x = "${list.xCoordinate}"
			               var y = "${list.yCoordinate}"
			               var marker = new naver.maps.Marker({
				                  position : new naver.maps.LatLng(y,x),
				                  map : map
				               });
			               var contentString = [
			                                    '<div style="height: 100px; width: 150px;">',
			                                    '   <h3>대여소 정보</h3>',
			                                    '		대여소 번호 : ${list.cradleNo}<br>',
			                                    '   	이름 : ${list.cradleName}<br>',
			                                    '   	상태 : <c:if test="${list.cradleStatus eq 'Y'}">',
			                                    '			 <font color="green" style="font-weight: bold;">',
			                                    '				이용가능</font></c:if>',
			                                    '			 <c:if test="${list.cradleStatus eq 'N'}">',
			                                    '			 <font color="red">이용불가</font></c:if>',
			                                    '</div>'
			                                ].join('');
			               
			               var infoWindow = new naver.maps.InfoWindow({
			       	        content: contentString
			       	    	});
			               
			               markers.push(marker);
			       	   	   infoWindows.push(infoWindow);
			       	   	   
			       	   	   naver.maps.Event.addListener(map, 'idle', function(){
			       		   updateMarkers(map, markers);
			       	  	    });
		              </c:forEach>
		              
		              function updateMarkers(map, markers) {

		          	    var mapBounds = map.getBounds();
		          	    var marker, position;

		          	    for (var i = 0; i < markers.length; i++) {

		          	        marker = markers[i]
		          	        position = marker.getPosition();

		          	        if (mapBounds.hasLatLng(position)) {
		          	            showMarker(map, marker);
		          	        } else {
		          	            hideMarker(map, marker);
		          	        }
		          	    }
		          	}

		          	function showMarker(map, marker) {

		          	    if (marker.setMap()) return;
		          	    marker.setMap(map);
		          	}

		          	function hideMarker(map, marker) {

		          	    if (!marker.setMap()) return;
		          	    marker.setMap(null);
		          	}

		          	// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
		          	function getClickHandler(seq) {
		          	    return function(e) {
		          	        var marker = markers[seq],
		          	            infoWindow = infoWindows[seq];

		          	        if (infoWindow.getMap()) {
		          	            infoWindow.close();
		          	        } else {
		          	            infoWindow.open(map, marker);
		          	        }
		          	    }
		          	}

		          	for (var i=0, ii=markers.length; i<ii; i++) {
		          	    naver.maps.Event.addListener(markers[i], 'mouseover', getClickHandler(i));
		          	}
		              
				</script>
			</td>
		</tr>
	</table>
	<hr>개발문의사항 : <a href="https://open.kakao.com/o/gpVISyo">오픈카톡</a><p>
</div>
</body>
</html>
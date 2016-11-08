<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<script type="text/javascript">
function addCheck() {
	var form = document.addForm;
	
	if(form.x.value == "" && form.y.value == "") {  
		alert("지도를 클릭하여 좌표값을 입력해주세요.");
		return;
	}
	if(form.cradleName.value == "") {  
		alert("대여소 이름을 입력해주세요.");
		form.cradleName.focus();
		return;
	}
	form.submit();
}
</script>
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
	<table width="100%" height="100%">
		<tr height="20%">
			<td colspan="3"><%@include file="/WEB-INF/jsp/web/main/top.jsp"%>
			</td>
		</tr>
		<tr>
			<td width="20%"><%@include file="left.jsp"%>
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
		              
		             /* 등록 버튼 function */ 
					function add() {
						document.getElementById('add').submit();
					};
					
					/* 정보등록버튼 및 숨기기버튼 클릭시 좌표값과 마커 */
					var marker = new naver.maps.Marker({
					position : new naver.maps.LatLng(36.797938, 127.074593),
					map : map});
						
					naver.maps.Event.addListener(map, 'click', function(e) {
					marker.setPosition(e.coord);
					document.getElementById("x").value = e.coord.x;
					document.getElementById("y").value = e.coord.y;
					});
				</script>
			</td>
			<td align="center">
				<table id="addForm">
					<tr>
						<td align="center">
							<form id="add" action="/bytal/cradleAdd" method="post" name="addForm">
								<hr>x좌표<br> <input type="text" id="x" name="x" readonly="readonly"/>  
								<br>y좌표<br> <input type="text" id="y" name="y" readonly="readonly"/>
								<hr>이름<br> <input type="text" id="cradleName" name="cradleName" />
								<br>상태<br> 
								<select name="cradleStatus">
									<option value="Y" selected="selected">이용가능</option>
									<option value="N">이용불가</option>
								</select>
								<hr>
								<input type="button" value="등록" onclick="javascript:addCheck()" class="btn btn-primary">
							</form>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::Bytal Web:::</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<script src="/bootstrap/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<table width="100%" height="100%">
		<tr height="20%">
			<td colspan="2">
				<%@include file="/WEB-INF/jsp/web/main/top.jsp"%>
			</td>
		</tr>
		<tr>
			<td width="20%" valign="top">
				<%@include file="/WEB-INF/jsp/web/bicycle/left.jsp"%>
			</td>
			<td align="center">
			<h2>자전거 종류 안내</h2>
				
					<table style="width: 100%;" align=center >
						<tr >
							<td style="width: 40%; border-bottom: solid;">
								<img src="/image/webNormal.jpg">
							</td>
							<td style=" border-bottom: solid;">
								<h1>-일반 자전거-</h1> <br>
								<h3>일반 자전거는 일반 1인용 자전거 입니다.<br>
									 대여 비용: 10분 당 250 원
								</h3>
							</td>
						</tr>
						<tr>
							<td style="width: 40%; border-bottom: solid;">
								<img src="/image/webCouple.png">
							</td>
						
							<td style=" border-bottom: solid;">
								<h1>-커플 자전거-</h1> <br>
								<h3>커플 자전거는 커플을 위한 데이트용 자전거로, <br>
									2인승입니다.<br><br>
									대여 비용: 10분 당 350원
								</h3>
							</td>
						</tr>
						<tr>
							<td style="width: 40%; border-bottom: solid;">
								<img src="/image/webSports.jpg" >
							</td>
							<td style=" border-bottom: solid;">
								<h1>-고급 자전거-</h1> <br>
								<h3>고급 자전거는 경형 자전거로, <br>
									주로 스포츠형으로 많이 나오는 자전거입니다.<br><br>
									대여 비용: 10분 당 450원
								</h3>
							</td>
						</tr>
					</table>
				
			</td>
		</tr>
	</table>
</div>
</body>
</html>
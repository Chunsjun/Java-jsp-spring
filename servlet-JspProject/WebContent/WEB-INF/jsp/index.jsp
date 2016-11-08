<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>선문 미디어</title>
</head>
<body>
	<table border="1" width="100%" height="500">
		<tr height="30%">
			<td colspan="2"><%@ include file="top.jsp"%>
			</td>
		</tr>
		<tr height="70%">
			<td width="20%"><%@ include file="left.jsp"%>
			</td>
			<td width="80%">
				<h1 align="center">
					환영합니다. <br>선문미디어 웹페이지입니다.
				</h1>
				<button type="button" onclick="document.getElementById('demo').innerHTML = Date()">
					현재 날짜및 시각
				</button>
				<p id="demo">
				</p>
			</td>
		</tr>
	</table>
</body>
</html>
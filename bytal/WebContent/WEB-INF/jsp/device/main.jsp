<%@page import="oracle.net.ns.SessionAtts"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<script src="/bootstrap/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<title>:::Bytal device:::</title>
</head>
<body>
<div class=container>
	<table  style="text-align: center; width:100%; height:100%;">
		
		<tr>
			<td>		
				<img src="/image/logo.png" align="middle" width="80%" height="50%"><br> 
				<br><br>
				<h1>자전거 무인 대여 시스템</h1>
				<br><br>
			</td>
		</tr>
		<tr>
			<td>
				<br><br>
				<div>
					
						<input TYPE="button" style="width: 200px; height: 100px; font-size: xx-large;"
						name="Submit" value=" 대 여 " class="btn btn-primary" onclick="location.href='/rent/rent'">
					
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
						<input TYPE="button" style="width: 200px; height: 100px; font-size: xx-large;"
						name="Submit" value=" 반 납 " class="btn btn-success" onclick="location.href='/return/return'">
					
				</div>
				<br><br>		
			</td>
		</tr>
		<tr>
			<td>
			<br><br>
				<h1 align="center">홈 페이지에서 회원 가입 후 이용하실 수 있습니다.</h1>
				<h1 align="center">www.bytal.org.kr(가정)</h1>
				<br><br>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>
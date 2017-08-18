<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::: ChanBoard :::</title>
</head>
<body>
<div align="center" class="container">
<%@include file="/WEB-INF/views/top.jsp"%>
<table>
	<tr>
		<td>
			<h1>Join Us</h1>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="id" class="form-control" placeholder="ID">
		</td>
	</tr>
	<tr>
		<td>
			<input type="password" name="pw" class="form-control" placeholder="PASSWORD">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="name" class="form-control" placeholder="NAME">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="birth" class="form-control" placeholder="BIRTH">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="email" class="form-control" placeholder="EMAIL">
		</td>
	</tr>
</table>
</div>
</body>
</html>
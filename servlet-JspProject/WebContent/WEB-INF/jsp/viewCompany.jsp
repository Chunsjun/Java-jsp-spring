<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
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
			<td width="80%"><c:forEach var="a" items="${company}">
					<h2 align="center">${a.title}</h2>
					<h5 align="center">${a.contents}</h5>
				</c:forEach> <c:if test="${sessionScope.num == 0 }">
					<div align="right">
						<form action="/updateCompany">
							<input type=submit value=회사정보수정>
						</form>
					</div>
				</c:if></td>
		</tr>
	</table>
</body>
</html>
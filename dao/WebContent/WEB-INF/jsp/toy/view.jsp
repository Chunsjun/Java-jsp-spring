<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>::: Spring with MyBatis :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
	<h3>장난감 보기</h3>

	<table style="width: 100%;" border="1">
		<thead>
			<tr>
				<th>장난감번호</th>
				<th>장난감이름</th>
				<th>장난감가격</th>
				<th>가게번호</th>
			</tr>
		</thead>
		<tbody>
				<tr>
					<td style="text-align: center;">
					<c:out value="${toy.toyNo}" />
					</td>
					<td style="text-align: left;">
					<c:out value="${toy.toyName}" />
					</td>
					<td style="text-align: left;">
					<c:out value="${toy.toyPrice}" />
					</td>
					<td style="text-align: center;">
					<c:out value="${toy.shopNo}" />
					</td>
				</tr>
		</tbody>
	</table>
	<div style="text-align: right; padding-top: 10px;">
		<a href="<c:url value="/toy/list" />"> 
			<input type="button" id="button_list" name="button_list" value="목록" />
		</a>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
			<td colspan="2"><%@include file="/WEB-INF/jsp/web/main/top.jsp"%>
			</td>
		</tr>
		<tr>
			<td width="20%"><%@include file="left.jsp"%>
			</td>
			<td align="center">
				<h1>대여소 수정하기</h1><hr>
			<form action="/bytal/cradleEdit/${editInfo.cradleNo}" method="post">
				<table style="width: 70%;">
					<thead>
						<tr>
							<th>대여소 번호</th>
							<th>대여소 이름</th>
							<th>대여소 상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="text-align: center;">
								<c:out value="${editInfo.cradleNo}" />
							</td>
							<td style="text-align: center;">
								<input type="text" name=cradleName value="${editInfo.cradleName}">
							</td>
							<td style="text-align: center;">
								<select name="cradleStatus">
									<option value="Y" selected="selected">이용가능</option>
									<option value="N">이용불가</option>
								</select>
							</td>
							<c:if test="${sessionScope.memberNo eq 'admin'}">
								<td align="center">
									<a href="<c:url value="/bytal/cradleEdit/${editInfo.cradleNo}"/>">
										<input type="submit" id="edit" name="edit" value="수정하기" class="btn btn-default"/>
									</a>
								</td>
							</c:if>
						</tr>
						<c:if test="${empty editInfo}">
							<tr>
								<td style="text-align: center;" colspan="7">목록이 존재하지 않습니다.</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</form>
	</table>
	</div>
</body>
</html>
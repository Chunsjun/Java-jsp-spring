<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<script src="/bootstrap/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<title>:::Bytal Web:::</title>
</head>
<body>
	<div class="container">
		<table width="100%" height="100%" class="table table-hover">
			<tr height="20%">
				<td colspan="2">
					<%@include file="/WEB-INF/jsp/web/main/top.jsp"%>
				</td>
			</tr>
			<tr>
				<td width="20%">
					<%@include file="/WEB-INF/jsp/web/bicycle/left.jsp"%>
				</td>
				
				<td align="center">
				<h2 align="left">자전거 정보 수정</h2>
				<BR>
					<form action="/bytal/bicycle/editBicycle/${editInfo.bicycleNo}" method="post">
					<table style="width: 70%;" border="1" align="center" class="table table-hover">
						<thead>
							<tr>
								<th style="text-align: center; font-size: xx-large;">자전거 번호</th>
								<th style="text-align: center; font-size: xx-large;">대여소 지정 </th>
								<th style="text-align: center; font-size: xx-large;">자전거 상태 </th>
								
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="text-align: center; font-size: xx-large;">
									<c:out value="${editInfo.bicycleNo}" />
								</td>
								<td style="text-align: center; font-size: xx-large;">
									<select name="cradleNo">
										<option value="1" <c:if test="${editInfo.cradleNo == 1}">selected="selected"</c:if>>1대여소</option>
										<option value="2" <c:if test="${editInfo.cradleNo == 2}">selected="selected"</c:if>>2대여소</option>
										
									</select>
								</td>
								<td style="text-align: center; font-size: xx-large;">
									<select name="bicycleStatus">
										<option value="1" <c:if test="${editInfo.bicycleStatus == 1}">selected="selected"</c:if>>대여 가능</option>
										<option value="2" <c:if test="${editInfo.bicycleStatus == 2}">selected="selected"</c:if>>대여 중</option>
										<option value="3" <c:if test="${editInfo.bicycleStatus == 3}">selected="selected"</c:if>>수리 중</option>
									</select>
								</td>
								
							</tr>
							<c:if test="${empty editInfo}">
								<tr>
									<td style="text-align: center;" colspan="7">목록이 존재하지 않습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				
				<br>
				<c:if test="${sessionScope.memberNo eq 'admin'}">
					<a href="<c:url value="/bytal/bicycle/editBicycle/${editInfo.bicycleNo}"/>">
						<input type="submit" id="edit" name="edit" value="수정" class="btn btn-success"/>
					</a>
						<input type="button" value="취소" onclick="javascript:history.back(-1)" class="btn btn-danger">
				</c:if>
				</form>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
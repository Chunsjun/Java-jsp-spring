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
	<h3>장난감 목록</h3>

	<table style="width: 100%;" border="1">
		<thead>
			<tr>
				<th>장난감번호</th>
				<th>장난감이름</th>
				<th>가격</th>
				<th>가게번호</th>
				<th>보기</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${!empty listToy}">
				<c:forEach items="${listToy}" var="toy" varStatus="status">
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
						<td style="text-align: center;">
							<a href="<c:url value="/toy/view/${toy.toyNo}" />"> 
								<input type="button" id="button_view" name="button_view" value="보기" />
							</a>
						</td>
						<td style="text-align: center;">
							<a href="<c:url value="/toy/edit/${toy.toyNo}"/>"> 
								<input type="button" id="button_edit" name="button_edit" value="수정" />
							</a>
						</td>
						<td style="text-align: center;">
							<a href="<c:url value="/toy/remove/${toy.toyNo}" />"> 
								<input type="button" id="button_remove" name="button_remove" value="삭제" />
							</a>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty listToy}">
				<tr>
					<td style="text-align: center;" colspan="7">목록이 존재하지 않습니다.</td>
				</tr>
			</c:if>
		</tbody>
	</table>

	<div style="text-align: right; padding-top: 10px;">
		<a href="<c:url value="/toy/add" />"> 
		<input type="button" id="button_add" name="button_add" value="등록" />
		</a>
	</div>
</body>
</html>
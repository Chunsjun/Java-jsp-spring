<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>장바구니view</title>
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
			<td width="80%"><c:if test="${ sessionScope.num != 0}">
					<a href="/deleteCart">장바구니 삭제</a>
				</c:if>
				<table border="1" width="100%">
					<tr align="center">
						<td>도서번호</td>
						<td>도서이름</td>
						<td>저자</td>
						<td>출판사</td>
						<td>도서가격</td>
						<td>도서개수</td>
						<td>총 가격</td>
					</tr>
					<c:forEach var="a" items="${cart}">
						<tr align="right">
							<td>${a.bNum}</td>
							<td>${a.bName}</td>
							<td>${a.author}</td>
							<td>${a.publisher}</td>
							<td>￦ ${a.bCost} 원</td>
							<td>${a.cAmount}</td>
							<td>￦ ${a.total} 원</td>
						</tr>
					</c:forEach>
				</table>
		</td>
		</tr>
	</table>
</body>
</html>
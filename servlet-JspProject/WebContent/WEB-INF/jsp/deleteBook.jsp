<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
			<td width="20%"><%@ include file="left.jsp"%></td>
			<td width="80%">
				<table border="1" width="100%">
					<tr align="center">
						<td>도서번호</td>
						<td>도서이름</td>
						<td>요약정보</td>
						<td>저자</td>
						<td>출판사</td>
						<td>출판일</td>
						<td>가격</td>
					</tr>
					<c:forEach var="a" items="${book}">
						<tr align="right">
							<td>${a.bNum}</td>
							<td>${a.bName}</td>
							<td>${a.bSum}</td>
							<td>${a.author}</td>
							<td>${a.publisher}</td>
							<td>${a.bDate}</td>
							<td>￦ ${a.bCost}원</td>
						</tr>
					</c:forEach>
				</table>
				<center>
					<form action="/deleteBook" method="post">
						삭제할 도서번호 입력<br> <input type="text" name="bNum"><br>
						<input type="submit" value="삭제">
					</form>
				</center>

			</td>
		</tr>

	</table>
</body>
</html>
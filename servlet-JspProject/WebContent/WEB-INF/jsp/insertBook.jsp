<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>도서입력 JSP</title>
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
				</table><p>
				<form action="/insertBook" method="post">
					<table border="1" align="center">
						<tr>
							<td>도서이름</td>
							<td>도서요약</td>
							<td>저자</td>
							<td>출판사</td>
							<td>출판일</td>
							<td>가격</td>
						</tr>
						<tr>
							<td><input type=text name="bName"></td>
							<td><input type=text name="sum"></td>
							<td><input type=text name="author"></td>
							<td><input type=text name="publisher"></td>
							<td><input type=text name="date"></td>
							<td><input type=text name="cost"></td>
						</tr>
					</table>
					<div align="center">
						<input type=submit value="입력">
					</div>
				</form>

			</td>
		</tr>

	</table>
</body>
</html>
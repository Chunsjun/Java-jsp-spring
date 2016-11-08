<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>글쓰기 페이지</title>
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
			<td width="80%">
			<form action="/writeBoard" method="post">
					글제목 : <input type="text" name="title">
					<p>
					글내용 :<textarea rows="5" cols="50" name="contents"></textarea>
						<input type="submit" value="글올리기">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
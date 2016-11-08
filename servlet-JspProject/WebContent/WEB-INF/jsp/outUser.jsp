<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String id = (String) session.getAttribute("id"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>탈퇴 페이지</title>
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
				<form action="/outUser" method="post">
					아이디 : <input type="text" name="id" value="${id}" readonly="readonly"><br>
					 비밀번호 : <input type="text" name="password"><br> 
						<input type="submit" value="탈퇴하기">
				</form>
			</td>
		</tr>

	</table>
</body>
</html>
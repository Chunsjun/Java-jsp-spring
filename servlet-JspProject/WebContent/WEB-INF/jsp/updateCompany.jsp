<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String title = (String) session.getAttribute("title");
%>
<%
	String contents = (String) session.getAttribute("contents");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회사정보업데이트</title>
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
			<td width="80%" align="center">
				<form action="/updateCompany" method="post">
					헤드라인 : <input type="text" name="title" value=<%=title%>>
					<p>
						<textarea rows="5" cols="50" name="contents"><%=contents%></textarea>
						<input type="submit" value="수정">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
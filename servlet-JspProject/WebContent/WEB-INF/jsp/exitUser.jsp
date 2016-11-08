<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원강퇴페이지</title>
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
			<c:if test="${sessionScope.num == 0}">
				강퇴할 회원번호<br><form action="/exitUser" method="post">
				<input type="text" name="mNum"><br>
				<input type="submit" value="강퇴"></form>
			</c:if>
			<h3>가입된 회원목록</h3>
			<c:forEach var="a" items="${member}">
				회원번호 : ${a.mNum}<br> 
				아이디 : ${a.mId}<br>
				이름 : ${a.name}<br>
				나이 : ${a.age}<br>
				메일 : ${a.mail}<br>
			--------------------------<p>
				</c:forEach></td>
		</tr>
	</table>
</body>
</html>
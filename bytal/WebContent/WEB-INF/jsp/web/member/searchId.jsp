<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			<td colspan="2">
				<%@include file="/WEB-INF/jsp/web/main/top.jsp"%>
			</td>
		</tr>
		<tr>
			<td width="20%">
				<%@include file="left.jsp"%>
			</td>
			<td>
				<table border="0" width="100%" height="500">
					<tr>
						<td width="50%">
							<form action="/bytal/searchId" method="post">
								<table width="100%" height="100%">
									<tr>
										<td colspan="2" width="30%" height="20%" style="border:0" align="center">
											<h1>아이디 찾기</h1>
										</td>				
									</tr>
									<tr>
										<td width="30%" height="10%" align="right" style="border: 0">
											<h3>전화번호 </h3>
										</td>
										<td style="border: 0"><input type="text" name="phoneNo"
											size="12" maxlength="130" style="width: 80%; min-height: 10%;">
										</td>
									</tr>
									<tr>
										<td width="30%" height="10%" align="right" style="border: 0">
											<h3>이메일 </h3>
										</td>
										<td style="border: 0"><input type="text" name="email"
											size="12" maxlength="130" style="width: 80%; min-height: 10%;">
										</td>
									</tr>
									<!-- <tr>
										<td width="30%" height="10%" align="center" style="border: 0" colspan="2">
										</td>
									</tr> -->
									<tr>
										<td colspan="2" align="center" style="border:0" height="20%">
											<c:out value="${resultId}"/><br>
											<input type="submit" value="아이디 찾기" class="btn btn-primary">
										</td>
									</tr>
								</table>
							</form>
						</td>
						<td width="50%">
							<form action="/bytal/searchId" method="post">
								<table width="100%" height="100%">
									<tr>
										<td colspan="2" width="30%" height="10%" style="border:0" align="center">
											<h1>비밀번호 찾기</h1>
										</td>				
									</tr>
									<tr>
										<td width="30%" height="10%" align="right" style="border: 0">
											<h3>아이디(학번) </h3>
										</td>
										<td style="border: 0"><input type="text" name="memberNo"
											size="12" maxlength="130" style="width: 80%; min-height: 10%;">
										</td>
									</tr>
									<tr>
										<td width="30%" height="20%" align="right" style="border: 0">
											<h3>이메일 </h3>
										</td>
										<td style="border: 0"><input type="text" name="email"
											size="12" maxlength="130" style="width: 80%; min-height: 10%;">
										</td>
									</tr>
									<!-- <tr>
										<td width="30%" height="10%" align="center" style="border: 0" colspan="2">
										</td>
									</tr> -->
									<tr>
										<td colspan="2" align="center" style="border:0" height="20%">
											<c:out value="${resultPassword}"/><br>
											<input type="submit" value="비밀번호 찾기" class="btn btn-primary">
										</td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<hr>개발문의사항 : <a href="https://open.kakao.com/o/gpVISyo">오픈카톡</a><p>
</div>
</body>
</html>
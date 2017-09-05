<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::: ChanBoard :::</title>
</head>
<body>
<div class="container" align="center">
<%@include file="/WEB-INF/views/top.jsp"%>
      <form action="/login" method="post" class="form-signin">
        <h2 class="form-signin-heading">Login</h2>
		<table>
		<tr>
			<td>
		        <input type="text" name="id" class="form-control" placeholder="ID" required>
			</td>
		</tr>
		<tr>
			<td>
		        <input type="password" name="pw" class="form-control" placeholder="Password" required>
			</td>
		</tr>
		<tr>
			<td style="padding:10px;">
		        <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
			</td>
		</tr>
		<tr>
			<td>
				<a href="/join">회원가입</a>
			</td>
		</tr>
        </table>
      </form>
    </div>
</body>
</html>
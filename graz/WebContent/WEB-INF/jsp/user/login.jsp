<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<script src="/bootstrap/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function login(){
		var form = document.loginForm;
		form.submit();
	}
	function findPop(){
		var url = "/graz/find"
		var option = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		window.open(url,"",option);
	}
</script>
<c:out value="${alert}" escapeXml="false"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
<div class="container">
	<table height="100%" width="100%" border="0">
		<tr>
			<td>
				<%@include file="/WEB-INF/jsp/main/top.jsp"%>
			</td>
		</tr>
		<tr>
			<td>
				<div align="center">
					<form action="/graz/login" method=post name="loginForm" class="form-signin">
					<table border="0">
						<tr>
							<td>
								<input type="text" id="id" name="id" 
									class="form-control" placeholder="ID">
							</td>
							<td rowspan="2">
								<input type="button" value="Login" onclick="javascript:login();"
									class="btn btn-lg btn-primary btn-block">
							</td>
						</tr>
						<tr>
							<td>
								<input type="password" id="password" name="password" 
									class="form-control" placeholder="PASSWORD">
							</td>
						</tr>
						<tr>
							<td colspan="3" align="right">
								<a href="join" style="padding: 10px">
									Join
								</a>
								<a href="javascript:findPop();">
									Find ID/PW
								</a>			
							</td>
						</tr>
					</table>
					</form>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
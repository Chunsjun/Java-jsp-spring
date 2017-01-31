<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<script src="/bootstrap/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function logout(){
		if (confirm("로그아웃 하시겠습니까??") == true){
			location.href = "/graz/logout";
		} else {
		    return;
		}
	}
</script>
<div align="right">
	<table>
		<tr>
		<c:choose>
			<c:when test="${sessionScope.user == null}">
				<td style="padding: 10px;">
					<a class="btn btn-default" href="/graz/login">Login</a>
				</td>
				<td style="padding: 10px;">
					<a class="btn btn-default" href="/graz/join">Join</a>
				</td>
			</c:when>
			<c:otherwise>
				<td style="padding: 10px;">
					<a href="/graz/userInfo">
						<c:out value="${sessionScope.user.name}"/>
					</a>
						님 환영합니다.
				</td>
				<td style="padding: 10px;">
					<input type="button" value="Logout" onclick="javascript:logout();"
						class="btn btn-default">
				</td>
			</c:otherwise>
		</c:choose>
		</tr>
	</table>
</div>
<div class="nav nav-tabs" align="center">
	<table>
		<tr><td style="padding: 10px;">
			<a href="/graz/main">Main</a>
		</td><td style="padding: 10px;">
			<a href="/graz/board/free">FreeBoard</a>
		</td><td style="padding: 10px;">
			<a href="/graz/info">Info</a>
		</td></tr>
	</table>
</div>


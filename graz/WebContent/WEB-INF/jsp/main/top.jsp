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
				<div class="btn-group btn-group-justified">
					<a class="btn btn-default" href="/graz/login">Login</a>
					<a class="btn btn-default" href="/graz/join">Join</a>
				</div>
				</td>
			</c:when>
			<c:otherwise>
				<td style="padding: 10px;">
					<a href="/graz/userInfo"><c:out value="${sessionScope.user.name}"/></a>
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
		<tr>
			<td style="padding: 8px;">
				<div class="btn-group btn-group-justified">
					<a href="/graz/main" class="btn btn-default">Main</a>
					<a href="/graz/menu" class="btn btn-default">Menu</a>
					<a href="/graz/board/free" class="btn btn-default">Board</a>
					<a href="/graz/info" class="btn btn-default">Info</a>
				</div>
			</td>
		</tr>
	</table>
</div>


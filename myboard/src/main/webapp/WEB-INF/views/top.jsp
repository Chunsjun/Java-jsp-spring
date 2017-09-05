<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="UTF-8">
<script type="text/javascript">
	function logout(){
		if (confirm("로그아웃 하시겠습니까??") == true){
			location.href = "/logout";
		} else {
		    return;
		}
	}
	<c:out value="${alert}" escapeXml="false"/>
</script>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<script src="/resources/bootstrap/js/jquery.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<div class="nav nav-tabs">
	<div class="btn-group btn-group-justified">
		<a href="http://chunsjun.cafe24.com" class="btn btn-default">Main</a>
		<a href="/list" class="btn btn-primary">Board</a>
		<c:choose>
			<c:when test="${sessionScope.user == null}">
				<a href="/login" class="btn btn-success">Login</a>
			</c:when>
			<c:otherwise>
				<a href="/info/<c:out value="${sessionScope.user.uno}"/>" class="btn btn-success">
					<c:out value="${sessionScope.user.id}" />님 환영합니다
				</a>
				<a onclick="logout();" class="btn btn-danger">Logout</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
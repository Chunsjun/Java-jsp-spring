<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<nav class="navbar navbar-default">
	<div class="container-fluid" align="center">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">Chunsjun.cafe24.com</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="/list">Board</a></li>
				<li><a href="/map">Map</a></li>
				<li><a href="#">About</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
				<c:when test="${empty sessionScope.user}">
				<li class="active"><a href="/login">로그인</a></li>
				<li><a href="/join">회원가입</a></li>
				</c:when><c:otherwise>
				<li class="active"><a href="/info/<c:out value="${sessionScope.user.uno}"/>">회원정보</a></li>
				<li><a onclick="logout();">로그아웃</a></li>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>

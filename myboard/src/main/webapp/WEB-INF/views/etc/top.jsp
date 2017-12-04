<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<li><a href="/about">About</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
				<c:when test="${empty sessionScope.user}">
				<li class="active"><a href="/login">로그인</a></li>
				<li><a href="/join">회원가입</a></li>
				</c:when><c:otherwise>
				<li class="active"><a href="/info/<c:out value="${sessionScope.user.uno}"/>">회원정보</a></li>
				<li><a id="logout" onclick="logout();">로그아웃</a></li>
				</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>

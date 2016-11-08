<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String str = (String) session.getAttribute("name");
%>
<a href="/index"><h1 align="center">SMMedia</h1></a>
<hr>
<c:choose>
	<c:when test="${sessionScope.id == null}">
		<h2 align="center">환영합니다 . 선문 미디어 입니다.<p>로그인해주세요.</h2>
	</c:when>
	<c:otherwise>
		<h2 align="center">
			환영합니다 .
			<%=str%>
			님
		</h2>
		<c:if test="${sessionScope.num != 0 }">
			<div align="left">
				<a href="/outUser">회원탈퇴</a>
			</div>
		</c:if>
		<c:if test="${sessionScope.num == 0}">
			<a href="/viewAllUser">회원목록</a><br>
			<a href="/viewAllUnUser">비활성회원목록</a>
		</c:if>
	</c:otherwise>
</c:choose>
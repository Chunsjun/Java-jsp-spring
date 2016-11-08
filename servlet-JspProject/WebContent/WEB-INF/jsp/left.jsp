<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${sessionScope.id == null}">
		<a href ="/loginform">로그인</a><p>
		<a href ="/addUser">회원가입</a>
	</c:when>
	<c:otherwise>
		<a href ="/logout">로그아웃</a><p>
		<a href ="/viewUser">마이페이지</a><p>
		<a href ="/viewCompany">회사정보</a><p>
		<a href ="/viewBook">도서정보</a><p>
		<a href ="/viewCart">장바구니</a><p>
		<a href ="/viewBoard">게시판</a><p>
	</c:otherwise>
</c:choose>


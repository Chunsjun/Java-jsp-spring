<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<script src="/resources/bootstrap/js/jquery.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	<c:out value="${alert}" escapeXml="false"/>
</script>
<title>::: Main Page :::</title>
</head>
<body>
<div align="center">
	<header>
	<h1>
		<a href="http://chunsjun.cafe24.com">
		chunsjun.cafe24.com
		</a>
	</h1>
	</header>
	<img alt="background" src="/resources/img/background3.jpg" width="60%;">
		<p><p>
			<a href="/list">Board</a>
		<p>
			<a href="https://github.com/Chunsjun">GitHub</a>
		<p>
			<a href="https://open.kakao.com/o/spzv4Wz">Kakao-Talk</a>
		<p>
			<h2>My Profile</h2><p>
		SEONGJUN CHUN /
		91 / Male / Gyeonggi-do, Korea /
		chunsjun@gmail.com
	<footer>
		Copyright &copy;chunsjun.cafe24.com
	</footer>
</div>
</body>
</html>
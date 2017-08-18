<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function golist(){
		location.href = "/list";
	}
</script>
<title>::: ChanBoard :::</title>
</head>
<body>
<form action="/write" method="post">
<div class="container">
<%@include file="/WEB-INF/views/top.jsp"%>
	<table class="table">
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" class="form-control"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="30" name="content" class="form-control"></textarea></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="writer" class="form-control"/></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="bpw" class="form-control"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="글쓰기" class="btn btn-default">
				<input type="button" value="목록" onclick="javascript:golist();" class="btn btn-default"/>
			</td>
		</tr>
	</table>
</div>
</form>
</body>
</html>
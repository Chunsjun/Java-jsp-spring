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
	
	function lengthCheck(obj){
		var str = obj.value;
		var str_length = str.length;
		document.getElementById('lengthInfo').innerText = str_length + " / 1000";
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
			<td><input type="text" name="title" class="form-control" placeholder="최대 20자" maxlength="20"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea oninput="javascript:lengthCheck(this);" rows="10" cols="30" name="content" class="form-control" placeholder="최대  1000자" maxlength="1000"></textarea>
			<label id="lengthInfo"></label>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><c:out value="${sessionScope.user.name}"/></td>
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
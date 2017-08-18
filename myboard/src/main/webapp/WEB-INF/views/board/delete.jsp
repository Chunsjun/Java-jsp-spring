<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function goback(){
		if (confirm("정말 취소하시겠습니까??") == true){
		    history.back(-1);
		} else {
		    return;
		}
	}
</script>
<title>::: ChanBoard :::</title>
</head>
<body>
<div align="center">
<%@include file="/WEB-INF/views/top.jsp"%>
<form action="/delete" method="post">
비밀번호가 다르면 삭제되지 않습니다.
	<table>
		<tr>
			<td hidden="hidden">
				<input type="text" value="<c:out value='${bno}'/>" name="bno">
			</td>
		</tr>
		<tr>
			<td align="center">
				<label>
					비밀번호
				</label>
			</td>
		</tr>
		<tr>
			<td>
				<input type="password" name="bpw">
			</td>
		</tr>
	</table>
	<input type="submit" value="확인" class="btn btn-default">
	<input type="button" value="취소" onclick="javascript:goback();" class="btn btn-default">
</form>
</div>
</body>
</html>
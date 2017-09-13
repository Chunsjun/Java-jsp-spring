<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function userOut(uno){
		if (confirm("정말 탈퇴하시겠습니까??") == true){
			location.href = "/userout/"+uno;
		} else {
		    return;
		}
	}
</script>
<title>::: ChanBoard :::</title>
</head>
<body>
<div class="container" align="center">
<%@include file="/WEB-INF/views/top.jsp"%>
<table>
	<thead>
		<tr>
			<td align="center">
				<h1>
					가입정보
				</h1>
			</td>
		</tr>
	</thead>
	<tbody>
	<tr>
		<th style="padding:10px;">
			<c:out value="${user.name}"/>님 (<c:out value="${user.id}"/>)
		</th>
	</tr>
	<tr>
		<th style="padding:10px;">
			이메일 : <c:out value="${user.email}"/>
		</th>
	</tr>
	<tr>
		<th style="padding:10px;">
			가입일 : <fmt:formatDate value="${user.date}" pattern="yyyy.MM.dd (kk:mm:ss)"/>
		</th>
	</tr>
	</tbody>
	<tfoot>
		<tr>
			<td>
				<input type="button" value="회원탈퇴" class="btn btn-danger" onclick="userOut(${user.uno});">
			</td>
		</tr>
	</tfoot>
</table>
</div>
</body>
</html>
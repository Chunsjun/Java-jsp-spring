<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<% String num = (String) session.getAttribute("emailCheckNum"); %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<script src="/bootstrap/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function emailSubmit(){
		var form = document.emailForm;
		form.submit();
		alert("인증번호 요청완료");
	}
	
	function emailCheckBtn(numValue){
		if(numValue == <%=num%>){
			alert("인증완료");
			window.close();
			window.opener.emTextDisabled();
			<% session.removeAttribute("emailCheckNum");%>
		}else{
			alert("인증번호가 정확하지 않습니다.");
		}
	}
</script>
<title>이메일 인증페이지</title>
</head>
<body>
<div class="container" align="center">
	<table>
		<tr>
			<td align="center">
			<hr>
				<label>
					이메일 인증페이지
				</label>
			<hr>
			</td>
		</tr>
		<tr>
			<td align="center">
			<form action="/graz/emailCheck" method="post" name="emailForm">
				<input type="text" size="30" value="<c:out value='${email}'/>"
				name="email" id="email" class="form-control" readonly="readonly"><p>
				<input type="button" value="인증번호전송" onclick="emailSubmit();" class="btn btn-default">
			</form>
			</td>
		</tr>
		<tr>
			<td align="center"><hr><label>인증번호</label>
			<form action="/graz/emailNumCheck" method="post" name="emNumChkForm">
				<input type="text" name="emailCheckNum" id="emailCheckNum" class="form-control" maxlength="4"><p>
				<input type="button" value="인증하기" onclick="emailCheckBtn(this.form.emailCheckNum.value);" class="btn btn-default">
			</form>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
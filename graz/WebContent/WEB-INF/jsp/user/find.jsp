<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<script src="/bootstrap/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function findId(){
		var form = document.findIdForm;
		if(form.name.value == "") {
			alert("이름을 입력해주세요");
			form.name.focus();
			return;
		}
		if(form.email.value == "") {
			alert("이메일을 입력해주세요");
			form.email.focus();
			return;
		}
		form.submit();
	}
	
	function findPw(){
		var form = document.findPwForm;
		if(form.id.value == "") {
			alert("아이디를 입력해주세요");
			form.id.focus();
			return;
		}
		if(form.pNumber.value == "") {
			alert("핸드폰 번호를 입력해주세요");
			form.pNumber.focus();
			return;
		}
		if(form.email.value == "") {
			alert("이메일을 입력해주세요");
			form.email.focus();
			return;
		}
		form.submit();
	}
	<c:out value="${find}" escapeXml="false"/>
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Find ID/PW</title>
</head>
<body>
<div class="container">
<form action="/graz/find" method="post" name="findIdForm">
	<table class="table">
		<tr>
			<td colspan="2">
				<label>
					FIND ID
				</label>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="name" class="form-control" placeholder="Name"/>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="email" class="form-control" placeholder="E-Mail"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="FIND" class="btn btn-success" onclick="findId();"/>
			</td>
		</tr>
	</table>
</form>
<form action="/graz/find" method="post" name="findPwForm">
	<table class="table">
		<tr>
			<td colspan="2">
				<label>
					FIND PASSWORD
				</label>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="id" class="form-control" placeholder="ID"/>
			</td>
		<tr>
			<td>
				<input type="text" name="pNumber" class="form-control" placeholder="Phone-Number"/>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="email" class="form-control" placeholder="E-Mail"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="FIND" class="btn btn-success" onclick="findPw();"/>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>
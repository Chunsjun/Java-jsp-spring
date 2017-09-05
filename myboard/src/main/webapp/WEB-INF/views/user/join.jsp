<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function id_check(value) {
		if (value.length < 6) {
			document.getElementById('idChecker').innerHTML = "<font color=red>6 ~ 16자 이상의 아이디 입력</font>";
			i = false;
		} else {
			document.getElementById('idChecker').innerHTML = "<font color=green>멋진 아이디네요 !</font>";
			i = true;
		}
	}
	function pw_check(value) {
		if (value.length < 8) {
			document.getElementById('pwChecker').innerHTML = "<font color=red>8 ~ 16자 이상의 비밀번호 입력</font>";
			p = false;
		} else {
			document.getElementById('pwChecker').innerHTML = "";
			p = true;
		}
	}
	function rpw_check(value) {
		var pw = document.getElementById('pw').value;
		if (value != pw) {
			document.getElementById('rpwChecker').innerHTML = "<font color=red>비밀번호가 일치하지않음!</font>";
			r = false;
		} else {
			document.getElementById('rpwChecker').innerHTML = "<font color=green>OK!</font>";
			r = true;
		}
	}
	function name_check(value) {
		if (value.length < 2) {
			document.getElementById('nameChecker').innerHTML = "<font color=red>2 ~ 10자 이상의 이름 입력</font>";
			n = false;
		} else {
			document.getElementById('nameChecker').innerHTML = "<font color=green>멋진 이름이네요 !</font>";
			n = true;
		}
	}
	function joinBtn() {
		var form = document.getElementById('joinForm');
		if(i==true && p==true && r==true && n==true){
			form.submit();
		}else{
			alert("정상적으로 입력이 되지 않았습니다.");
		}
	}
</script>
<title>::: ChanBoard :::</title>
</head>
<body>
	<div align="center" class="container">
		<%@include file="/WEB-INF/views/top.jsp"%>
		<form action="/join" method="post" id="joinForm">
			<table>
				<tr>
					<td>
						<h1>Join Us</h1>
					</td>
				</tr>
				<tr>
					<td><input type="text" name="id" class="form-control"
						placeholder="ID" onkeyup="id_check(this.form.id.value);">
						<p id="idChecker"></td>
				</tr>
				<tr>
					<td><input type="password" name="pw" class="form-control"
						placeholder="PASSWORD" onkeyup="pw_check(this.form.pw.value);"
						id="pw">
						<p id="pwChecker"></td>
				</tr>
				<tr>
					<td><input type="password" name="rpw" class="form-control"
						placeholder="REPEAT-PASSWORD"
						onkeyup="rpw_check(this.form.rpw.value);">
						<p id="rpwChecker"></td>
				</tr>
				<tr>
					<td><input type="text" name="name" class="form-control"
						placeholder="NAME" onkeyup="name_check(this.form.name.value);">
						<p id="nameChecker"></td>
				</tr>
				<tr>
					<td><input type="text" name="email" class="form-control"
						placeholder="EMAIL"></td>
				</tr>
				<tr>
					<td style="padding: 10px;"><input type="button" value="가입"
						class="btn btn-lg btn-primary btn-block" onclick="joinBtn();"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
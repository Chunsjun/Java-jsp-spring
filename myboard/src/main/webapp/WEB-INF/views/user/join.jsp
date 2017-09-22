<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/etc/scripts.jsp"%>
<script type="text/javascript">
	idChk = false;
	pwChk = false;
	rptPwChk = false;
	nameChk = false;
	
	function fontRed(txt){
		return "<font color=red>"+txt+"</font>";
	}
	
	function fontGreen(txt){
		return "<font color=green>"+txt+"</font>";
	}

	function idCheck() {
		var value = $('#id').val();
		if (!value.match('@') || !value.match('.com') && !value.match('.net')) {
			$('#idChecker').html(fontRed('이메일을 정확히 입력해주세요!'));
			idChk = false;
		} else {
			$('#idChecker').html(fontGreen('OK!'));
			idChk = true;
		}
	}
	
	function pwCheck() {
		var value = $('#pw').val();
		if (value.length < 6 || value.trim()=="" || value.length > 16) {
			$('#pwChecker').html(fontRed('6 ~ 16자 이상 비밀번호 입력'));
			pwChk = false;
		} else {
			$('#pwChecker').html(fontGreen('OK!'));
			pwChk = true;
		}
	}
	
	function rptPwCheck() {
		var value = $('#rptPw').val();
		var pw = $("#pw").val();
		if (value != pw || value.length < 6 || value.trim()=="" || value.length > 16) {
			$('#rptPwChecker').html(fontRed('비밀번호가 일치하지않음!'));
			rptPwChk = false;
		} else {
			$('#rptPwChecker').html(fontGreen('OK!'));
			rptPwChk = true;
		}
	}
	
	function nameCheck() {
		var value = $('#name').val();
		if (value.length < 2 || value.trim() == "" || value.length > 10) {
			$('#nameChecker').html(fontRed('2 ~ 10자 이상의 이름 입력'));
			nameChk = false;
		} else {
			$('#nameChecker').html(fontGreen('OK!'));
			nameChk = true;
		}
	}
	
	function joinBtn() {
		var form = document.getElementById('joinForm');
		if(idChk==true && pwChk==true && rptPwChk==true && nameChk==true)
		{
			form.submit();
		}else{
			alert("정상적으로 입력이 되지 않았습니다.");
		}
	}
	<c:out value="${alert}" escapeXml="false"/>
</script>
<title>::: ChanBoard :::</title>
</head>
<body>
	<div class="container">
	<%@include file="/WEB-INF/views/etc/top.jsp"%>
	<div class="page-header">
		<h1>회원가입</h1>
	</div>
	<div class="col-md-6 col-md-offset-3">
		<form action="/join" method="post" id="joinForm" role="form">
			<div class="form-group">
			<label for="id">이메일 주소</label>
				<input type="email" name="id" id="id" class="form-control" placeholder="EMAIL" oninput="idCheck();" maxlength="30" required>
				<p id="idChecker">
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label>
				<input type="password" name="pw" id="pw" class="form-control" placeholder="PASSWORD" oninput="pwCheck();" maxlength="16" required>
				<p id="pwChecker">
			</div>
			<div class="form-group">
				<label for="rptPw">비밀번호 확인</label>
				<input type="password" name="rptPw" id="rptPw" class="form-control" placeholder="REPEAT-PASSWORD" oninput="rptPwCheck();" maxlength="16" required>
				<p id="rptPwChecker">
			</div>
			<div class="form-group">
				<label for="name">이름</label>
				<input type="text" name="name" id="name" class="form-control" placeholder="NAME" oninput="nameCheck();" maxlength="10" required>
				<p id="nameChecker">
			</div>
			<div class="form-group text-center">
				<input type="button" value="가입" class="btn btn-lg btn-primary btn-block" onclick="joinBtn();">
			</div>
		</form>
	</div>
</div>
</body>
</html>
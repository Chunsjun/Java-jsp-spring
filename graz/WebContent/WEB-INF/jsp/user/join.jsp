<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
		
	function join(){

		var form = document.joinForm;
		
		if(form.id.value == "") {  //form에 있는 memberNo 값이 없을 때
			alert("아이디를 입력해주세요");  //경고창 띄움
			form.id.focus();  //form에 있는 memberNo 위치로 이동
			return;
		}
		
		var pw = form.password.value;
		var pw2 = form.passwordCheck.value;
		
		if(pw == "" || pw2 == "") {
			alert("비밀번호를 입력해주세요.");
			if(pw ==""){
				form.password.focus();
			}else{
				form.passwordCheck.focus();
			}
			return;
			
		}else if(pw.length <= 7 || pw2.length <= 7){
			alert("비밀번호가 짧습니다");
			if(pw.length <= 7){
				form.password.focus();
			}else{
				form.passwordCheck.focus();
			}
			return;
			
		}else if(pw != pw2){
			alert("비밀번호가 동일하지 않습니다");
			form.password.focus();
			return;
		}
		
		if(form.name.value == "") {
			alert("이름을 적어주세요");
			form.name.focus();
			return;
		}else if(form.name.value.length <= 1){
			alert("이름이 짧습니다");
			form.name.focus();
			return;
		}
		
		var emStr = form.email.value;
		
		if(emStr == "") {
			alert("이메일을 적어주세요");
			form.email.focus();
			return;
		}else if(!emStr.match("@")){
			alert("이메일을 정확히 입력해주세요");
			form.email.focus();
			return;
		}else if(!emStr.match(".com") && !emStr.match(".net")){
			alert("이메일을 정확히 입력해주세요");
			form.email.focus();
			return;	
		}
		
		if(form.pNumber.value == "") {
			alert("전화번호를 적어주세요");
			form.pNumber.focus();
			return;
		}else if(form.pNumber.value.length <= 10){
			alert("전화번호를 정확히 입력해주세요");
			form.pNumber.focus();
			return;
		}
		form.submit();
	}
	
	function check(id){
		var form = document.joinForm;
		
		if(id == ""){
			alert("아이디를 적어주세요.");
			form.id.focus();
			return;
		}else if(form.id.value.length <= 3){
			alert("아이디 길이가 짧거나 올바르지 않습니다");
			form.id.focus();
			return;
		}else{
			var option = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
			window.open("/graz/check?id="+id, "",option);
		}
	}
	
	function idTextDisabled(){
		document.getElementById('id').readOnly = true;
		document.getElementById('idChkBtn').disabled = true;
		document.getElementById('idChkBtn').value = "확인완료";
		if(document.getElementById('email').readOnly){
			document.getElementById('joinBtn').disabled = false;
		}
	}
	
	function emTextDisabled(){
		document.getElementById('email').readOnly = true;
		document.getElementById('emChkBtn').disabled = true;
		document.getElementById('emChkBtn').value = "인증완료";
			
		if(document.getElementById('id').readOnly){
			document.getElementById('joinBtn').disabled = false;
		}else{
			alert("아이디 중복확인을 완료해주세요.");
		}
	}
	
	function reset(){
		if(confirm("초기화 하시겠습니까?")==true){
			var form = document.joinForm;
				form.id.value = "";
				form.password.value = "";
				form.passwordCheck.value = "";
				form.name.value = "";
				form.email.value = "";
				form.pNumber.value = "";
				
			document.getElementById('id').readOnly = false;
			document.getElementById('joinBtn').disabled = true;
			document.getElementById('email').readOnly = false;
			document.getElementById('emChkBtn').disabled = false;
			document.getElementById('emChkBtn').value = "인증하기";
			document.getElementById('idChkBtn').disabled = false;
			document.getElementById('idChkBtn').value = "중복확인";
		}else{
			return;
		}
	}
	
	function emailCheckBtn(email){
		var form = document.joinForm;
		if(email == "") {
			alert("이메일을 적어주세요");
			form.email.focus();
			return;
		}else if(!email.match("@")){
			alert("이메일을 정확히 입력해주세요");
			form.email.focus();
			return;
		}else if(!email.match(".com") && !email.match(".net")){
			alert("이메일을 정확히 입력해주세요");
			form.email.focus();
			return;	
		}else{
			var option = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
			window.open("/graz/emailCheck?email="+email, "",option);
		}
	}
	
	<c:out value="${resultCheckId}" escapeXml="false"/>
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join</title>
</head>
<body>
<div class="container">
	<table>
		<tr>
			<td>
				<%@include file="/WEB-INF/jsp/main/top.jsp"%>
			</td>
		</tr>
		<tr>
			<td>
				<div align="center">
				<form action="/graz/join" method="post" name="joinForm">
					<table class="table">
						<tr>
							<td colspan="3" style="padding: 10px;">
								<h1 align="center">
									<span class="label label-default"><c:out value="Join Us"/></span>
								</h1>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" id="id" name="id" class="form-control" 
									placeholder="ID" value="<c:out value='${user.id}'/>" maxlength="15"/>
							</td>
							<td>
								<input id="idChkBtn" type="button" value="중복확인" onclick="javascript:check(this.form.id.value);" 
									class="btn btn-default">
								<label style="color:gray">
									<c:out value="(아이디는 4자 이상)"/>
								</label>
							</td>
						</tr>
						<tr>
							<td>
								<input type="password" id="password" name="password" class="form-control" 
									placeholder="PASSWORD" maxlength="12"/><br>
								<input type="password" id="passwordCheck" name="passwordCheck" class="form-control"
									placeholder="PASSWORD CHECK" maxlength="12"/>
							</td>
							<td>
								<label style="color:gray">
									<c:out value="(8 ~ 12자의 비밀번호 입력)"/>
								</label>
								<p id="checkAlert"/>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" id="name" name="name" class="form-control" 
									placeholder="NAME" maxlength="10"/>
							</td>
							<td>
							<label style="color:gray">
								<c:out value="(2~10자의 한글or영문이름 입력)"/>
							</label>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" id="email" name="email" class="form-control" 
									placeholder="E_MAIL" maxlength="30"/>
							</td>
							<td>
								<input type="button" value="인증하기" id="emChkBtn" onclick="emailCheckBtn(this.form.email.value);" class="btn btn-default">
								<label style="color:gray">
								<c:out value="('@***.com' 도메인까지 입력)"/>
								</label>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" id="pNumber" name="pNumber" class="form-control" 
									placeholder="PHONE_NUMBER" maxlength="11"/>
							</td>
							<td>
								<label style="color:gray">
								<c:out value="('-' 는 제외하고 입력)"/>
								</label>
							</td>
						</tr>
					</table>
				</form>
					<input type="button" id="joinBtn" value="Join" onclick="javascript:join();"
						class = "btn btn-success" disabled="disabled">
					<input type="button" value="Reset" class="btn btn-warning" onclick="javascript:reset();">
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
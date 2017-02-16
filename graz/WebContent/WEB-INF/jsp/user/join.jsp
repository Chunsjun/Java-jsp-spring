<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	function join(){
		var form = document.joinForm;
		
		if(form.id.value == "") {  //form에 있는 memberNo 값이 없을 때
			alert("아이디를 입력해주세요");  //경고창 띄움
			form.id.focus();  //form에 있는 memberNo 위치로 이동
			return;
		}
		if(form.password.value == "") {
			alert("비밀번호를 적어주세요");
			form.password.focus();
			return;
		}
		if(form.name.value == "") {
			alert("이름을 적어주세요");
			form.name.focus();
			return;
		}
		if(form.email.value == "") {
			alert("이메일을 적어주세요");
			form.email.focus();
			return;
		}
		if(form.pNumber.value == "") {
			alert("전화번호를 적어주세요");
			form.pNumber.focus();
			return;
		}
		form.submit();
	}
	
	function check(id){
		if(id == ""){
			alert("아이디를 적어주세요.");
			return;
		}else{
			var option = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
			window.open("/graz/check?id="+id, "",option);
		}
	}
	
	function joinBtnUnDisabled(){
		var btn = document.getElementById('joinBtn');
			btn.disabled = false;
		var inputBox = document.getElementById('id');
			inputBox.readOnly = true;
	}
	function joinBtnDisabled(){
		var btn = document.getElementById('joinBtn');
			btn.disabled = true;
	}
	
	function reset(){
		if(confirm("초기화 하시겠습니까?")==true){
			var form = document.joinForm;
				form.id.value = "";
				form.password.value = "";
				form.name.value = "";
				form.email.value = "";
				form.pNumber.value = "";
			
			var inputBox = document.getElementById('id');
				inputBox.readOnly = false;
			var btn = document.getElementById('joinBtn');
				btn.disabled = true;
		}else{
			return;
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
	<table height="100%" width="100%">
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
								<input id="test2" type="button" value="Check" onclick="javascript:check(this.form.id.value);" 
									class="btn btn-default">
							</td>
						</tr>
						<tr>
							<td>
								<input type="password" id="password" name="password" class="form-control" 
									placeholder="PASSWORD" maxlength="12"/>
							</td>
							<td style="color: gray">
								<c:out value="(8 ~ 12자의 비밀번호 입력)"/>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" id="name" name="name" class="form-control" 
									placeholder="NAME" maxlength="10"/>
							</td>
							<td style="color: gray">
								<c:out value="(2~10자의 한글or영문이름 입력)"/>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" id="email" name="email" class="form-control" 
									placeholder="E_MAIL" maxlength="30"/>
							</td>
							<td style="color: gray">
								<c:out value="('@***.com' 도메인까지 입력)"/>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" id="pNumber" name="pNumber" class="form-control" 
									placeholder="PHONE_NUMBER" maxlength="11"/>
							</td>
							<td style="color: gray">
								<c:out value="('-' 는 제외하고 입력)"/>
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
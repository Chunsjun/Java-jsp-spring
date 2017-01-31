<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	function check(){
		var a = document.getElementById("id").value;
		alert(a);
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join</title>
</head>
<body>
<div class="container">
	<table height="100%" width="100%" border="0">
		<tr>
			<td>
				<%@include file="/WEB-INF/jsp/main/top.jsp"%>
			</td>
		</tr>
		<tr>
			<td>
				<div align="center">
				<form action="/graz/join" method="post" name="joinForm">
					<table>
						<tr>
							<td colspan="3" style="padding: 10px;">
								<h1 align="center">
									<span class="label label-default">Join Us</span>
								</h1>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" id="id" name="id" class="form-control" placeholder="ID"/>
							</td>
							<td>
								<input type="button" value="Check" onclick="javascript:check();" 
									class="btn btn-default">
							</td>
						</tr>
						<tr>
							<td>
								<input type="password" id="password" name="password" class="form-control" placeholder="PASSWORD"/>
							</td>
							<td style="color: gray">
								(8 ~ 12자의 비밀번호 입력)
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" id="name" name="name" class="form-control" placeholder="NAME"/>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" id="email" name="email" class="form-control" placeholder="E_MAIL"/>
							</td>
							<td style="color: gray">
								('@***.com' 도메인까지 입력)
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" id="pNumber" name="pNumber" class="form-control" placeholder="PHONE_NUMBER"/>
							</td>
							<td style="color: gray">
								('-' 는 제외하고 입력)
							</td>
						</tr>
					</table>
					<input type="button" value="Join" onclick="javascript:join();"
						class = "btn btn-success">
					<input type="reset" value="Reset" class = "btn btn-warning">
				</form>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
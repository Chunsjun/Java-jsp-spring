<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function editCheck() {
	var form = document.editForm;
	
	if(form.password.value == "") {
		alert("비밀번호를 적어주세요");
		form.password.focus();
		return;
	}

	if(form.memberName.value == "") {
		alert("이름을 적어주세요");
		form.memberName.focus();
		return;
	}
	
	if(form.phoneNo.value == "") {
		alert("전화번호를 적어주세요");
		form.phoneNo.focus();
		return;
	}
	
	if(form.email.value == "") {
		alert("이메일을 적어주세요");
		form.email.focus();
		return;
	}
	
	form.submit();
}

function cancel() {
	if (confirm("회원정보 수정을 취소하시겠습니까??") == true){    //확인
	    location.href = "/bytal/main";
	} else {   //취소
	    return;
	}
}

function withdraw() {
	if (confirm("회원탈퇴 하시겠습니까??") == true){    //확인
		location.href = "/bytal/withdraw";
	} else {   //취소
	    return;
	}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::Bytal Web:::</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<script src="/bootstrap/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<table width="100%" height="100%">
		<tr height="20%">
			<td>
				<%@include file="/WEB-INF/jsp/web/main/top.jsp"%>
			</td>
		</tr>
		<tr>
			<td>
				<form action="/bytal/editMember" method="post" name="editForm">
					<table border="0" width="70%" height="50%" align="center" class="table">
						<tr>
							<td width="40%" height="50%" align="right" style="border: 0">
								<font size="5">아이디(학번) </font>
							</td>
							<td style="border: 0">
								<font size="4"><c:out value="${sessionScope.memberNo}"/>&nbsp;&nbsp;</font>
								<input type="button" value="회원탈퇴" onclick="javascript:withdraw()" class="btn btn-danger">
							</td>
						</tr>
						<tr>
							<td width="30%" height="50%" align="right" style="border: 0">
								<font size="5">비밀번호 </font>
							</td>
							<td style="border: 0"><input type="password" name="password" value="${member.password}"
								size="12" maxlength="130" style="width: 50%; min-height: 50%;" class="form-control">
							</td>
						</tr>
						<tr>
							<td width="30%" height="50%" align="right" style="border: 0">
								<font size="5">이름 </font>
							</td>
							<td style="border: 0"><input type="text" name="memberName" value="${member.memberName}"
								size="12" maxlength="130" style="width: 50%; min-height: 50%;" class="form-control">
							</td>
						</tr>
						<tr>
							<td width="30%" height="50%" align="right" style="border: 0">
								<font size="5">전화번호 </font>
							</td>
							<td style="border: 0"><input type="text" name="phoneNo" value="${member.phoneNo}"
								size="12" maxlength="130" style="width: 50%; min-height: 50%;" placeholder="(-)는 빼고 입력해주세요" class="form-control">
							</td>
						</tr>
						<tr>
							<td width="30%" height="50%" align="right" style="border: 0">
								<font size="5">이메일 </font>
							</td>
							<td style="border: 0"><input type="text" name="email" value="${member.email}"
								size="12" maxlength="130" style="width: 50%; min-height: 50%;" class="form-control">
							</td>
						</tr>
						<tr>
							<td style="border: 0" align="center" colspan="2">
								<input type="button" value="수정" style="height:30px; width:80px;"
								class="btn btn-success" onclick="javascript:editCheck();">
								<input type="reset" value="취소" style="height:30px; width:80px;" 
								class="btn btn-default" onclick="javascript:cancel();">
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
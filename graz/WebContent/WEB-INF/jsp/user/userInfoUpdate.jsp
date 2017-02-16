<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	function update(){
		if (confirm("수정 하시겠습니까??") == true){
			var form = document.updateForm;
			form.submit();
		} else {
		    return;
		}
	}
	
	function cancel(){
		location.href="/graz/userInfo";
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UserInfoUpdate</title>
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
				<form action="/graz/userInfoUpdate" method="post" name="updateForm">
					<table>
						<tr>
							<td colspan="2" align="center" style="font-weight: bolder; font-size: 30px;">
								<c:out value="${sessionScope.user.name} 님. (${sessionScope.user.id})"/>
							</td>
						</tr>
						<tr>
							<th>
								회원번호 : 
							</th>
							<td align="center" style="padding: 10px;">
								<c:out value="${sessionScope.user.userNo}"/>
							</td>
						</tr>
						<tr>
							<th>
								E-MAIL : 
							</th>
							<td align="center" style="padding: 10px;">
								<input type="text" name="email" value='<c:out value="${sessionScope.user.email}"/>' class="form-control" maxlength="30">
							</td>
						</tr>
						<tr>
							<th>
								PHONE-NUMBER : 
							</th>
							<td align="center" style="padding: 10px;">
								<input type="text" name="pNumber" value='<c:out value="${sessionScope.user.pNumber}"/>' class="form-control" maxlength="11">
							</td>
						</tr>
					</table>
				</form>
					<input type="button" value="Complete" onclick="javascript:update();" class="btn btn-default">
					<input type="button" value="Cancel" onclick="javascript:cancel();" class="btn btn-danger">
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
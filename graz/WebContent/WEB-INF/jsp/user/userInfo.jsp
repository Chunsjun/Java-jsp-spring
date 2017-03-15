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
	function exit(){
		if (confirm("회원탈퇴 하시겠습니까??") == true){
			location.href = "/graz/userExit";
		} else {
		    return;
		}
	}
	function update(){
		location.href = "/graz/userInfoUpdate";
	}
	function viewUsers(){
		location.href = "/graz/viewUsers";
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UserInfo</title>
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
				<div align="center" style="padding: 10px;">
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
								<c:out value="${sessionScope.user.email}"/>
							</td>
						</tr>
						<tr>
							<th>
								PHONE-NUMBER : 
							</th>
							<td align="center" style="padding: 10px;">
								<c:out value="${sessionScope.user.pNumber}"/>
							</td>
						</tr>
					</table>
					<c:choose>
						<c:when test="${sessionScope.user.userNo != 0}">
							<input type="button" value="회원수정" onclick="javascript:update();"
								class="btn btn-default">
							<input type="button" value="회원탈퇴" onclick="javascript:exit();"
								class="btn btn-danger">
						</c:when>
						<c:otherwise>
							<input type="button" value="회원보기" onclick="javascript:viewUsers();"
								class="btn btn-default">
						</c:otherwise>
					</c:choose>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
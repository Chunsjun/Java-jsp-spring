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
	function userOut(userNo,status){
		var no = userNo;
		var st = status;
		if(st == 1){
			if(confirm("탈퇴처리 하시겠습니까 ??") == true){
				location.href = "/graz/usersOut/"+no;
			}else{
				return;
			}
		}else{
			if(confirm("회원을 복귀 시키시겠습니까 ??") == true){
				location.href = "/graz/usersIn/"+no;
			}else{
				return;
			}
		}
	}
	
	function deleteUser(userNo){
		var no = userNo;
		if(confirm("회원을 영구삭제 하시겠습니까 ??") == true){
			location.href = "/graz/deleteUser/"+no;
		}else{
			return;
		}
	}
	
	function password(userPassword){
		alert(userPassword);
		/* var popUrl = "/graz/main";
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
			window.open(popUrl,"",popOption); */
	}
	
	function backToMain(){
		location.href = "/graz/main";
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View All Users</title>
</head>
<body>
<div class="container">
<input type="button" value="메인으로" onclick="javascript:backToMain();" class="btn btn-default"/>
	<table class="table">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>핸드폰번호</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${viewUsers}" var="user" varStatus="status">
				<tr>
					<td>
						<c:out value="${user.userNo}"/>
					</td>
					<td>
						<c:out value="${user.id}"/>
					</td>
					<td>
						<c:out value="${user.name}"/>
					</td>
					<td>
						<c:out value="${user.email}"/>
					</td>
					<td>
						<c:out value="${user.pNumber}"/>
					</td>
					<td>
						<c:choose>
							<c:when test="${user.status eq 1}">
								<c:out value="정상회원"/>
							</c:when>
							<c:otherwise>
							<font color="red">
								<c:out value="탈퇴회원"/>
							</font>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${user.status eq 1}">
								<input type="button" value="탈퇴처리" 
									onclick="javascript:userOut('${user.userNo}','${user.status}');"
									class="btn btn-warning"/>
							</c:when>
							<c:otherwise>
								<input type="button" value="회원복귀"
									onclick="javascript:userOut('${user.userNo}','${user.status}');"
									class="btn btn-success"/>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<input type="button" value="영구삭제"
							onclick="javascript:deleteUser('${user.userNo}');" class="btn btn-danger"/>
					</td>
					<td>
						<input type="button" value="패스워드보기" 
							onclick="javascript:password('${user.password}');" class="btn btn-default">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>
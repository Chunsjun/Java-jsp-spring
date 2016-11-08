<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function withdrawMember(memberNo) {
	if (confirm("회원을 탈퇴시키겠습니까??") == true){    //확인
		location.href = "/bytal/withdrawMember/"+memberNo;
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
			<td align="center">
				<table width="50%" height="100%" align="center">
					<tr>
						<td>
							아이디(학번)  |  <c:out value="${member.memberNo}"/>
							<input type="button" value="회원강퇴" class="btn btn-danger" 
							onclick="javascript:withdrawMember('${member.memberNo}')">
							<p>
						</td>
					</tr>
					<tr>
						<td>
							비밀번호  |  <c:out value="${member.password}"/><p>
						</td>
					</tr>
					<tr>
						<td>
							이름  |  <c:out value="${member.memberName}"/><p>
						</td>
					</tr>
					<tr>
						<td>
							전화번호  |  <c:out value="${member.phoneNo}"/><p>
						</td>
					</tr>
					<tr>
						<td>
							이메일  |  <c:out value="${member.email}"/><p>
						</td>
					</tr>
					<tr>
						<td>
							가입날짜  |  <c:out value="${member.joinDate}"/><p>
						</td>
					</tr>
					<tr>
						<td>
							대여상태  |  
							<c:choose> 
								<c:when test="${rent.rentNo ne null}">대여중</c:when> 
								<c:otherwise>대여가능</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td>
							<c:if test="${rent.rentNo ne null}">대여번호  | <c:out value="${rent.rentNo}"/></c:if>
						</td>
					</tr>
					<tr>
						<td>
							<c:if test="${rent.rentNo ne null}">대여 자전거 번호  | <c:out value="${rent.bicycleNo}"/></c:if>
						</td>
					</tr>
					<tr>
						<td>
							<c:if test="${rent.rentNo ne null}">대여시간  | <c:out value="${rent.rentDate}"/></c:if>
						</td>
					</tr>
					
				</table>
				<a href="/bytal/listMember">
					<input type="button" value="목록" class="btn btn-default">
				</a>
			</td>
		</tr>
	</table>
	</div>
</body>
</html>
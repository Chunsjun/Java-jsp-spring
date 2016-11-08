<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
				<h1>회원 목록</h1>
					<table style="width: 70%;" class="table">
						<thead>
							<tr>
								<th width="20%">아이디(학번)</th>
								<th width="20%">이름</th>
								<th width="40%">이메일</th>
								<th width="20%">가입날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${!empty listMember}">
								<c:forEach items="${listMember}" var="member" varStatus="status">
									<tr>
										<td style="text-align: left;">
											<a href="/bytal/viewMember/${member.memberNo}">
												<c:out value="${member.memberNo}" />
											</a>
										</td>
										<td style="text-align: left;">
											<c:out value="${member.memberName}" />
										</td>
										<td style="text-align: left;">
											<c:out value="${member.email}" />
										</td>
										<td style="text-align: left;">
											<c:out value="${member.joinDate}"/>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty listMember}">
								<tr>
									<td style="text-align: center;" colspan="7">목록이 존재하지 않습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
</table>
</div>
</body>
</html>
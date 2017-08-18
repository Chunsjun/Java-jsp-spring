<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function writeBtn(){
		location.href="/write";
	}
</script>
<title>::: ChanBoard :::</title>
</head>
<body>
<div class="container">
<%@include file="/WEB-INF/views/top.jsp"%>
	<table class="table">
		<tr>
			<th width="10%">글번호</th>
			<th width="60%">제목</th>
			<th width="10%">작성자</th>
			<th width="10%">작성일</th>
			<th width="10%">조회수</th>
		</tr>
		<c:if test="${!empty board}">
		<c:forEach items="${board}" var="list" varStatus="status">
		<tr>
			<td>
				<c:out value="${list.bno}"/>
			</td>
			<td>
			<a href="view/${list.bno}">
				<c:out value="${list.title}"/>
			</a>
			</td>
			<td>
				<c:out value="${list.writer}"/>
			</td>
			<td>
				<c:out value="${list.date}"/>
			</td>
			<td>
				<c:out value="${list.viewcnt}"/>
			</td>
		</tr>
		</c:forEach>
		</c:if>
		<c:if test="${empty board}">
			<tr>
				<td style="text-align: center;" colspan="5">목록이 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="5" align="center">
				<input type="button" value="글쓰기" onclick="javascript:writeBtn();" class="btn btn-default"/>
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center">
				<c:out value="${navigator}" escapeXml="false"/>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
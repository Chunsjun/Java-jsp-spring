<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function golist(){
		location.href = "/list";
	}
	function deleteboard(bno){
		location.href = "/delete/"+bno;
	}
	function updateboard(bno){
		location.href = "/update/"+bno;
	}
</script>
<title>::: ChanBoard :::</title>
</head>
<body>
<div class="container">
<%@include file="/WEB-INF/views/top.jsp"%>
	<table class="table">
		<tr>
			<th>글번호</th>
			<td><c:out value="${view.bno}"/></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><c:out value="${view.title}"/></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><c:out value="${view.writer}"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><c:out value="${view.content}"/></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><c:out value="${view.date}"/></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><c:out value="${view.viewcnt}"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="목록" onclick="javascript:golist();"  class="btn btn-default">
				<input type="button" value="수정" onclick="javascript:updateboard('${view.bno}');"  class="btn btn-default">
				<input type="button" value="삭제" onclick="javascript:deleteboard('${view.bno}');"  class="btn btn-default">
			</td>
		</tr>
	</table>
</div>
</body>
</html>
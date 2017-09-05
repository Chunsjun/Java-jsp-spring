<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function cancelBtn(bno){
		if (confirm("정말 취소하시겠습니까??") == true){
			location.href = "/view/"+bno;
		} else {
		    return;
		}
	}
</script>
<title>::: ChanBoard :::</title>
</head>
<body>
<div class="container">
<%@include file="/WEB-INF/views/top.jsp"%>
<form action="/update" method="post">
<table class="table">
		<tr hidden="hidden">
			<th>글번호</th>
			<td>
				<input type="text" name="bno" value="<c:out value="${view.bno}"/>" readonly="readonly">
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="title" class="form-control" value="<c:out value="${view.title}"/>">
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
			<c:out value="${view.writer}"/>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
			<textarea rows="10" cols="30" name="content" class="form-control"><c:out value="${view.content}"/></textarea>
			</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><fmt:formatDate value="${view.date}" pattern="yyyy.MM.dd (kk:mm:ss)"/></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><c:out value="${view.viewcnt}"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" id="sbtn" value="완료" class="btn btn-default"/>
				<input type="button" id="cbtn" onclick="cancelBtn(${view.bno});" value="취소" class="btn btn-default"/>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>
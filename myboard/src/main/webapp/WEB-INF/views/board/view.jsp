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
		if (confirm("정말 삭제하시겠습니까??") == true){
			location.href = "/delete/"+bno;
		} else {
		    return;
		}
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
			<th>조회수</th>
			<td><c:out value="${view.viewcnt}"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td style="height: 200px;"><c:out value="${view.content}" escapeXml="false"/><br></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><fmt:formatDate value="${view.date}" pattern="yyyy.MM.dd (kk:mm:ss)"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="목록" onclick="javascript:golist();"  class="btn btn-default">
				<c:if test="${(sessionScope.user.uno eq view.uno) || (sessionScope.user.uno eq 0)}">
				<input type="button" value="수정" onclick="javascript:updateboard('${view.bno}');"  class="btn btn-default">
				<input type="button" value="삭제" onclick="javascript:deleteboard('${view.bno}');"  class="btn btn-default">
				</c:if>
			</td>
		</tr>
		<c:if test="${!empty sessionScope.user}">
		<tr align="center">
			<td colspan="2">
			<form action="/reviewW" method="post" id="reviewForm">
				<table style="width: 100%">
					<tr>
						<td width="10%;">
							댓글
						</td>
						<td>
							<input type="text" class="form-control" name="content" required="required">
							<input type="text" name="bno" hidden="hidden" value="<c:out value='${view.bno}'/>">
						</td>
						<td width="10%;" align="center">
							<input type="submit" value="답글달기" class="btn btn-default">
						</td>
					</tr>
				</table>
			</form>
			</td>
		</tr>
		</c:if>
		<tr>
			<td colspan="2">
				<table border="1" style="width: 100%">
					<c:forEach items="${rList}" var="review" varStatus="status">
					<tr>
						<td>
							<c:out value="${review.writer}"/>
						</td>
						<td>
							<c:out value="${review.content}"/>
						</td>
						<td>
							<fmt:formatDate value="${review.date}" pattern="yyyy.MM.dd (kk:mm:ss)"/>
						</td>
					</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
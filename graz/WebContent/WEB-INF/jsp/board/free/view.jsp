<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	function backList() {
		history.back();
	}
	function update(boardNo) {
		location.href = "/graz/board/free/update/"+boardNo;
	}
	function boardDelete(boardNo) {
		if (confirm("정말 삭제하시겠습니까??") == true){
			location.href = "/graz/board/free/delete/"+boardNo;
		} else {
		    return;
		}
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FreeBoardView</title>
</head>
<body>
<div class="container">
	<table height="100%" width="100%">
		<tr>
			<td colspan="2">
				<%@include file="/WEB-INF/jsp/main/top.jsp"%>
			</td>
		</tr>
		<tr>
			<td width="20%" align="center">
				<%@include file="/WEB-INF/jsp/board/left.jsp"%>
			</td>
			<td align="center" style="padding:30px">
				<h1>자유 게시판</h1>
				<form name="writeBoard" action="/graz/board/free/write" method="post" >
				<table width="70%" height="50%" align="center" class="table">
					<thead>
						<tr>
							<th width="20%" height="10%" align="left">
								제목 |
							</th>
							<td>
								<c:out value="${board.title}"/>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th width="20%" height="10%" align="left">
								작성자 |
							</th>
							<td>
								<c:out value="${board.writer}"/>
							</td>
						</tr>
						<tr>
							<th width="20%" height="10%" align="left">
								작성시간 |
							</th>
							<td>
								<c:out value="${board.date}"/>
							</td>
						</tr>
						<tr>
							<th width="20%" height="10%" align="left">
								조회수 |
							</th>
							<td>
								<c:out value="${board.view}"/>
							</td>
						</tr>
						<tr>
							<th width="20%" height="10%" align="left">
								내용 |
							</th>
							<td  colspan="2" height="70%">
								<c:out value="${board.content}" escapeXml="false"/>
							</td>
						</tr>
						<tr>
							<td align="center" colspan="2">
								<c:if test="${(sessionScope.user.name eq board.writer) || (sessionScope.user.userNo eq 0)}">
									<input type="button" value="수정" onclick="javascript:update('${board.boardNo}');" class="btn btn-default">
									<input type="button" value="삭제" onclick="javascript:boardDelete('${board.boardNo}');" class="btn btn-default">
								</c:if>
									<input type="button" value="목록" onclick="javascript:backList();" class="btn btn-default">
							</td>
						</tr>
					</tbody>
				</table>
				</form>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
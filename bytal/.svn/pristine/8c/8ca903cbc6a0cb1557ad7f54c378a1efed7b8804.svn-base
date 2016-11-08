<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

	function deleteCheck(){
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		    location.href = "/bytal/board/complain/deleteBoard/${board.boardNo}";
		} else {   //취소
		    return;
		}
	}

</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<script src="/bootstrap/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::Bytal Web:::</title>
</head>
<body>
	<div class="container">
		<table border="0" width="100%" height="500">
			<tr height="20%">
				<td colspan="2">
					<%@include file="/WEB-INF/jsp/web/main/top.jsp"%>
				</td>
			</tr>
			<tr>
				<td width="20%" valign="top">
					<%@include file="/WEB-INF/jsp/web/board/left.jsp"%>
				</td>
				<td align="center" style="padding:30px">
				<h1>민원 게시판</h1>
					<table border="0" width="70%" height="50%" align="center" class="table">
						<tr>
							<td colspan="2" height="20%">
								<h4>제목 &nbsp; |  &nbsp;<c:out value="${board.title}"/></h4> 
							</td>
						</tr>
						<tr>
							<td align="left">
								작성자 &nbsp; |  &nbsp;<c:out value="${board.writer}"/>
							</td>
							<td align="right">
								작성시간 &nbsp; |  &nbsp;<c:out value="${board.writeDate}"/>&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="2" height="70%">
								<c:out value="${board.content}"/>
							</td>
						</tr>
					</table>
					<input type="button" value="목록" class="btn" onclick="javascript:history.back(-1)">
					<c:if test="${(board.writer eq sessionScope.memberNo) || (sessionScope.memberNo eq 'admin')}">
						<a href="/bytal/board/complain/editBoard/${board.boardNo}">
							<input type="button" value="수정" class="btn btn-success">
						</a>
					</c:if>
					<c:if test="${(board.writer eq sessionScope.memberNo) || (sessionScope.memberNo eq 'admin')}">
						<input type="button" value="삭제" onclick="javascript:deleteCheck();" class="btn btn-danger">
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
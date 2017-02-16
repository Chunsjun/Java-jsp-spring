<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	function formCheck() {
		var form = document.updateBoard;
		
		if((form.title.value.trim() == "") || (form.title.value == null)) {
			alert("제목을 적어주세요");
			form.title.focus(); 
			return;
		}
		
		if((form.content.value.trim() == "") || (form.content.value == null)) {  
			alert("내용을 적어주세요");  
			form.content.focus();  
			return;
		}
		if (confirm("수정하시겠습니까 ??") == true){
			form.submit();
		} else {
		    return;
		}
	}
	
	function cancelCheck(){
		if (confirm("정말 취소하시겠습니까??") == true){
		    history.back(-1);
		} else {
		    return;
		}
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FreeBoardUpdate</title>
</head>
<body>
<div class="container">
	<table height="100%" width="100%" border="0">
		<tr>
			<td colspan="2">
				<%@include file="/WEB-INF/jsp/main/top.jsp"%>
			</td>
		</tr>
		<tr>
			<td align="center">
				<h1>자유 게시판</h1>
				<form name="updateBoard" action="/graz/board/free/update/${board.boardNo}" method="post" >
				<table width="70%" height="50%" align="center" class="table">
					<thead>
						<tr>
							<th width="20%" height="10%" align="left">
								제목 |
							</th>
							<td>
								<input type="text" name="title" value="<c:out value='${board.title}'/>" class="form-control">
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
								내용 |
							</th>
							<td  colspan="2" height="70%">
								<textarea rows="15" cols="70" name="content" class="form-control"><c:out value="${board.content}"/></textarea>
							</td>
						</tr>
						<tr>
							<td align="center" colspan="2">
								<input type="button" value="수정" onclick="javascript:formCheck();" class="btn btn-default">
								<input type="button" value="취소" onclick="javascript:cancelCheck();" class="btn btn-default">
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
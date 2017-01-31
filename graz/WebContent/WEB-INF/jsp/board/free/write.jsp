<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	function formCheck() {
		var form = document.writeBoard;
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
		
		form.submit();
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
<title>FreeBoardWrite</title>
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
								<input type="text" name="title" size="50" maxlength="33" 
									onkeyPress="if (event.keyCode==13){return false;}" class="form-control">
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th width="20%" height="10%" align="left">
								작성자 |
							</th>
							<td>
								<c:out value="${sessionScope.user.name}"/>
							</td>
						</tr>
						<tr>
							<th width="20%" height="10%" align="left">
								내용 |
							</th>
							<td>
								<textarea rows="15" cols="70" name="content" class="form-control"></textarea>
							</td>
						</tr>
						<tr>
							<td align="center" colspan="2">
								<input type="button" value="글쓰기" onclick="javascript:formCheck();" class="btn btn-default">
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
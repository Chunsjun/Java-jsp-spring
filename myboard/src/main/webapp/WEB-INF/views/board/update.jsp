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
			/* location.href = "/view/"+bno; */
			history.back();
		} else {
		    return;
		}
	}
	
	function lengthCheck(obj){
		var str = obj.value;
		var str_length = str.length;
		document.getElementById('lengthInfo').innerText = str_length + " / 1000";
	}
	
	function writeBtn(){
		var title_str = document.getElementById('title').value;
		var content_str = document.getElementById('content').value;
		var subForm = document.getElementById('writeForm');
		
		if(title_str.length > 20 || title_str.trim() == ""){
			alert('제목은 공백이나 20자를 넘길수 없습니다 !!');
		}else if(content_str.length > 1000 || content_str.trim() == ""){
			alert('내용은 공백이나 1000자를 넘길수 없습니다 !!');
		}else{
			subForm.submit();
		}
	}
</script>
<title>::: ChanBoard :::</title>
</head>
<body>
<div class="container">
<%@include file="/WEB-INF/views/top.jsp"%>
<form action="/update" method="post" id="writeForm">
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
				<input type="text" id="title" name="title" class="form-control" value="<c:out value="${view.title}"/>" maxlength="20">
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
			<textarea oninput="javascript:lengthCheck(this);" rows="10" cols="30" id="content" name="content" class="form-control" maxlength="1000"><c:out value="${view.content}"/></textarea>
			<label id="lengthInfo"></label>
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
				<input type="button" onclick="writeBtn();" id="sbtn" value="완료" class="btn btn-default"/>
				<input type="button" id="cbtn" onclick="cancelBtn(${view.bno});" value="취소" class="btn btn-default"/>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>
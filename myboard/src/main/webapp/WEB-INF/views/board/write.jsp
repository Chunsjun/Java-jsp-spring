<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/etc/scripts.jsp"%>
<script type="text/javascript">
	function golist(){
		/* location.href = "/list"; */
		history.back();
	}
	
	function lengthCheck(obj){
		var str = obj.value;
		var strLength = str.length;
		document.getElementById('lengthInfo').innerText = strLength + " / 1000";
	}
	
	function writeBtn(){
		var titleStr = document.getElementById('title').value;
		var contentStr = document.getElementById('content').value;
		var subForm = document.writeForm;
		
		if(titleStr.length > 20 || titleStr.trim() == ""){
			alert('제목은 공백이나 20자를 넘길수 없습니다 !!');
		}else if(contentStr.length > 1000 || contentStr.trim() == ""){
			alert('내용은 공백이나 1000자를 넘길수 없습니다 !!');
		}else{
			subForm.submit();
		}
	}

	function fileCheck(fileObj) {
		var filePath = fileObj.value;
		var fileName = filePath.substring(filePath.lastIndexOf("\\") + 1);
		var fileKind = fileName.split(".")[1];
		if (fileKind != "jpg" && fileKind != "JPG" && fileKind != "gif"
				&& fileKind != "png" && fileKind != "jpeg") {
			alert("jpg, gif, png, jpeg 확장자를 가진 이미지 파일만 올려주세요.");
			document.getElementById("imgInp").value = "";
			document.getElementById("imgInp").select();
			document.selection.clear();
		}
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::: ChanBoard :::</title>
</head>
<body>
<!-- enctype="multipart/form-data"을 폼에 정의했을경우 action으로 전해지는 데이터가 request에 담기지 않는다. 대신 MultipartRequest 메소드를 사용하여 데이터 수신. -->
<div class="container">
<%@include file="/WEB-INF/views/etc/top.jsp"%>
<form name="writeForm" action="/write" method="post" enctype="multipart/form-data" >
	<table class="table">
		<tr>
			<th>제목</th>
			<td><input type="text" id="title" name="title" class="form-control" placeholder="최대 20자" maxlength="20" onkeyPress="if (event.keyCode==13){return false;}"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea oninput="javascript:lengthCheck(this);" rows="10" cols="30" id="content" name="content" class="form-control" placeholder="최대  1000자" maxlength="1000"></textarea>
			<label id="lengthInfo"></label>
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><c:out value="${sessionScope.user.name}"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="file" name="file" id="imgInp" accept="image/*" onchange="fileCheck(this)">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="글쓰기" onclick="javascript:writeBtn();" class="btn btn-default">
				<input type="button" value="목록" onclick="javascript:golist();" class="btn btn-default"/>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>
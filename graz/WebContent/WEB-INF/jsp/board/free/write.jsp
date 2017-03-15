<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
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
	
	$(function() {
        $("#imgInp").on('change', function(){
            readURL(this);
        });
    });
    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
                $('#blah').attr('src', e.target.result);
            }
          reader.readAsDataURL(input.files[0]);
        }
    }
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FreeBoardWrite</title>
</head>
<body>
<div class="container">
	<table>
		<tr>
			<td colspan="2">
				<%@include file="/WEB-INF/jsp/main/top.jsp"%>
			</td>
		</tr>
		<tr>
			<td align="center">
				<h1>자유 게시판</h1>
<!-- enctype="multipart/form-data"을 폼에 정의했을경우 action으로 전해지는 데이터가 request에 담기지 않는다. 대신 MultipartRequest 메소드를 사용하여 데이터 수신. -->
				<form name="writeBoard" action="/graz/board/free/write" method="post" enctype="multipart/form-data">
				<table class="table">
					<thead>
						<tr>
							<th width="20%" height="10%" align="left">
								제목 |
							</th>
							<td>
								<input type="text" name="title" placeholder="(최대 50자)" size="50" maxlength="50" 
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
								<textarea rows="15" name="content" class="form-control" placeholder="(최대500자)"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="file" name="file" id="imgInp">
								<img id="blah" src="#" alt="" height="auto" width="100%"/>
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
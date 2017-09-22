<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/etc/scripts.jsp"%>
<script type="text/javascript">
	$(function(){
		$('#userOutBtn').click(function(){
			if (confirm("정말 탈퇴하시겠습니까??") == true){
				var uno = <c:out value='${user.uno}'/>
				$(location).attr('href','/userout/'+uno);
			}else{
				return;
			}
		})
	})
</script>
<title>::: ChanBoard :::</title>
</head>
<body>
<div class="container" align="center">
	<%@include file="/WEB-INF/views/etc/top.jsp"%>
	<div class="page-header">
		<h1><c:out value="${user.name}"/> 님의 정보</h1>
	</div>
	<div class="lead">
		<label>아이디 : </label>
		<c:out value="${user.id}"/>
	</div>
	<div class="lead">
		<label>가입일 : </label>
		<fmt:formatDate value="${user.date}" pattern="yyyy.MM.dd (kk:mm:ss)"/>
	</div>
	<div class="form-group text-center">
		<input type="button" value="회원탈퇴" class="btn btn-danger" id="userOutBtn">
	</div>
</div>
</body>
</html>
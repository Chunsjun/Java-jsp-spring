<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/etc/scripts.jsp"%>
<script type="text/javascript">
	<c:out value="${joinCplt}" escapeXml="false"/>
	$(function(){
		/* 쿠키확인 */
		var logInfo = $.cookie('logInfo');
		/* 쿠키가 있으면 */
		if(logInfo != null){
			/* 아이디 세팅 */
			$('#id').val(logInfo);
			/* 체크박스 체크 */
			$('#rmemChkBox').prop("checked",true);
		}
		/* 로그인 버튼 눌렀을때 */
		$('#loginBtn').click(function(){
			/* 체크박스가 체크되있다면 */
			if($('#rmemChkBox').prop('checked')){
				/* 쿠키로 7일간 저장한다 */
				$.cookie('logInfo',$('#id').val(),{expires : 7});
				/* 체크박스가 체크되있지 않다면 */
			}else{
				/* 쿠키가 있건없건 삭제 */
				$.removeCookie('logInfo');
			}
		})
	})
</script>
<title>::: ChanBoard :::</title>
</head>
<body>
<div class="container">
<%@include file="/WEB-INF/views/etc/top.jsp"%>
	<div class="page-header">
		<h2 class="form-signin-heading">로그인</h2>
	</div>
	<div class="col-md-6 col-md-offset-3">
		<form action="/login" method="post" class="form-signin" role="form">
		<div class="form-group">
			<label for="id">이메일 주소</label>
			<input type="email" id="id" name="id" class="form-control" placeholder="Email" required autofocus>
		</div>
		<div class="form-group">
			<label for="pw">비밀번호</label>
			<input type="password" id="pw" name="pw" class="form-control" placeholder="Password" required>
		</div>
		<div class="checkbox">
          <label>
            <input type="checkbox" id="rmemChkBox">이메일 기억하기
          </label>
        </div>
		<div class="form-group text-center">
			<button type="submit" id="loginBtn" class="btn btn-lg btn-primary btn-block">로그인</button>
		</div>
		</form>
	</div>
</div>
</body>
</html>
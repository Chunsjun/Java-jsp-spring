<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<script src="/bootstrap/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function doClose() {
		window.opener.getCheckId(checkIdForm.memberNo.value);
        window.close();
	}
	
	function noSpaceForm(obj) { // 공백사용못하게
	    var str_space = /\s/;  // 공백체크
	    if(str_space.exec(obj.value)) { //공백 체크
	        alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
	        obj.focus();
	        obj.value = obj.value.replace(' ',''); // 공백제거
	        return false;
	    }
	 // onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"
	}
	
	function spaceCheck() {
		var form = document.checkIdForm;
		if(form.memberNo.value == "") {
			alert("아이디를 입력하세요");
			form.memberNo.focus();
			return;
		}
		form.submit();
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>:::Bytal Web:::</title>
</head>
<body>
<div class="container">
	<form action="/bytal/checkId" method="post" name="checkIdForm">
		아이디(학번)  <input type="text" name="memberNo" value="<%=request.getParameter("memberNo") %>" size="15" maxlength="10" onkeyup="noSpaceForm(this);">
		<input type="button" value="중복확인" class="btn" onclick="javascript:spaceCheck();"><br>
		<c:out value="${resultCheckId}"/>
		<c:if test="${fn:contains(resultCheckId, '가능')}">
			<input type="button" value="아이디 선택" onclick="javascript:doClose();" class="btn btn-success">
		</c:if>
	</form>
</div>
</body>
</html>
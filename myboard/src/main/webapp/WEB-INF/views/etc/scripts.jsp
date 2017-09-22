<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<script src="/resources/bootstrap/js/jquery.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/bootstrap/js/jquery.cookie.js"></script>
<script type="text/javascript">
	<c:out value="${alert}" escapeXml="false"/>
	$(function(){
		$('#logout').click(function(){
			if (confirm("로그아웃 하시겠습니까??") == true){
				$(location).attr('href','/logout');
				}else{return;}
		})
	});
</script>
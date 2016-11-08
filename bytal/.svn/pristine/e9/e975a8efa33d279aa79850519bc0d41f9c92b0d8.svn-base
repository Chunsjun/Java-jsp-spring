<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function formCheck() {
		var form = document.addBicycleForm;
		
		form.submit();
	}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<script src="/bootstrap/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<title>:::Bytal Web:::</title>
</head>
<body>
	<div class="container">
		<table width="100%" height="100%" class="table">
			<tr height="20%">
				<td colspan="2">
					<%@include file="/WEB-INF/jsp/web/main/top.jsp"%>
				</td>
			</tr>
			<tr>
				<td width="20%">
					<%@include file="/WEB-INF/jsp/web/bicycle/left.jsp"%>
				</td>
				<td>
				<h1>자전거 등록</h1>
					<form name="addBicycleForm" action="/bytal/bicycle/addBicycle" method="post">
						<table  width="70%" height="50%" align="center" class="table">
							
							<tr>
								<td width="20%" align="left" style="border:0;  text-align: center;" >
									<h3>종      류 :</h3>
								</td>
								<td align="left" style="border:0; font-size: xx-large;">
									<select name="bicycleType">
										<option value="1" selected="selected" >일반</option>
										<option value="2">커플</option>
										<option value="3">고급</option>
									</select>
								</td>
							</tr>
							<tr>
								<td width="20%" align="left" style="border:0; text-align: center;">
									<h3>대여 비용<br>(10분)</h3>
								</td>
								<td style="border: 0; font-size: xx-large;">
									<select name="cost">
										<option value="250" selected="selected" >일반 요금(250원)</option>
										<option value="350">커플 요금(350원)</option>
										<option value="450">고급 요금(450원)</option>
									</select>
								</td>
							</tr>
							<tr>
								<td width="20%" align="left" style="border:0;  text-align: center;">
									<h3>상       태 :</h3>
								</td>
								<td style="border: 0; font-size: xx-large;">
									<select name="bicycleStatus" >
										<option value="1" selected="selected" >대여 가능</option>
										<option value="2">대여 중</option>
										<option value="3">수리 중</option>
									</select>
								</td>
							</tr>
							<tr>
								<td width="20%" align="left" style="border:0;  text-align: center;">
									<h3>대여소 지정</h3>
								</td>
								<td style="border: 0;font-size: xx-large;">
									<select name="cradleNo">
										<option value="1" selected="selected" >1대여소</option>
										<option value="2">2대여소</option>
										
									</select>
								</td>
							</tr>
							<tr>
								<td style="border: 0;  text-align: center;" colspan="2" align="center">
									<input type="button" value="등록" onclick="javascript:formCheck();" class="btn btn-success">
									<input type="button" value="취소" onclick="javascript:history.back(-1)"  class="btn btn-danger">
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
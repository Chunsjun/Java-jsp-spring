<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<script src="/bootstrap/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<title>:::Bytal device:::</title>
</head>
<body>
	<div class="container">
		<table  width="100%" height="100%">
			<tr height="20%">
				<td>
					<%@include file="returnTop.jsp"%>
					<h3>자전거 반납</h3>
					<hr>
				</td>
			</tr>
			<tr>
				<td align="center">
					<table width="100%" height="50%" style="text-align: center;">
						<tr>
							<td>
								<h1>회원번호를 입력해 주세요.</h1><br/>
							</td>
						</tr>
						<tr>
							<td>
								<form action="/return/returnBicycleForm" method="post">
									<table border="1" width="100%" height="50%" align="center">
										<tr>
											<td width="40%" height="70%" align="right" style="border: 0">
												<h1>회원 번호 :</h1>
											</td>
											<td style="border: 0"><input type="text" name="memberNo"
												size="12" maxlength="130" 
												style="width: 80%; min-height: 80%;
												font-size: xx-large;">
											</td>
										</tr>		
										<tr>	
											<td colspan="2" style="border: 0">
												<c:if test="${rentAlert== '1'}">
													<h3 style="color: red;">대여 이력이 없습니다.</h3>
												</c:if> 
												<br><br/>
												<input TYPE="submit" style="width: 200px; height: 100px; 
												font-size: xx-large;" name="Submit" value="로그인" class="btn btn-success">
												<br><br/>
											</td>
										</tr>
									</table>
								</form>
							</td>
						</tr>
						<tr>
							<td>
								<a href="/return/main"> 
								<br><br>
									<input TYPE="button" style="width: 400px; height: 100px; font-size: xx-large;"
									name="Submit" value=" 메인 페이지로 이동 " class="btn btn-warning">
								</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
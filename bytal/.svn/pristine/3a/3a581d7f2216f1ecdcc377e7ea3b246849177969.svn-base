<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ page import="java.sql.Date"  %>

<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String today = formatter.format(new java.util.Date());
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<script src="/bootstrap/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<title>:::Bytal device:::</title>
<script type="text/javascript">


function popupOpen(popHeight,popWidth){

	var winHeight = document.body.clientHeight; // 현재창의 높이
	var winWidth = document.body.clientWidth; // 현재창의 너비
	var winX = window.screenX || window.screenLeft || 0;// 현재창의 x좌표 
	var winY = window.screenY || window.screenTop || 0; // 현재창의 y좌표 


	var popX = winX + (winWidth - popWidth)/2;
	var popY = winY + (winHeight - popHeight)/2;
	
    window.open("/return/returnPopUp","popup","width="+popWidth+"px,height="+popHeight+"px,top="+popY+",left="+popX);

}
</script>
</head>
<body>
	<div class="container">
		<table width="100%" height="100%">
			<tr height="20%">
				<td>
					<%@include file="returnTop.jsp"%>
					<h3>대여 정보 확인</h3>
					<hr>
				</td>
			</tr>
			<tr>
				<td align="center">
					<table width="100%" height="50%" style="text-align: center;">
						<tr>
							<td>
								<h1>반납 정보를 확인해주세요.</h1>
							</td>
						</tr>
						<tr>
							<td>	
								<form id="form" name="form" action="<c:url value="/return/deleteRecode" />" method="post">
									<table border="5" width="100%" height="50%" align="center" style="border-style: hidden;">
										<tr>
											<td width="30%" height="70%" align="right"
												style="border: 0; font-size: 80%; text-align: center;">
												<h1>대여 번호 :</h1>
											</td>
											<td style="border: 0">
												<input type="text" readonly onfocus="this.blur();" name="rentNo" 
													value="${rentNo}"size="12" maxlength="130" style="width: 80%; 
													min-height: 80%; font-size: xx-large;">
											</td>
										</tr>
										<tr>
											<td width="30%" height="70%" align="right" style="border: 0; font-size: 80%; text-align: center;">
												<h1>회원 번호 :</h1>
											</td>
											<td style="border: 0">
												<input type="text" readonly onfocus="this.blur();" name="memberNo" 
													value="${memberNo}" size="12" maxlength="130"
													style="width: 80%; min-height: 80%; font-size: xx-large;">
											</td>
										</tr>
										<tr>
											<td align="right" style="border: 0; font-size: 80%; text-align: center;">
												<h1>자전거 종류 :</h1>
											</td>
											<td style="border: 0">
												<c:if test="${bicycleType=='1'}">
													<input type="text" onfocus="this.blur();" readonly name="bicycleType" 
														value="일반 자전거" size="13" maxlength="12"
														style="width: 80%; min-height: 80%; font-size: xx-large;">
												</c:if> 
												<c:if test="${bicycleType=='2'}">
													<input type="text" onfocus="this.blur();" readonly name="bicycleType" 
														value=" 커플 자전거" size="13" maxlength="12"
														style="width: 80%; min-height: 80%; font-size: xx-large;">
												</c:if> 
												<c:if test="${bicycleType=='3'}">
													<input type="text" onfocus="this.blur();" readonly name="bicycleType" 
														value="고급 자전거" size="13" maxlength="12"
														style="width: 80%; min-height: 80%; font-size: xx-large;">
												</c:if>
											</td>
										</tr>
										<tr>
											<td align="right" style="border: 0; font-size: 80%; text-align: center;">
												<h1>자전거 번호 :</h1>
											</td>
											<td style="border: 0">
												<input type="text" onfocus="this.blur();" readonly name="bicycleNo"
													value="${bicycleNo}" size="13" maxlength="12"
													style="width: 80%; min-height: 80%; font-size: xx-large;">
											</td>
										</tr>
										<tr>
											<td align="right" style="border: 0; font-size: 80%; text-align: center;">
											<h1>대여 일시 :</h1>
											</td>
											<td style="border: 0">
												<input type="text" readonly readonly onfocus="this.blur();" name="rentDate" 
													size="13" maxlength="12" value="${rentDate}"
													style="width: 80%; min-height: 80%; font-size: xx-large;">
											</td>
										</tr>
										<tr>
											<td align="right" style="border: 0; font-size: 80%; text-align: center;">
											<h1>반납 일시:</h1>
											</td>
											<td style="border: 0">
												<input type="text" id="tDate" readonly onfocus="this.blur();" name="returnDate" 
													size="13" maxlength="12" value="<%=today%>"
													style="width: 80%; min-height: 80%; font-size: xx-large;">
											</td>
										</tr>
										<tr>
											<td align="right" style="border: 0; font-size: 80%; text-align: center;">
											<h1>대여 장소 :</h1>
											</td >
											<td style="border: 0">
											<c:if test="${cradleNo=='1'}">
													<input type="text" readonly onfocus="this.blur();" name="cradleNo" 
														value="선문대학교 기숙사" size="13" maxlength="12"
														style="width: 80%; min-height: 80%; font-size: xx-large;">
											</c:if>
											<c:if test="${cradleNo=='2'}">
												<input type="text" readonly onfocus="this.blur();" name="cradleNo" 
													value="선문대학교 본관" size="13"maxlength="12"
													style="width: 80%; min-height: 80%; font-size: xx-large;">
											</c:if>
										</td>
									</tr>									
									<tr>
										<td colspan="2" style="border: 0">
											<input TYPE="submit" style="width: 200px; height: 80px; font-size: xx-large;"
												name="Submit" value=" 반 납 "class="btn btn-danger" onclick="popupOpen(100,300)">
											<br><br>  
										</td>	
									</tr>
								</table>
							</form>
						</td>
					</tr>
					<tr>
						<td>
							<a href="/return/main"> 
								<input TYPE="button" style="width: 400px; height: 80px; font-size: xx-large;"
								name="Submit" value=" 메인 페이지로 이동 " 
								class="btn btn-warning">
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
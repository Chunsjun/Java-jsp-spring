<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<script src="/bootstrap/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<title>:::Bytal device:::</title>
</head>
<script type="text/javascript">


function popupOpen(popHeight,popWidth){

	var winHeight = document.body.clientHeight; // 현재창의 높이
	var winWidth = document.body.clientWidth; // 현재창의 너비
	var winX = window.screenX || window.screenLeft || 0;// 현재창의 x좌표 
	var winY = window.screenY || window.screenTop || 0; // 현재창의 y좌표 


	var popX = winX + (winWidth - popWidth)/2;
	var popY = winY + (winHeight - popHeight)/2;
	
    window.open("/rent/selectPopUp","popup","width="+popWidth+"px,height="+popHeight+"px,top="+popY+",left="+popX);

}
</script>

<BODY style="background-color: whitesilver;">
	<div class="container">
		<table width="100%" height="10px" style="text-align: center;">
			<tr height="10%">
				<td><%@include file="rentTop.jsp"%>
					<div style="text-align: left;">
						<h3>자전거 대여</h3>
					</div>
					<hr>
				</td>
			</tr>
			<tr>
				<td>
					<table style="width: 80%; height: 20px;" align=center>
						<tr>
							<td>
								<h3 style="text-align: right;">
									회원 번호 :	<c:out value="${memberNo}" />
								</h3>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>					
					<table align=center width="80%" style="text-align: center;">
						<tr>
							<td>
							<form name="listBicycle" action="/rent/selectBicycle" method="post">
								<table align="center">
									<tr>
										<td>
											<button type="submit" name="bicycleType" value="1" class="btn btn-warning btn=lg"
											style="width: 100px; height: 60px; font-size: xx-large;">
												일 반
											</button>

											<button type="submit" name="bicycleType" value="2" class="btn btn-danger btn=lg"
											style="width: 100px; height: 60px; font-size: xx-large;">
												커 플
											</button>

											<button type="submit" name="bicycleType" value="3" class="btn btn-info btn=lg"
											style="width: 100px; height: 60px; font-size: xx-large;">
												고 급 
											</button>
										</td>
									</tr>
								</table>
							</form>
						</td>
					</tr>	
					<tr>
						<td>
							<div style="width: 100%; height: 265px; border-style:double; overflow: auto;">
								<form name="rentCommit" action="/rent/commitRentForm" method="post">
								<table style="width: 100%; font-size: large; text-align: center;" border="1" align=center > 
									<thead>
										<tr style="text-align: middle;">
											<th style="width: 40%; text-align: center;">자전거 번호</th>
											<th style="width: 30%; text-align: center;">비용(10분 당)</th>
											<th style="width: 10%; text-align: center;">위치</th>
											<th style="width: 15%; text-align: center;">대여 가능 상태</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${!empty listBicycle}">
											<c:forEach items="${listBicycle}" var="bicycle" varStatus="status">
												<tr>
													<td style="text-align: center;">
														<c:if test="${bicycle.bicycleType=='1'}">
															<c:out value="일반 ${bicycle.bicycleNo}" />
														</c:if> 
														<c:if test="${bicycle.bicycleType=='2'}">
															<c:out value="커플 ${bicycle.bicycleNo}" />
														</c:if> 
														<c:if test="${bicycle.bicycleType=='3'}">
															<c:out value="고급 ${bicycle.bicycleNo}" />
														</c:if>
													</td>
													<td align=center><c:out value="${bicycle.cost} 원" /></td>
													<td align=center>
														<c:if test="${bicycle.cradleNo=='1'}">
															<c:out value="선문대 기숙사" />
														</c:if> 
														<c:if test="${bicycle.cradleNo=='2'}">
															<c:out value="선문대 본관" />
														</c:if>
													</td>
													<td style="text-align: left; border-bottom: thick;">
														<c:if test="${bicycle.bicycleStatus=='1'}">
															<button type="submit" name="bicycleNo" value="${bicycle.bicycleNo}" 
															class="btn btn-primary btn=lg" 
															style="width: 150px; height: 40px; font-size: large;" >
																대 여
															</button>
														</c:if> 														
													</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty listBicycle}">
											<tr>
												<td style="text-align: center; border-bottom-style: hidden;" colspan="7">
																<h1>대여 가능한 자전거가 없습니다.</h1>
												</td>
											</tr>
										</c:if>	
									</tbody>
								</table>
							</form>	
						</div>						
					</table>
				</table>
				<table align="center" height="10%" style="text-align: center;">				
					<tr >
						<td colspan="4" align=center>
							<h2 align=center>- 안 내 -</h2>
						</td>
					</tr>
					<tr>
						<td>
							<img src="/image/rent.png" style="text-align: right;" />
						<td>
						<td>
							<h2 align=center> 를 클릭하십시오.</h2>
						</td>				
					</tr>	
				</table>
				<table align="center" height="100%">						
					<tr>							
						<td>
							<br><br>
							<a href="/rent/logout"> 
								<input TYPE="submit" class="btn btn-warning btn=lg #777" 
									style="width: 400px; height: 80px; font-size: xx-large;" 
									name="Submit" value="  메인 페이지로  이동 " align="middle">
							</a>								
						</td>				
					</tr>
			</table>
		</div>
	</body>
</html>
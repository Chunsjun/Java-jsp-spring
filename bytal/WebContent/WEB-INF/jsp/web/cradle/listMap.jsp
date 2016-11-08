<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>:::Bytal Web:::</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<script src="/bootstrap/js/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function remove(cradleNo){
		var no = cradleNo;
		var check = confirm("정말 	삭제하시겠습니까?");
		if(check == true){
			location.href = "/bytal/cradleDelete/"+no;
		}else{
			return;
		}
	}
	
	function option(test){
		if(test == 'Y'){
			location.href = "/bytal/listMap"+test;
		}else{
			location.href = "/bytal/listMap"+test;
		}
	}
</script>
</head>
<body>
<div class="container">
	<table width="100%" height="100%">
		<tr height="20%">
			<td colspan="2">
				<%@include file="/WEB-INF/jsp/web/main/top.jsp"%>
			</td>
		</tr>
		<tr>
			<td width="20%" valign="top">
				<%@include file="left.jsp"%>
			</td>
			<td align="center">
				<h1>대여소 목록</h1><hr>
			<table style="width: 70%;" class="table table-hover">
				<thead>
					<tr>
						<th>대여소 번호</th>
						<th>대여소 이름</th>
						<th>
							대여소 상태
							<select name="status">
								<option onclick="option('Y')" id="optionA">이용가능</option>
								<option onclick="option('N')" id="optionB">이용불가</option>
							</select>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty listMap}">
						<c:forEach items="${listMap}" var="map" varStatus="status">
							<tr>
								<td>
									<c:out value="${map.cradleNo}" />
								</td>
								<td>
									<c:out value="${map.cradleName}" />
								</td>
								<td>
									<c:choose>
										<c:when test="${map.cradleStatus eq 'Y'}">
											<font color="green" style="font-weight: bold;">
												<c:out value="이용가능"/>
											</font>
										</c:when>
										<c:otherwise>
											<font color="red">
												<c:out value="이용불가"/>
											</font>
										</c:otherwise>
									</c:choose>
								</td>
								<c:if test="${sessionScope.memberNo eq 'admin'}">
									<td align="center">
										<a href="<c:url value="/bytal/cradleEdit/${map.cradleNo}"/>"> 
											<input type="button" id="edit" name="edit" value="수정" class="btn btn-default"/>
										</a>
									</td>
									<td align="center">
									<input type="button" id="delete" name="delete" value="삭제" 
										class="btn btn-default" onclick="javascript:remove(${map.cradleNo});"/>
									</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty listMap}">
						<tr>
							<td style="text-align: center;" colspan="7">목록이 존재하지 않습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table><br>
			<form id="form_search" method="post">
			<table>
				<tr><td>
	        		<select name="searchType" style="vertical-align: top;" class="form-control">
	           			<option value="cradleName">대여소 이름</option>
	        		</select>
        		</td><td>
	        		<input type="text" name="searchKeyword" value="<c:out value='${cradle.searchKeyword}' />" size="15" />
	        		<input type="submit" value="SEARCH" onclick="goPage(1);" class="btn"/>
        		</td></tr>
			</table>
			</form><br>
			<c:out value="${navigator}" escapeXml="false" />
			<c:if test="${sessionScope.memberNo eq 'admin'}">
			<div style="text-align: right;">
				<input style="width:60pt;height:60pt;margin:30px;" 
				type="button" id="add" name="add" value="등록" 
				onclick="location.href='/bytal/cradleAdd'" class="btn-primary"/>
			</div>
			</c:if>
	</table>
	<hr>개발문의사항 : <a href="https://open.kakao.com/o/gpVISyo">오픈카톡</a><p>
</div>
</body>
</html>
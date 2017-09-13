<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function writeBtn(value){
		location.href="/write";
	}
</script>
<title>::: ChanBoard :::</title>
</head>
<body>
<div class="container">
<%@include file="/WEB-INF/views/top.jsp"%>
	<table class="table table-striped">
		<thead>
		<tr>
			<th width="15%">번호</th>
			<th width="45%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">작성일</th>
			<th width="auto%">조회수</th>
		</tr>
		</thead>
		<tbody>
		<c:if test="${!empty board}">
		<c:forEach items="${board}" var="list" varStatus="status">
		<tr>
			<td>
				<c:out value="${list.bno}"/>
			</td>
			<td>
			<a href="view/${list.bno}">
				<c:out value="${list.title}"/>
				<c:if test="${list.reviewcnt != 0}">
					(<c:out value="${list.reviewcnt}"/>)
				</c:if>
				<c:if test="${list.fileStatus != 0}">
					<img alt="" src="/resources/img/fileStatus.png">
				</c:if>
			</a>
			</td>
			<td>
				<c:out value="${list.writer}"/>
			</td>
			<td>
				<fmt:formatDate value="${list.date}" pattern="yy.MM.dd"/>
			</td>
			<td>
				<c:out value="${list.viewcnt}"/>
			</td>
		</tr>
		</c:forEach>
		</c:if>
		<c:if test="${empty board}">
			<tr>
				<td style="text-align: center;" colspan="5">목록이 존재하지 않습니다.</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="5" align="right">
				<input type="button" value="글쓰기" onclick="javascript:writeBtn();" class="btn btn-default"/>
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center">
				<c:out value="${navigator}" escapeXml="false"/>
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center">
				<form action="/list" id="searchForm" method="post">
				<table>
				<tr>
					<td>
					<select name="searchType" class="form-control">
						<option id="title" value="title" <c:if test="${search.searchType eq 'title'}">selected="selected"</c:if>>제목</option>
						<option id="content" value="content" <c:if test="${search.searchType eq 'content'}">selected="selected"</c:if>>내용</option>
						<option id="writer" value="writer" <c:if test="${search.searchType eq 'writer'}">selected="selected"</c:if>>글쓴이</option>
					</select>
					</td>
					<td>
						<input type="text" name="searchKeyword" value="<c:out value='${search.searchKeyword}'/>" class="form-control">
					</td>
					<td>
						<input type="button" value="검색" onclick="goPage(1);" class="btn btn-primary">
					</td>
				</tr>
				</table>
				</form>
			</td>
		</tr>
		</tbody>
	</table>
	<footer>
		Copyright &copy;chunsjun.cafe24.com
	</footer>
</div>
</body>
</html>
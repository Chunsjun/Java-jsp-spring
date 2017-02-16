<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	function writeBoard(){
		location.href="/graz/board/free/write";
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FreeBoardList</title>
</head>
<body>
<div class="container">
<table height="100%" width="100%" border="0">
	<tr>
		<td colspan="2">
			<%@include file="/WEB-INF/jsp/main/top.jsp"%>
		</td>
	</tr>
	<tr>
	<%-- <c:if test="${isMobile eq false}">
		<td width="20%" align="center">
			<%@include file="/WEB-INF/jsp/board/left.jsp"%>
		</td>
	</c:if> --%>
		<td align="center">
			<h1>게시판</h1>
			<table class="table table-hover">
				<thead>
					<tr>
						<c:if test="${isMobile eq false}">
							<th width="10%">글번호</th>
						</c:if>
						<th width="50%">제목</th>
						<th width="15%">작성자</th>
						<c:if test="${isMobile eq false}">
							<th width="10%">작성일</th>
						</c:if>
						<th width="15%">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty listBoard}">
						<c:forEach items="${listBoard}" var="board" varStatus="status">
							<tr>
							<c:if test="${isMobile eq false}">
								<td>
									<c:out value="${board.boardNo}"/>
								</td>
							</c:if>
								<td style="text-align: left; padding: 10px;">
									<a href="/graz/board/free/view/${board.boardNo}">
										<c:out value="${board.title}" />
										<c:if test="${board.reviewCount != 0}">
											<c:out value="(${board.reviewCount})"/>
										</c:if>
									</a>
								</td>
								<td style="text-align: left;">
									<c:out value="${board.writer}" />
								</td>
								<c:if test="${isMobile eq false}">
									<td style="text-align: left;">
										<c:out value="${board.date}"/>
									</td>
								</c:if>
								<td style="text-align: center;">
									<c:out value="${board.view}"/>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty listBoard}">
						<tr>
							<td style="text-align: center;" colspan="5">목록이 존재하지 않습니다.</td>
						</tr>
					</c:if>
						<tr>
							<td colspan="5" align="center">
								<c:out value="${navigator}" escapeXml="false"/>
							</td>
						</tr>
				</tbody>
			</table>
			<form id="form_search" method="post" class="form-inline">
				<table>
					<tr>
						<td>
							<select name="searchType" style="vertical-align: top;" class="form-control" >
								<option value="title" <c:if test="${board.searchType eq 'title'}">selected="selected"</c:if>>제목</option>
								<option value="content" <c:if test="${board.searchType eq 'content'}">selected="selected"</c:if>>내용</option>
								<option value="writer" <c:if test="${board.searchType eq 'writer'}">selected="selected"</c:if>>작성자</option>
							</select>
						</td>
						<td>
							<input type="text" name="searchKeyword" value="<c:out value='${board.searchKeyword}' />" size="15" class="form-control"/>
						</td>
						<td>
							<input type="submit" value="SEARCH" onclick="goPage(1);" class="btn btn-default"/>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center" style="padding: 10px;">
							<c:if test="${sessionScope.user != null}">
							<input type="button" value="글쓰기" onclick="javascript:writeBoard();"
								class="btn btn-default">
							</c:if>
						</td>
					</tr>
				</table>
			</form>
		</table>
	<hr>
	개발문의사항 : <a href="https://open.kakao.com/o/gNFREls">오픈카톡</a><p>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/views/etc/scripts.jsp"%>
<script type="text/javascript">
	function golist(){
		/* location.href = "/list"; */
		history.back();
	}
	function deleteboard(bno){
		if (confirm("정말 삭제하시겠습니까??") == true){
			location.href = "/delete/"+bno;
		} else {
		    return;
		}
	}
	function updateboard(bno){
		location.href = "/update/"+bno;
	}

	function hidTextAreaView(index){
		var commentView = document.getElementById("comment"+index).hidden;
		var cmtForm = document.getElementById("commentForm"+index);
		
		if(commentView == true){
			document.getElementById("comment"+index).hidden = false;
			document.getElementById("commentBtn"+index).hidden = false;
		}else{
			document.getElementById("comment"+index).hidden = true;
			document.getElementById("commentBtn"+index).hidden = true;
		}
		cmtForm.reviewContent.focus();
	}
	
	function hidTextAreaSubmit(index){
		var commentStr = document.getElementById("comment"+index).value;
		if(commentStr.length > 150 || commentStr.trim() == ""){
			alert("답글은 공백이나 150자를 초과할수 없습니다.");
		}else{
			document.getElementById("commentForm"+index).submit();
		}
	}
	
	function reviewDel(bno,rno){
		if (confirm("정말 삭제하시겠습니까??") == true){
			location.href = "/reviewD/"+bno+"/"+rno;
		} else {
		    return;
		}
	}
	
	function reviewBtn(){
		var form = document.getElementById('reviewForm');
		var reviewStr = document.getElementById('content').value;
		
		if(reviewStr.length > 150 || reviewStr.trim() == ""){
			alert('댓글은 공백이나 150자를 초과할수 없습니다.');
		}else{
			form.submit();
		}
		
	}
	
</script>
<title>::: ChanBoard :::</title>
</head>
<body>
<div class="container">
<%@include file="/WEB-INF/views/etc/top.jsp"%>
	<table class="table">
		<tr>
			<th>글번호</th>
			<td><c:out value="${view.bno}"/></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><c:out value="${view.title}"/></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><c:out value="${view.writer}"/></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><c:out value="${view.viewcnt}"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td style="height: 200px;"><c:out value="${view.content}" escapeXml="false"/><br></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><fmt:formatDate value="${view.date}" pattern="yy.MM.dd (kk:mm:ss)"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<a href="${file.file_path}">
				<img alt="" src="${file.file_path}" width="50%" height="auto">
			</a>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="목록" onclick="javascript:golist();"  class="btn btn-default">
				<c:if test="${(sessionScope.user.uno eq view.uno) || (sessionScope.user.uno eq 0)}">
				<input type="button" value="수정" onclick="javascript:updateboard('${view.bno}');"  class="btn btn-default">
				<input type="button" value="삭제" onclick="javascript:deleteboard('${view.bno}');"  class="btn btn-default">
				</c:if>
			</td>
		</tr>
		<c:if test="${!empty sessionScope.user}">
		<tr align="center">
			<td colspan="2">
			<form action="/reviewW" method="post" id="reviewForm">
				<table style="width: 100%">
					<tr>
						<td width="10%;">
							댓글
						</td>
						<td>
							<input type="text" id="content" class="form-control" name="content" maxlength="150" required="required">
							<input type="text" name="bno" hidden="hidden" value="<c:out value='${view.bno}'/>">
						</td>
						<td width="10%;" align="center">
							<input type="button" onclick="reviewBtn();" value="댓글달기" class="btn btn-default">
						</td>
					</tr>
				</table>
			</form>
			</td>
		</tr>
		</c:if>
		<tr>
			<td colspan="2">
				<table style="width: 100%" class="table">
					<!-- 댓글 로직 시작 -->
					<c:forEach items="${rList}" var="review" varStatus="status">
					<tr>
						<td width="25%">
						<label>
							<c:out value="${review.writer}"/><br>
							<font style="text-align: left; color: gray; font-size: 10px;">
							<fmt:formatDate value="${review.date}" pattern=" yyyy.MM.dd (kk:mm:ss)"/>
							</font>
						</label>
							<!-- 대댓글 로직 시작 -->
						</td>
						<td>
							<c:out value="${review.content}"/>
							<a style="font-size: 10px;" onclick="hidTextAreaView('${status.index}');">답글달기</a>
							<c:if test="${!empty sessionScope.user}">
								<form id="commentForm${status.index}" name="commentForm${status.index}" action="/commentW" method="post">
									<input id="comment${status.index}" name="content" type="text" size="13"  maxlength="150" hidden="true" onkeyPress="if (event.keyCode==13){return false;}">
									<input id="commentBtn${status.index}" type="button" value="답글달기" hidden="true" onclick="hidTextAreaSubmit('${status.index}');">
									
									<!-- 게시물번호, 리뷰번호를 보내기위한 인풋 -->
									<input name="bno" type="text" hidden="true" value="<c:out value='${view.bno}'/>">
									<input name="rno" type="text" hidden="true" value="<c:out value='${review.rno}'/>">
								</form>
							</c:if>
						</td>
						<td width="10%">
							<c:if test="${
								(sessionScope.user.uno eq view.uno) || 
								(sessionScope.user.uno eq 0) || 
								(sessionScope.user.uno eq review.uno)}">
							<input type="button" value="삭제" class="btn btn-default" onclick="reviewDel('${review.bno}','${review.rno}');"/>
							</c:if>
						</td>
					</tr>
					<!-- 대댓글이 있을경우 반복 뿌리기 -->
					<c:if test="${!empty review.comment}">
						<c:forEach var="comment" items="${review.comment}">
							<tr>
								<td>
									<label>
									<img src="/resources/img/reviewarrow.png" width="10px" height="10px">
									<c:out value="${comment.writer}"/><br>
									<font style="text-align: left; color: gray; font-size: 10px;">
									<fmt:formatDate value="${comment.date}" pattern=" yyyy.MM.dd (kk:mm:ss)"/>
									</font>
									</label>
								</td>
								<td>
									<c:out value="${comment.content}"/>
								</td>
								<td>
									<c:if test="${
									(sessionScope.user.uno eq view.uno) || 
									(sessionScope.user.uno eq 0) || 
									(sessionScope.user.uno eq comment.uno)}">
										<input type="button" value="삭제" class="btn btn-default" onclick="reviewDel('${comment.bno}','${comment.rno}');"/>
									</c:if>
								</td>
							</tr>
						</c:forEach>
						<!-- 대댓글 로직 끝 -->
					</c:if>
					</c:forEach>
					<!-- 댓글 로직 끝 -->
				</table>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
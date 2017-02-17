<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	function backList() {
		/* location.href = "/graz/board/free";	 */	
		history.back();
	}
	function update(boardNo) {
		location.href = "/graz/board/free/update/"+boardNo;
	}
	function boardDelete(boardNo) {
		if (confirm("정말 삭제하시겠습니까??") == true){
			location.href = "/graz/board/free/delete/"+boardNo;
		} else {
		    return;
		}
	}
	function removeReview(boardNo,reviewNo){
		if(confirm("댓글을 삭제하시겠습니까??") == true){
			location.href = "/graz/board/free/review/delete/"+boardNo+"/"+reviewNo;
		}else{
			return;
		}
	}
	
	function fnChkByte(obj, maxByte){
		var str = obj.value;
		var str_len = str.length;

		var rbyte = 0;
		var rlen = 0;
		var one_char = "";
		var str2 = "";
		
		for(var i=0; i<str_len; i++){
		one_char = str.charAt(i);
		if(escape(one_char).length > 3){
		    rbyte += 2;                                         //한글2Byte
		}else{
		    rbyte++;                                            //영문 등 나머지 1Byte
		}

		if(rbyte <= maxByte){
		    rlen = i+1;                                          //return할 문자열 갯수
		}
		}

		if(rbyte > maxByte){
		    alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
		    str2 = str.substr(0,rlen);                                  //문자열 자르기
		    obj.value = str2;
		    fnChkByte(obj, maxByte);
		}else{
		    document.getElementById('byteInfo').innerText = rbyte;
		}
		}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FreeBoardView</title>
</head>
<body>
<div class="container">
	<table height="100%" width="100%">
		<tr>
			<td colspan="2">
				<%@include file="/WEB-INF/jsp/main/top.jsp"%>
			</td>
		</tr>
		<tr>
			<td align="center">
				<h1>자유 게시판</h1>
				<form name="writeBoard" action="/graz/board/free/write" method="post" >
				<table width="70%" height="50%" align="center" class="table">
					<tr>
						<th>
							글번호
						</th>
						<td colspan="2">
							<c:out value="${board.boardNo}"/>
						</td>
					</tr>
					<tr>
						<th width="20%" height="10%" align="left">
							제목
						</th>
						<td colspan="2">
							<c:out value="${board.title}"/>
						</td>
					</tr>
					<tr>
						<th width="20%" height="10%" align="left">
							작성자
						</th>
						<td colspan="2">
							<c:out value="${board.writer}"/>
						</td>
					</tr>						
					<tr>
						<th width="20%" height="10%" align="left">
							작성일
						</th>
						<td colspan="2">
							<c:out value="${board.date}"/>
						</td>						
					</tr>
					<tr>
						<th width="20%" height="10%" align="left">
							조회수
						</th>
						<td colspan="2">
							<c:out value="${board.view}"/>
						</td>
					</tr>
					<tr>
						<th width="20%" height="10%" align="left">
							내용
						</th>
						<td  colspan="2" style="height: 200px;">
							<c:out value="${board.content}" escapeXml="false"/>
						</td>
					</tr>
				</table>
				</form>
				<form name="reviewWrite" action="/graz/board/free/review/${board.boardNo}" method="post">
				<table class="table">
					<tr>
						<th width="20%">
							<c:out value="댓글(${reviewCount})"/>
						</th>
						<c:if test="${sessionScope.user != null}">
						<td>
							<textarea name="reviewContent" style="width:100%;height:100;" onKeyUp="javascript:fnChkByte(this,'200')"></textarea>
							<span id="byteInfo">0</span>/200Byte
						</td>
						<td colspan="2" width="20%">
							<input type="submit" class="btn btn-default" value="댓글달기">
						</td>
						</c:if>
					</tr>
					<tr>
						<td align="center" colspan="3">
							<c:if test="${(sessionScope.user.name eq board.writer) || (sessionScope.user.userNo eq 0)}">
								<input type="button" value="수정" onclick="javascript:update('${board.boardNo}');" class="btn btn-default">
								<input type="button" value="삭제" onclick="javascript:boardDelete('${board.boardNo}');" class="btn btn-default">
							</c:if>
								<input type="button" value="목록" onclick="javascript:backList();" class="btn btn-default">
						</td>
					</tr>
					<c:if test="${!empty viewReview}">
					<c:forEach items="${viewReview}" var="review" varStatus="status">
						<tr>
							<td style="text-align: left;">
								<c:out value="${review.reviewWriter}" />
							</td>
							<td style="text-align: left; padding: 10px;">
								<c:out value="${review.reviewContent}" />
							</td>
							<td style="text-align: left; color: gray;" width="20%">
								<fmt:formatDate value="${review.reviewDate}" pattern="yy.MM.dd (kk:mm:ss)"/>
								<%-- <c:out value="${review.reviewDate}"/> --%>
								
								<c:if test="${
								(sessionScope.user.name eq board.writer) || 
								(sessionScope.user.userNo eq 0) || 
								(sessionScope.user.name eq review.reviewWriter)}">
									<input type="button" class="btn btn-warning" value="삭제" onclick="javascript:removeReview('${board.boardNo}','${review.reviewNo}');">
								</c:if>
							</td>
						</tr>
					</c:forEach>
					</c:if>
				</table>
				</form>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
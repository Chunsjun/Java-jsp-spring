<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>::: Spring with MyBatis :::</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="text/javascript">
        function edit() {
            document.getElementById('form').submit();
        };
    </script>
</head>

<body>
    <h3>가게 수정</h3>

    <form id="form" name="form" 
            action="<c:url value="/shop/edit/{shopNo}" />" method="post">
        <table style="width: 100%;" border="1">
            <thead>
                <tr>
                    <th width="10%">구분</th>
                    <th>내용</th>
                </tr>
            </thead>
            <tbody>
            	<tr>
            	<td>가게번호</td>
            	<td style="text-align: left;">
            		<input type="text" id="shopNo" name="shopNo"
            			maxlength="3" style="width: 200px;" 
            			value="<c:out value="${shop.shopNo}" />"
            			readonly="readonly"/>
            	</td>
            	</tr>
                <tr>
                    <td>가게명</td>
                    <td style="text-align: left;">
                        <input type="text" id="shopName" name="shopName"
                            maxlength="20" style="width: 200px;" 
                            value="<c:out value="${shop.shopName}" />"/>
                    </td>
                </tr>
                <tr>
                    <td>위치</td>
                    <td style="text-align: left;">
                        <input type="text" id="shopLocation"
                            name="shopLocation" maxlength="100"
                            style="width: 200px;" 
                            value="<c:out value="${shop.shopLocation}" />"/>
                    </td>
                </tr>
                <tr>
                     <td>상태</td>
               <td style="text-align: left;">
               <select id="shopStatus" name="shopStatus">
                     <option value="">선택</option>
                     <option value="Y"
                        <c:if test="${shop.shopStatus == 'Y'}">
                        selected="selected"</c:if>>Y</option>
                     <option value="N"
                        <c:if test="${shop.shopStatus == 'N'}">
                        selected="selected"</c:if>>N</option>
               </select>
               </td>
                </tr>
            </tbody>
        </table>
    </form>

    <div style="text-align: right; padding-top: 10px;">
        	<input type="button" id="button_edit" name="button_edit" value="수정" title="수정" onclick="edit();" />
        <a href="<c:url value="/shop/list" />">
            <input type="button" id="button_list" name="button_list" value="목록" />
        </a>
    </div>
</body>
</html>
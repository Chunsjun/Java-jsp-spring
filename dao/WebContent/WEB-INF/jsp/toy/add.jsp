<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>::: Spring with MyBatis :::</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript">
        function add() {
            document.getElementById('form').submit();
        };
    </script>
</head>

<body>
    <h3>장난감 등록</h3>

    <form id="form" name="form" 
            action="<c:url value="/toy/add" />" method="post">
        <table style="width: 100%;" border="1">
            <thead>
                <tr>
                    <th width="10%">구분</th>
                    <th>내용</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>장난감 이름</td>
                    <td style="text-align: left;">
                        <input type="text" id="toyName" name="toyName"
                            maxlength="20" style="width: 200px;" />
                    </td>
                </tr>
                <tr>
                    <td>장난감 가격</td>
                    <td style="text-align: left;">
                        <input type="text" id="toyPrice"
                            name="toyPrice" maxlength="100"
                            style="width: 200px;" />
                    </td>
                </tr>
                <tr>
                    <td>가게 번호</td>
                   <td style="text-align: left;">
                        <input type="text" id="shopNo"
                            name="shopNo" maxlength="100"
                            style="width: 200px;" />
                    </td>
                </tr>
            </tbody>
        </table>
    </form>

    <div style="text-align: right; padding-top: 10px;">
        	<input type="button" id="button_add" name="button_add" value="등록" title="등록" onclick="add();" />
        <a href="<c:url value="/toy/list" />">
            <input type="button" id="button_list" name="button_list" value="목록" />
        </a>
    </div>
</body>
</html>
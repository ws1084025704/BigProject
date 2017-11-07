<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>显示数据</title>
</head>
<body>
<table>
    <tr>
        <th>pointID</th>
        <th>AccountID</th>
        <th>经度</th>
        <th>纬度</th>
        <th>信息</th>
        <th>电影名</th>
    </tr>
    <s:iterator value="points" var="obj">
        <tr>
            <td><s:property value="pointID"/></td>
            <td><s:property value="userID"/></td>
            <td><s:property value="longitude"/></td>
            <td><s:property value="latitude"/></td>
            <td><s:property value="info"/></td>
            <td><s:property value="movieName"/></td>
        </tr>
    </s:iterator>
</table>
</body>
</html>
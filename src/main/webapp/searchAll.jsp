
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,PO.InformationEntity"%>
<html>
<head>
    <title>按照关键词查询</title>
</head>
<body>

<s:form action="findMessageAction" method="post">
    <table align="center" width="40%" border="5">
        <tr>
            <td>
                请输入要查询的关键词：
            </td>
            <td>
                <input type="text" placeholder="关键词" name="search"/>
            </td>
            <td>
                <s:submit value="确定"></s:submit>
            </td>
        </tr>
    </table>
</s:form>
</body>
</html>
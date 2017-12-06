<%--
  Created by IntelliJ IDEA.
  User: Veronique
  Date: 11/13/17
  Time: 10:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="PO.InformationEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学生信息管理系统-修改</title>
</head>
<body bgcolor="pink">
<s:form action="SearchMessageAction" method="post">
    <table align="center" width="30%" bgcolor="gray" border="5">
        <%
            ArrayList list=(ArrayList)session.getAttribute("oneInfo");
            InformationEntity info=(InformationEntity)list.get(0);
        %>
        <tr>
            <td>
                学号
            </td>
            <td>
                <input name="id" value="<%=info.getPointId()%>" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <td>
                姓名
            </td>
            <td>
                <input name="name" value="<%=info.getUserId()%>"/>
            </td>
        </tr>
        <tr>
            <td>
                性别
            </td>
            <td>
                <input name="sex" value="<%=info.getLongitude()%>"/>
            </td>
        </tr>
        <tr>
            <td>
                年龄
            </td>
            <td>
                <input name="age" value="<%=info.getLatitude()%>"/>
            </td>
        </tr>
        <tr>
            <td>
                体重
            </td>
            <td>
                <input name="weight" value="<%=info.getInfo()%>"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <s:submit value="提交"></s:submit>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <s:a href="http://localhost:8080/findMessage.jsp">返回</s:a>
            </td>
        </tr>
    </table>
</s:form>
</body>
</html>
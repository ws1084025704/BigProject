<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,PO.InformationEntity"%>
<html>
<head>
    <title>显示数据</title>
</head>
<body>
<table>
    <tr>
        <th>pointID</th>
        <th>userID</th>
        <th>longitude</th>
        <th>latitude</th>
        <th>info</th>
        <th>movieName</th>
    </tr>
    <%
        ArrayList list=(ArrayList)session.getAttribute("allInfo");

    %>
    <%

        for(int i=0;i<list.size();i++){
            InformationEntity info=(InformationEntity)list.get(i);
    %>
    <tr>
        <td align="center"><%=i+1%></td>
        <td><%=info.getPointId()%></td>
        <td><%=info.getUserId()%></td>
        <td><%=info.getLongitude()%></td>
        <td><%=info.getLatitude()%></td>
        <td><%=info.getInfo()%></td>
        <td><%=info.getMovieName()%></td>
    </tr>
    <%
            }

    %>
</table>
</body>
</html>
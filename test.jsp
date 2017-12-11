<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <%@include file="cheader.jsp"%>
    <base href="<%=basePath%>"/>
    <base target="_blank" />
</head>
<body>
<%@include file="navBar.jsp"%>

<a class="navbar-brand" style="padding-top: 80px" href="/markMarkers.jsp">添加标注</a>
<p style="padding-top: 80px"><%=basePath%></p>
</body>
</html>
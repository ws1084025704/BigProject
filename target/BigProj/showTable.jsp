<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="/css/contents.css" rel="stylesheet">
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=l9pqrCK9etb47ILcKbMC8cm27GxmMdrd"></script>
    <script type="text/javascript"
            src="http://api.map.baidu.com/library/SearchControl/1.4/src/SearchControl_min.js"></script>
    <link rel="stylesheet" href="http://api.map.baidu.com/library/SearchControl/1.4/src/SearchControl_min.css"/>
    <base href="<%=basePath%>">
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="markMarkers.jsp">添加标注</a>
            <a class="navbar-brand" href="<s:url action="showMarkers"/>">查看标注</a>
            <a class="navbar-brand" href="line.jsp">指定旅行路线</a>
            <a class="navbar-brand" href="<s:url action="getTable"/>">查询自己标注的信息</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <a class="navbar-form navbar-right" href="logout.jsp">注销</a>
            <p class="navbar-form navbar-right" style="color: #ffffff;">Hello, ${sessionScope.username}</p>
        </div><!--/.navbar-collapse -->
    </div>
</nav>

<table class="table table-bordered table-hover text-center">
    <tr>
        <td>MovieName</td>
        <td>Details</td>
        <td>ImgPath</td>
        <td>Position</td>
    </tr>
    <s:iterator value="table_Storys">
        <tr>
            <td><s:property value="movieName"/></td>
            <td><s:property value="details"/></td>
            <td><s:property value="imgPath"/></td>
            <td>(<s:property value="lng"/>,<s:property value="lat"/>)</td>
        </tr>
    </s:iterator>
</table>


<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>

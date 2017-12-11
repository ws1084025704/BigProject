<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<html>
<head>
    <%@include file="cheader.jsp"%>
</head>
<body>
<%@include file="navBar.jsp"%>
<form action="getTable" style="padding-top: 80px;width:50%;" class="form-inline" target="queryFrame">
    <div class="form-group">
        <label>电影名称</label>
        <input type="text" class="form-control" name="movieName" placeholder="泰坦尼克号">
    </div>
    <div class="form-group">
        <input type="submit" class="btn btn-info btn-block" value="查询">
    </div>
</form>

<table class="table table-bordered table-hover text-center">
    <tr>
        <td>MovieName</td>
        <td>Details</td>
        <td>ImgPath</td>
        <td>Location</td>
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
</body>
</html>

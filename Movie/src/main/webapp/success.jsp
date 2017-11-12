<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <title>Upload Success</title>
    <base href="<%=basePath%>">
</head>
<body>
<h4 style="margin: 0 0 5px 0;padding:0.2em 0">${movieName}</h4>
<img src="${imageName}" style="float: right;margin: 4px" width="139" height="104" title="${movieName}">
<p style="margin:0;line-height: 1.5;font-size:13px;text-indent: 2em">${details}</p>
<button type="button" class="btn btn-primary" style="right: auto" onclick="geneteInfo();hide('uploadFrame')">确定</button>
<%--<button type="button" class="btn btn-danger" onclick="dismissInfo();hide('uploadFrame')">取消</button>--%>
</body>
</html>
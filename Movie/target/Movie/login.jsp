<%--
  Created by IntelliJ IDEA.
  User: wangyong
  Date: 2017/10/31
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>
</head>
<body>
<s:form action="login" method="post">
    <s:textfield name="user.username" label="用户名"/><br/>
    <s:password name="user.password" label="密码"/><br/>
    <s:submit name="submit" label="submit"/>
</s:form>
</body>

</html>

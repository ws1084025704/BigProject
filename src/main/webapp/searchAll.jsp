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

    </tr>
    <%
        ArrayList list=(ArrayList)session.getAttribute("allInfo");
        if(list.isEmpty()){
    %>
    <tr>
    <td align="center">
    <span>暂无电影信息!</span>
    </td>
    </tr>
    <%
    }else{
        for(int i=0;i<list.size();i++){
            InformationEntity info=(InformationEntity)list.get(i);
    %>
    <tr>

    <td><%=info.getPointId()%></td>
    <td><%=info.getUserId()%></td>
    <td><%=info.getLongitude()%></td>
    <td><%=info.getLatitude()%></td>
    <td><%=info.getInfo()%></td>
    <td><%=info.getMovieName()%></td>
    </tr>
    <%
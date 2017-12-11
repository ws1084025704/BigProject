<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
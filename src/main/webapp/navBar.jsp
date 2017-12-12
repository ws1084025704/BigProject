<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <a class="navbar-brand" href="<%=basePath%>/markMarkers.jsp">添加标注信息</a>
            <a class="navbar-brand" href="<s:url action="showMarkers"/>">显示标注信息</a>
            <a class="navbar-brand" href="<s:url action="line"/>">指定旅行路线</a>
            <a class="navbar-brand" href="<%=basePath%>/getTable?movieName=">查询标注信息</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <a class="navbar-form navbar-right" href="logout.jsp">注销</a>
            <p class="navbar-form navbar-right" style="color: #ffffff;">Hello, ${sessionScope.username}</p>
        </div><!--/.navbar-collapse -->
    </div>
</nav>


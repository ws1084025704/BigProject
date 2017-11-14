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
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <link rel="stylesheet" href="http://api.map.baidu.com/library/SearchControl/1.4/src/SearchControl_min.css"/>
    <link rel="Stylesheet" type="text/css" href="css/loginDialog.css"/>
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
            <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <form class="navbar-form navbar-right">
                <div class="form-group">
                    <input type="text" placeholder="Email" class="form-control">
                </div>
                <div class="form-group">
                    <input type="password" placeholder="Password" class="form-control">
                </div>
                <button type="submit" class="btn btn-success">Sign in</button>
            </form>
        </div><!--/.navbar-collapse -->
    </div>
</nav>

<!-- Main jumbotron for a primary marketing message or call to action -->
<%--<div class="jumbotron">--%>
<%--<div class="container">--%>
<%--<h1>Hello, world!</h1>--%>
<%--<p>This is a template for a simple marketing or informational website. It includes a large callout called a--%>
<%--jumbotron and three supporting pieces of content. Use it as a starting point to create something more--%>
<%--unique.</p>--%>
<%--<p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a></p>--%>
<%--</div>--%>
<%--</div>--%>
<br>
<a class="nav-login" href="javascript:;">登录</a>
<div class="login-form">
    <div class="login-header">
        <a href="javascript:;" title="关闭" class="login-close close">×</a>
        <h3>用户注册</h3>
    </div>
    <div class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1">
        <form action="main.html" method="get">
            <div class="form-group">
                <label>用户名</label>
                <input type="text" class="form-control" name="user.username" placeholder="请输入用户名">
            </div>
            <div class="form-group">
                <label>密码</label>
                <input type="password" class="form-control" name="user.password" placeholder="请输入密码">
            </div>
            <div class="form-group">
                <a href="javascript:;" class="register-btn btn btn-info btn-lg btn-block" role="button">注册新账号</a>
            </div>
        </form>
    </div>
</div>
<div class="login-form-mask"></div>

<footer>
    <p>&copy; 2016 Company, Inc.</p>
</footer>
</div> <!-- /container -->
<script type="text/javascript">
    //设置登录页面弹出效果
    jQuery(document).ready(function ($) {
        $('.nav-login').click(function () {
            $('.login-form-mask').fadeIn(100);
            $('.login-form').slideDown(200);
        })
        $('.login-close').click(function () {
            $('.login-form-mask').fadeOut(100);
            $('.login-form').slideUp(200);
        })
    })
</script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>

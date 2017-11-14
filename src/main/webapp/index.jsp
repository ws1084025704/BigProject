<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="/css/cover.css" rel="stylesheet">
    <link href="/css/loginDialog.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="site-wrapper">

    <div class="site-wrapper-inner">

        <div class="cover-container">

            <div class="masthead clearfix">
                <div class="inner">
                    <h3 class="masthead-brand">Travel with Movie</h3>
                    <form class="navbar-form navbar-right" action="login">
                        <div class="form-group">
                            <input type="text" placeholder="UserName" class="form-control" name="user.username">
                        </div>
                        <div class="form-group">
                            <input type="password" placeholder="Password" class="form-control" name="user.password">
                        </div>
                        <button type="submit" class="btn btn-success">登陆</button>
                        <a class="nav-login btn btn-info" href="javascript:;" role="button">注册</a>
                    </form>
                </div>
            </div>

            <div class="inner cover">
                <h1 class="cover-heading">Travel with the Movies.</h1>
                <p class="lead">Mark your favourite movies with the basic description and your feelings. Taste all kinds of plot and lost in the atmosphere of the movie. </p>
                <p class="lead"> Plan your own travel route to follow the footprint of actors.</p>
                <p class="lead">
                    <a href="#" class="btn btn-lg btn-default">Learn more</a>
                </p>
            </div>

            <div class="mastfoot">
                <div class="inner">
                    <p>Designed by Xiangying, Yong, Sifan, Hongyuan.</p>
                </div>
            </div>

        </div>

    </div>

</div>

<div class="login-form">
    <div class="login-header">
        <a href="javascript:;" title="关闭" class="login-close close">×</a>
        <h3 style="text-align: center">用户注册</h3>
    </div>
    <div class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1">
        <form action="register" method="post">
            <div class="form-group">
                <label>用户名</label>
                <input type="text" class="form-control" name="user.username" placeholder="请输入用户名">
            </div>
            <div class="form-group">
                <label>密码</label>
                <input type="password" class="form-control" name="user.password" placeholder="请输入密码">
            </div>
            <div class="form-group">
                <input type="submit" class="register-btn btn btn-info btn-lg btn-block" value="注册">
            </div>
        </form>
    </div>
</div>
<div class="login-form-mask"></div>
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
</body>
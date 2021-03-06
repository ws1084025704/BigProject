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
                <h1 class="cover-heading">跟着电影去旅行</h1>
                <p class="lead">在这里，你可以印刻电影里每一个感动的瞬间，制作自己的电影回忆， </p>
                <p class="lead">在这里，你可以亲历电影里每一帧震撼的场景，设计独一无二的旅行，</p>
                <p class="lead">见你所见，爱你所爱，铭刻，每一分心动。</p>
                <p class="lead">
                    <a href="#" class="btn btn-lg btn-default">Learn more</a>
                </p>
            </div>

            <div class="mastfoot">
                <div class="inner">
                    <p>Designed by 陈香莹, 王勇, 刘思凡, 倪郑鸿远.</p>
                </div>
            </div>

        </div>

    </div>

</div>

<div class="login-form" style="color:black;text-shadow:none;">
    <div class="login-header">
        <a href="javascript:;" title="关闭" class="login-close close">×</a>
        <h3 style="color: black;text-align: center">用户注册</h3>
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
<%--<div class="login-form-mask"></div>--%>
<script type="text/javascript">
    //设置登录页面弹出效果
    jQuery(document).ready(function ($) {
        $('.nav-login').click(function () {
//            $('.login-form-mask').fadeIn(100);
            $('.login-form').slideDown(200);
        })
        $('.login-close').click(function () {
//            $('.login-form-mask').fadeOut(100);
            $('.login-form').slideUp(200);
        })
    })
</script>
</body>
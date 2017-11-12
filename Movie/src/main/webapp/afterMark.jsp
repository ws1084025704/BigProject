<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
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

<div id="searchBox" class="container"></div>
<div id="map_container" class="container">
</div>

<div id="pic" style="border: 1;position: absolute;width: 400;height: 400; background:white;visibility: hidden"></div>

<iframe name="uploadFrame" id="uploadFrame" style="position:absolute;background:white;visibility: hidden"></iframe>
<hr>

<footer>
    <p>&copy; 2016 Company, Inc.</p>
</footer>
</div> <!-- /container -->
<script type="text/javascript">

    var aMap = new BMap.Map("map_container");
    // 创建地图实例
    var point = new BMap.Point(116.404, 39.915);
    // 创建点坐标
    var marker;
    //创建标记
    aMap.centerAndZoom(point, 15);
    // 初始化地图，设置中心点坐标和地图级别
    aMap.enableScrollWheelZoom(true);
    var searchControl = new BMapLib.SearchControl({
        container: "searchBox"
        , map: aMap
        , type: 1
    });

    function hide(id) {
        document.getElementById(id).style.visibility = "hidden";

    }

    function show(id) {
        document.getElementById(id).style.visibility = "visible";
    }

    //    function dismissInfo() {
    //
    //    }
    function generateInfo() {
        var info = "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>${movieName}</h4>" +
            "<img style='float:right;margin:4px' id='img' src='${imageName}' width='139' height='104' title='${movieName}'/>" +
            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>${details}</p>" +
            "</div>";
        var infoWindow = new BMap.InfoWindow(info);
        marker.addEventListener("click", function () {
            this.openInfoWindow();
            document.getElementById('img').onload=function () {
                infoWindow.redraw();
            }
        });
    }

    aMap.addEventListener("click", function (e) {
        var x = event.clientX;
        var y = event.clientY;
        document.getElementById("pic").style.top = y + 50;
        document.getElementById("pic").style.left = x;
        document.getElementById("pic").style.visibility = "visible";
        document.getElementById("uploadFrame").style.top = y + 50;
        document.getElementById("uploadFrame").style.left = x;
        var formDiv = "<form action=\"upload\" target=\"uploadFrame\" method=\"post\" enctype=\"multipart/form-data\">\n" +
            "    <div class=\"form-group\">\n" +
            "        <label>电影名称</label>\n" +
            "        <input type=\"text\" name=\"movieName\" placeholder=\"泰坦尼克号\" class=\"form-control\">\n" +
            "    </div>\n" +
            "    <div class=\"form-group\">\n" +
            "        <label>发生的情节</label>\n" +
            "        <textarea rows=\"3\" name=\"details\" placeholder=\"巨轮在这里撞击了冰山。\" class=\"form-control\"></textarea>\n" +
            "    </div>\n" +
            "    <div class=\"form-group\">\n" +
            "        <label>请选择上传的图片</label>\n" +
            "        <input type=\"file\" name=\"myFile\" />\n" +
            "    </div>\n" +
            "    <button type=\"submit\" class=\"btn btn-default\" onclick=\"hide('pic');show('uploadFrame')\">Submit</button>\n" +
            "</form>";
        document.getElementById("pic").innerHTML = formDiv;
        marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));
        aMap.addOverlay(marker);
    });


</script>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
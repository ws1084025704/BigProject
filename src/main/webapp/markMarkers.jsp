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
    <script type="text/javascript" src="/js/SearchControl.js"></script>
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
            <a class="navbar-brand" href="markMarkers.jsp">添加标注</a>
            <a class="navbar-brand" href="<s:url action="showMarkers"/>">查看标注</a>

        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <a class="navbar-form navbar-right" href="logout.jsp">注销</a>
            <p class="navbar-form navbar-right" style="color: #ffffff;">Hello, ${sessionScope.username}</p>
        </div><!--/.navbar-collapse -->
    </div>
</nav>

<div id="searchBox" class="container" style="margin-top: 20px;margin-bottom: 20px"></div>
<div id="map_container" class="container">
</div>

<div id="pic"
     style="border: 1px;position: absolute;width: 400px;height: 400px; background:white;visibility: hidden"></div>

<iframe name="uploadFrame" class="container" style="position:absolute;background:white;
width: 200px;height: 40px;visibility: hidden"></iframe>


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

    aMap.addEventListener("click", function (e) {
        var x = event.clientX;
        var y = event.clientY;
        document.getElementById("pic").style.top = y + 50;
        document.getElementById("pic").style.left = x;
        document.getElementById("pic").style.visibility = "visible";
        var formDiv = "<form action=\"upload\" name='uploadForm' method=\"post\"" +
            "target ='uploadFrame' enctype=\"multipart/form-data\" class='col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1'>\n" +
            "    <div class=\"form-group\">\n" +
            "        <label>电影名称</label>\n" +
            "        <input type=\"text\" name=\"story.movieName\" placeholder=\"泰坦尼克号\" class=\"form-control\">\n" +
            "    </div>\n" +
            "    <div class=\"form-group\">\n" +
            "        <label>发生的情节</label>\n" +
            "        <textarea rows=\"3\" name=\"story.details\" placeholder=\"巨轮在这里撞击了冰山。\" class=\"form-control\"></textarea>\n" +
            "    </div>\n" +
            "    <div class=\"form-group\">\n" +
            "        <label>请选择上传的图片</label>\n" +
            "        <input type=\"file\" name=\"myFile\" />\n" +
            "    </div>\n" +
            "<input type='hidden' name='lng'>" +
            "<input type='hidden' name='lat'>" +
            "    <button type=\"submit\" class=\"btn btn-default\" onclick=\"hide('pic');alert('上传成功')\">Submit</button>\n" +
            "</form>";
        document.getElementById("pic").innerHTML = formDiv;
        document.uploadForm.lng.value = e.point.lng;
        document.uploadForm.lat.value = e.point.lat;
    });


</script>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
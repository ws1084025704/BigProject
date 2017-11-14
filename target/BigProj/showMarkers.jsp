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


<footer>
    <p>&copy; 2016 Company, Inc.</p>
</footer>
</div> <!-- /container -->
<script type="text/javascript">
    var aMap = new BMap.Map("map_container");
    // 创建地图实例
    var point = new BMap.Point(116.404, 39.915);
    aMap.centerAndZoom(point, 4);
    aMap.enableScrollWheelZoom(true);
    var infos=[];
    var points=[];
    var markers=[];
    var infoWindows=[];
    // 创建点坐标
    <s:iterator value="storys" status="st">
    points[<s:property value='#st.index'/>]= new BMap.Point(<s:property value="lng"/>,<s:property value="lat"/>);
    markers[<s:property value='#st.index'/>] = new BMap.Marker(points[<s:property value='#st.index'/>]);
    infos[<s:property value='#st.index'/> ] = "<h4 style='margin:0 0 5px 0;padding:0.2em 0'><s:property value="movieName"/></h4>" +
        "<img style='float:right;margin:4px' id='img' src='<s:property value="imgPath"/>' width='100' height='100'" +
        " title='<s:property value="movieName"/>'/>" +
        "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'><s:property value="details"/></p>" +
        "</div>";
    infoWindows[<s:property value='#st.index'/>] = new BMap.InfoWindow(infos[<s:property value='#st.index'/>]);
    aMap.addOverlay(markers[<s:property value='#st.index'/>]);
    markers[<s:property value='#st.index'/>].addEventListener("click", function () {
        this.openInfoWindow(infoWindows[<s:property value='#st.index'/>]);
        document.getElementById('img').onload = function () {
            infoWindows[<s:property value='#st.index'/>].redraw();
        }
    });
    </s:iterator>

    aMap.enableScrollWheelZoom(true);
    var searchControl = new BMapLib.SearchControl({
        container: "searchBox"
        , map: aMap
        , type: 1
    });
</script>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>

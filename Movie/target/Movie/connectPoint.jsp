<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:wb="http://open.weibo.com/wb">
<head>
    <script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>
    <link href="/css/contents.css" rel="stylesheet">
    <style type="text/css">
        html,body{
            margin:0;
            padding:0;
        }
        .iw_poi_title{
            color:#CC5522;
            font-size:14px;
            font-weight:bold;
            overflow:hidden;
            padding-right:13px;
            white-space:nowrap
        }
        .iw_poi_content{
            font:12px arial,sans-serif;
            overflow:visible;
            padding-top:4px;
            white-space:-moz-pre-wrap;
            word-wrap:break-word
        }
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>
    <script type="text/javascript" src="js/arrow.js"></script>
</head>
<body>
<wb:publish action="pubilish" type="web" language="zh_cn" button_type="red" button_size="middle" refer="y" appkey="6qgfz7" ></wb:publish>
<div id="map_container" class="container"></div>
</body>
<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addPolyline();//向地图中添加线
    }

    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("map_container");//在百度地图容器中创建一个地图
        var point = new BMap.Point(116.404, 39.915);//定义一个中心点坐标
        map.centerAndZoom(point,15);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }

    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }

    //地图控件添加函数：
    function addMapControl(){
        //向地图中添加缩放控件
        var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
        map.addControl(ctrl_nav);
        //向地图中添加比例尺控件
        var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
        map.addControl(ctrl_sca);
    }

    function DrawPolyline(points) {
        var polyline = new BMap.Polyline(points, {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});
        map.addOverlay(polyline);
    }

    //向地图中添加线函数
    function addPolyline(){
        map.addEventListener("click", function (e) {
            map.clearOverlays();
            points.push(new BMap.Point(e.point.lng, e.point.lat));
            DrawPolyline(points);
        });
    }

    var points = [];
    initMap();//创建和初始化地图

</script>
</body>
</html>
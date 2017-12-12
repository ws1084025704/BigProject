<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:wb="http://open.weibo.com/wb">
<head>
    <script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>
    <%@include file="cheader.jsp"%>

</head>
<body>
<%@include file="navBar.jsp"%>
<div style="padding-top: 80px">
    <wb:publish action="pubilish" type="web" language="zh_cn" button_type="red"
                button_size="middle" refer="y" appkey="6qgfz7" ></wb:publish>
</div>

<div id="map_container" class="container"></div>
<div id="pic" style="border: 1;position: absolute;width: 400;height: 400; background:white;visibility: hidden"></div>

<iframe name="uploadFrame" id="uploadFrame" style="position:absolute;background:white;visibility: hidden"></iframe>
<hr>


<script type="text/javascript">
    var aMap = initMap(116.404,39.915,4);
    var infos=[];
    var points=[];
    var markers=[];
    var infoWindows=[];
    // 创建点坐标
    <s:iterator value="storys" status="st">
    points[<s:property value='#st.index'/>]= new BMap.Point(<s:property value="lng"/>,<s:property value="lat"/>);
    markers[<s:property value='#st.index'/>] = new BMap.Marker(points[<s:property value='#st.index'/>]);
    infos[<s:property value='#st.index'/> ] = "<h4 style='margin:0 0 5px 0;padding:0.2em 0'><s:property value="movieName"/></h4>" +
        "<img style='float:right;margin:4px' id='img' src='<%=basePath%><s:property value="imgPath"/>' width='100' height='100'" +
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
    aMap.enableDragging();//启用地图拖拽事件，默认启用(可不写)
    aMap.enableScrollWheelZoom();//启用地图滚轮放大缩小
    aMap.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
    aMap.enableKeyboard();//启用键盘上下左右键移动地图
    var markerClusterer = new BMapLib.MarkerClusterer(aMap, {markers:markers});

    var lpoint = [];
    aMap.addEventListener("dblclick", function (e) {
        lpoint.push(new BMap.Point(e.point.lng, e.point.lat));
        DrawPolyline(lpoint);
    });
    //创建和初始化地图函数：
    //    function initMap(points){
    //        createMap();//创建地图
    //        setMapEvent();//设置地图事件
    //        addMapControl();//向地图添加控件
    //        addMarker(points);
    //        addPolyline();//向地图中添加线
    //    }

    //创建地图函数：
    //    function createMap(){
    //        var map = new BMap.Map("map_container");//在百度地图容器中创建一个地图
    //        var point = new BMap.Point(116.404, 39.915);//定义一个中心点坐标
    //        map.centerAndZoom(point,3);//设定地图的中心点和坐标并将地图显示在地图容器中
    //        window.map = map;//将map变量存储在全局
    //    }


    //地图控件添加函数：
    //    function addMapControl(){
    //        //向地图中添加缩放控件
    //        var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
    //        map.addControl(ctrl_nav);
    //        //向地图中添加比例尺控件
    //        var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
    //        map.addControl(ctrl_sca);
    //    }

    //    function addMarker(points) {
    //        //循环建立标注点
    //        for(var i=0, pointsLen = points.length; i<pointsLen; i++) {
    //            var point = new BMap.Point(points[i].lng, points[i].lat); //将标注点转化成地图上的点
    //            var marker = new BMap.Marker(point); //将点转化成标注点
    //            map.addOverlay(marker);  //将标注点添加到地图上
    //            //添加监听事件
    //            (function() {
    //                var thePoint = points[i];
    //                marker.addEventListener("mouseover",
    //                    //显示信息的方法
    //                    function() {
    //                        showInfo(this,thePoint);
    //                    });
    //                marker.addEventListener("mouseout",
    //                    //显示信息的方法
    //                    function() {
    //                        hideInfo(this);
    //                    });
    //            })();
    //        }
    //    }

    //    function hideInfo(thisMarker) {
    //        var infoWindow = new BMap.InfoWindow(null); //清空信息窗口对象
    //        thisMarker.openInfoWindow(infoWindow); //重绘infoWindow
    //    }
    //
    //    function showInfo(thisMarker,point) {
    //        //获取点的信息
    //        var sContent =
    //            "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>" + point.name +"</h4>" +
    //            "<img style='float:right;margin:4px' id='imgDemo' src=" + point.picture + " width='139' height='104' title='天安门'/>" +
    //            "<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>" + point.detail + "</p>" +
    //            "</div>";
    //
    //        var infoWindow = new BMap.InfoWindow(sContent); //创建信息窗口对象
    //        thisMarker.openInfoWindow(infoWindow); //图片加载完后重绘infoWindow
    //    }

    function DrawPolyline(lpoint) {
        var polyline = new BMap.Polyline(lpoint, {strokeColor: "blue", strokeWeight: 6, strokeOpacity: 0.5});
        map.addOverlay(polyline);
    }

    //向地图中添加线函数
    //    function addPolyline(){
    //        map.addEventListener("click", function (e) {
    //            //map.clearOverlays();
    //            lpoint.push(new BMap.Point(e.point.lng, e.point.lat));
    //            DrawPolyline(lpoint);
    //        });
    //    }

    //    var lpoint = [];  //116.404, 39.915
    //    var points = [
    //        {"lng":319.234,"lat":43.360,"name":"正义联盟","picture":"/img/王勇.jpg","detail":"蝙蝠侠从这里出发拯救世界。"},
    //        {"lng":0,"lat":-39.925,"name":"正义联盟","picture":"/img/王勇.jpg","detail":"神奇女侠的取景地在这里。"},
    //        {"lng":269,"lat":39.920,"name":"正义联盟","picture":"/img/王勇.jpg","detail":"闪电侠大战恶魔的镜头在这里拍的。"}
    //    ];

    //    initMap(points);//创建和初始化地图

</script>
</body>
</html>

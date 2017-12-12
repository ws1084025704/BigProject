<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
    <%@include file="cheader.jsp"%>

</head>
<body>
<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"></script>
<%@include file="navBar.jsp"%>

<div style="padding-top: 80px">
    <wb:publish action="pubilish" type="web" language="zh_cn" button_type="red"
                button_size="middle" refer="y" appkey="6qgfz7" ></wb:publish>
</div>
<div id="map_container" class="container">
</div>

<script type="text/javascript">
    var aMap = new BMap.Map("map_container");
    // 创建地图实例
    var point = new BMap.Point(116.404, 39.915);
    aMap.centerAndZoom(point, 4);
    aMap.enableScrollWheelZoom(true);
    window.map = aMap;
    var infos=[];
    var points=[];
    var markers=[];
    var infoWindows=[];
    var lpoint = [];  //116.404, 39.915
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
    (function() {
        markers[<s:property value='#st.index'/>].addEventListener("mouseover", function () {
            this.openInfoWindow(infoWindows[<s:property value='#st.index'/>]);
            document.getElementById('img').onload = function () {
                infoWindows[<s:property value='#st.index'/>].redraw();
            }
        });
        markers[<s:property value='#st.index'/>].addEventListener("mouseout",
            function() {
                var infoWindow = new BMap.InfoWindow(null); //清空信息窗口对象
                this.openInfoWindow(infoWindow); //重绘infoWindow
            });
    })();

    addPolyline(lpoint)

    function DrawPolyline(lpoint) {
        var polyline = new BMap.Polyline(lpoint, {strokeColor: "blue", strokeWeight: 6, strokeOpacity: 0.5});
        aMap.addOverlay(polyline);
    }

    function addPolyline(){
        aMap.addEventListener("click", function (e) {
            //map.clearOverlays();
            lpoint.push(new BMap.Point(e.point.lng, e.point.lat));
            DrawPolyline(lpoint);
        });
    }
    </s:iterator>
    aMap.enableScrollWheelZoom(true);
</script>
</body>
</html>

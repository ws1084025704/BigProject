<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<html>
<head>
    <%@include file="cheader.jsp"%>
</head>
<body>
<%@include file="navBar.jsp"%>

<br>
<br><br>
<div id="map_container" class="container">
</div>

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
    var markerClusterer = new BMapLib.MarkerClusterer(aMap, {markers:markers});
</script>
</body>
</html>

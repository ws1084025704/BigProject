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
<%@include file="navBar.jsp"%>

<div id="searchBox" class="container" style="margin-top: 20px;margin-bottom: 20px"></div>
<div id="map_container" class="container">
</div>

<div id="pic"
     style="border: 1px;position: absolute;width: 400px;height: 400px; background:white;visibility: hidden"></div>

<iframe name="uploadFrame" class="container" style="position:absolute;background:white;
width: 200px;height: 40px;visibility: hidden"></iframe>

<div class="upload-form" style="color:black;text-shadow:none;">
    <div class="login-header">
        <a href="javascript:;" title="关闭" class="upload-close close">×</a>
        <h3 style="color: black;text-align: center">记录电影美好瞬间</h3>
    </div>
    <div class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1">
        <form action="upload" name="uploadForm" method="post" target="uploadFrame" enctype="multipart/form-data">
            <div class="form-group">
                <label>电影名称</label>
                <input type="text" class="form-control" name="story.movieName" placeholder="泰坦尼克号">
            </div>
            <div class="form-group">
                <label>发生的情节</label>
                <textarea rows='3' name="story.details" placeholder="巨轮在这里撞击了冰山" class="form-control"></textarea>
            </div>
            <div class="form-group">
                <label>请选择上传的剧照</label>
                <input type="file" name="myFile">
            </div>
            <input type="hidden" name="lng">
            <input type="hidden" name="lat">
            <div class="form-group">
                <input type="submit" class="register-btn btn btn-info btn-lg btn-block" onclick="hide('.upload-form')" value="确定发布">
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    var aMap =  initMap(116.404,39.915,15);
//    var aMap = new BMap.Map("map_container");
//    // 创建地图实例
//    var point = new BMap.Point(116.404, 39.915);
//    // 创建点坐标
//    var marker;
//    //创建标记
//    aMap.centerAndZoom(point, 15);
//    // 初始化地图，设置中心点坐标和地图级别
//    aMap.enableScrollWheelZoom(true);
//    var searchControl = new BMapLib.SearchControl({
//        container: "searchBox"
//        , map: aMap
//        , type: 1
//    });

//    function hide(id) {
//        document.getElementById(id).style.visibility = "hidden";
//    }
//
//    function show(id) {
//        document.getElementById(id).style.visibility = "visible";
//    }

    aMap.addEventListener("dblclick", function (e) {
        var x = event.clientX;
        var y = event.clientY;
        $('.upload-form').slideDown(200);
        document.uploadForm.lng.value = e.point.lng;
        document.uploadForm.lat.value = e.point.lat;
        $('.upload-close').click(function () {
            $('.upload-form').slideUp(200);
        })

    });


</script>
</body>
</html>
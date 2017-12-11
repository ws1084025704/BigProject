function initMap(lng,lat,level){
    var map = new BMap.Map("map_container");
    var point = new BMap.Point(lng,lat);
    map.centerAndZoom(point,level);
    map.disableDoubleClickZoom();
    map.enableScrollWheelZoom();
    //向地图中添加缩放控件
    var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_RIGHT,type:BMAP_NAVIGATION_CONTROL_LARGE});
    map.addControl(ctrl_nav);
    //向地图中添加比例尺控件
    var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
    map.addControl(ctrl_sca);
    return map;
}

function hide(cls) {
    $(cls).slideUp(200);
}
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<meta name="format-detection" content="telephone=no" />
<title>签到</title>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=NT4dlKcduR3zaDVc8vLzRR7m"></script>
    <style type="text/css">
        .baidu_map {
            width: 100%;
            height: 100%;
            overflow: hidden;
            display: block;
        }
        input[type=button] {
            margin-top: 1rem;
            width: 100%;
            height: 4.16rem;
            font-size: 2rem;
            background: #ed6c00;
            border-radius: 0.5rem;
            color: #fff;
            position: absolute;
            bottom: 0;
        }
    </style>
</head>
<body>
<div class="content">
    <div class="title">
        <h2>签到</h2>
        <a href="javascript:void(0);" onclick="window.history.go(-1);"><img src="/assets-new/img/esc.png"></a>
    </div>
    <hr class="content_hr">
    <div class="projectForm" style="margin-top:0px;">
        <h3>${region.fullName }-${pa.community }${pa.building }-${pa.unit }-${pa.room }-${pa.userName }</h3>
        <div id="allmap" class="baidu_map"></div>
        <c:if test="${sign!=true}">
            <input id="signButton" type="button" value="签到"/>
        </c:if>
    </div>

</div>
<form id="signForm" action="/pmProject/sign" method="POST">
    <input type="hidden" name="orderNo" value="${orderNo}"/>
    <input type="hidden" name="lng"/>
    <input type="hidden" name="lat"/>
    <input type="hidden" name="address"/>
    <input type="hidden" name="orderAddress" value="${region.fullName}${pa.community}${pa.building}"/>
    <input type="hidden" name="orderStatesNo" value="${pa.orderStatesNo}"/>
</form>
</body>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");
    var point = new BMap.Point(116.331398,39.897445);
    map.centerAndZoom(point,14);
    map.addControl(new BMap.MapTypeControl()); //添加地图类型控件
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
    // 左上角，添加比例尺
    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});
    map.addControl(top_left_control);
    //左上角，添加默认缩放平移控件
    var top_left_navigation = new BMap.NavigationControl();
    map.addControl(top_left_navigation);

    var geolocation = new BMap.Geolocation();
    var geoc = new BMap.Geocoder();

    var flag = true;
    geolocation.getCurrentPosition(function(r){
        if(this.getStatus() == BMAP_STATUS_SUCCESS){
            var mk = new BMap.Marker(r.point);
            map.addOverlay(mk);
            map.panTo(r.point);
            //地址转换
            geoc.getLocation(r.point, function(rs){
                var addComp = rs.addressComponents;
                var address = addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber;
                $("input[name='address']").val(address);

            });

            $("input[name='lng']").val(r.point.lng);
            $("input[name='lat']").val(r.point.lat);
            $("#signButton").click(function() {
                if(flag) {
                    $("#signForm").submit();
                    flag = false;
                }
            });
        } else {
            failedMsg=this.getStatus();
            $("#signButton").click(function(){
                alert('获取坐标失败，请确认开启GPS坐标定位，错误信息：'+failedMsg);
            });
        }
    },{enableHighAccuracy: true});
    $(function() {
        $(".nav").css("left","-16%");
        $(".nav").removeClass("animate");
        $(".content,.title").css("width","100%");
    });
</script>
</html>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="/assets-new/wx/css/css.css">
<script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=NT4dlKcduR3zaDVc8vLzRR7m"></script>		
</head>
<body>
	<!--签到-->
    <div class="sign">
    <form id="signForm" action="/app/wgpkg/sign" method="post">
    <input type="hidden" name="packageId" value="${packageId }"/>
    <input type="hidden" name="lng"/>
    <input type="hidden" name="lat"/>
    <input type="hidden" name="address"/>
   </form>
    	<h4 class="sign_title">${pa.fullName}-${pa.community}-${pa.building}-${pa.unit}-${pa.room}-${pa.userName}</h4>
        <p class="sign_prompt">您的当前位置（如不能定位，请先开启GPS）</p>
        <div id="allmap" class="sign_map"></div>
        <c:if test="${sgin ==true}">
        <button class="button" disabled="disabled">已签到</button>
        </c:if>
        <c:if test="${sgin ==false}">
        <button id="signButton" class="button">请开启共享位置信息</button>
        </c:if>

    </div>
    <script type="text/javascript">
			// 百度地图API功能
			var map = new BMap.Map("allmap");
			var point = new BMap.Point(116.331398,39.897445);
			map.centerAndZoom(point,12);
			var geolocation = new BMap.Geolocation();
			var geoc = new BMap.Geocoder();
			
			
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
						$("p[class='sign_prompt']").html("您的当前位置（"+address+"）");
						
					});        
					
					
					//alert('您的位置：'+r.point.lng+','+r.point.lat);
					$("input[name='lng']").val(r.point.lng);				
					$("input[name='lat']").val(r.point.lat);
					$("#signButton").html("签到，开始工作");
					$("#signButton").click(function(){
						$("#signForm").submit();
					});
				}else {
					var failedMsg=this.getStatus();
					$("#signButton").click(function(){
						alert('获取坐标失败，请确认开启GPS坐标定位，错误信息：'+failedMsg);
					});
					
				}        
			},{enableHighAccuracy: true});
			//关于状态码
			//BMAP_STATUS_SUCCESS	检索成功。对应数值“0”。
			//BMAP_STATUS_CITY_LIST	城市列表。对应数值“1”。
			//BMAP_STATUS_UNKNOWN_LOCATION	位置结果未知。对应数值“2”。
			//BMAP_STATUS_UNKNOWN_ROUTE	导航结果未知。对应数值“3”。
			//BMAP_STATUS_INVALID_KEY	非法密钥。对应数值“4”。
			//BMAP_STATUS_INVALID_REQUEST	非法请求。对应数值“5”。
			//BMAP_STATUS_PERMISSION_DENIED	没有权限。对应数值“6”。(自 1.1 新增)
			//BMAP_STATUS_SERVICE_UNAVAILABLE	服务不可用。对应数值“7”。(自 1.1 新增)
			//BMAP_STATUS_TIMEOUT	超时。对应数值“8”。(自 1.1 新增)
		</script>
</body>
</html>
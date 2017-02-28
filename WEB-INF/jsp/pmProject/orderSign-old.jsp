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
<script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=NT4dlKcduR3zaDVc8vLzRR7m"></script>		
</head>
<body>

 <!--3级页面框架-->
    <div class="right frame map">
    	<!--头部-->
    	<header>
        	<h6>签到</h6>
        		<a href="javascript:void(0);" onclick="window.history.go(-1);"><img src="/assets-new/img/esc.png"></a>
        </header>
        <div class="content" style="height:100%">
        	<!--签到-->
        	<div class="sigh_name">
                ${region.fullName }-${pa.community }${pa.building }-${pa.unit }-${pa.room }-${pa.userName }
            </div>
            <!--百度地图定位-->
            <div id="allmap" class="baidu_map" style="margin-top:80px;"></div>
              <c:if test="${sign!=true}">
  	 			   <input id="signButton" class="ok" type="button" value="签到"/>
  			 </c:if>
        </div>
    </div>

	<!--签到-->
	    <form id="signForm" action="/pmProject/sign" method="POST">
		    <input type="hidden" name="orderNo" value="${orderNo }"/>
		    <input type="hidden" name="lng"/>
		    <input type="hidden" name="lat"/>
		    <input type="hidden" name="address"/>
		    <input type="hidden" name="orderAddress" value="${region.fullName }${pa.community }${pa.building }"/>
		    <input type="hidden" name="orderStatesNo" value="${pa.orderStatesNo }"/>
	   </form>
	   
    <script type="text/javascript">
			// 百度地图API功能
			var map = new BMap.Map("allmap");
			var point = new BMap.Point(116.331398,39.897445);
			map.centerAndZoom(point,14);//12
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
						//$("p[class='sign_prompt']").html("您的当前位置（"+address+"）");
						
					});        
					
					//alert('您的位置：'+r.point.lng+','+r.point.lat);
					$("input[name='lng']").val(r.point.lng);				
					$("input[name='lat']").val(r.point.lat);
					//$("#signButton").html("签到，开始工作");
					$("#signButton").click(function(){
						if(flag){
							$("#signForm").submit();
							flag = false;
						}
					});
				}else {
					failedMsg=this.getStatus();
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
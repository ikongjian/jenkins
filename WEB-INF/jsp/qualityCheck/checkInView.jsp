<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>签到</title>
<link href="<%=basePath %>assets-new/css/qualityCheck/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/assets-new/js/qualityCheck/zhijian.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=NT4dlKcduR3zaDVc8vLzRR7m"></script>		
</head>
<body>
    	<!--头部-->
	<header class="head_unified">
		<a 
		<c:if test="${checktype==10}">href="/qualityCheck/xjlist"</c:if>
		<c:if test="${checktype==20}">href="/qualityCheck/inviteList"</c:if>
		<c:if test="${checktype==30 || checktype == 40}">href="/qualityCheck/rechecklist"</c:if>>
	
		<img src="<%=basePath %>assets-new/img/qualityCheck/esc.png"></a>
		签到
		<a class="head_right"><img class="login" src="<%=basePath %>assets-new/img/qualityCheck/login.png"></a>
	    <div class="login_show">
        	<a class="login_gai" href="/qualityCheck/showReset">修改密码</a>
            <a class="longin_esc" href="/qualityCheck/logout">退出登录</a>
            <img src="<%=basePath %>assets-new/img/qualityCheck/login3.png">
    	</div>
	</header>
	
   <form id="signForm" action="/qualityCheck/checkIn" method="POST">
    <input type="hidden" name="packageId" value="${pa.packageId }"/>
    <input type="hidden" name="lng"/>
    <input type="hidden" name="lat"/>
    <input type="hidden" name="address"/>
    <input type="hidden" name="orderNo" value="${orderInfo.orderNo }"/>
    <input type="hidden" name="checkId" value="${checkId}"/>
    <input type="hidden" name="checktype" value="${checktype}"> 
   </form>
      
 <!--GPS定位签到-->
    <div class="map">
    	<h6 id="h6_address">如不能定位，请先开启GPS</h6>
    	<c:if test="${sgin ==true}">
        <a href="javascript:void(0)">已签到</a>
        </c:if>
        <c:if test="${sgin ==false}">
        <a id="signButton" href="javascript:void(0)">签到并开始检查</a>
        </c:if>
          <div id="allmap" style="height:400px"></div>
           <a id="signButton" class="map_an" href="javascript:void(0)">签到并开始检查</a>
    </div>
   
    
     <!--地图嵌入-->
        
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
						$("#h6_address").html(address);
						
					});        
					
					
					//alert('您的位置：'+r.point.lng+','+r.point.lat);
					$("input[name='lng']").val(r.point.lng);				
					$("input[name='lat']").val(r.point.lat);
					
					$("#signButton").click(function(){
						$("#signForm").submit();
					});
				}else {
					failedMsg=this.getStatus();
					$("#signButton").click(function(){
						alert('获取坐标失败，请确认开启GPS坐标定位，错误信息：'+failedMsg);
					});
					
				}        
			},{enableHighAccuracy: true})
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>报告详情</title>
<link href="<%=basePath %>assets-new/css/qualityCheck/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>assets-new/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath %>assets-new/js/qualityCheck/zhijian.js"></script>

<link rel="stylesheet" type="text/css" href="<%=basePath %>assets-new/css/qualityCheck/mb.zoomify.css" media="screen" />
<script type="text/javascript" src="<%=basePath %>assets-new/js/qualityCheck/mb.zoomify.js"></script>
</head>

<body>
	<!--头部-->
	<header class="head_unified"><a href="/qualityCheck/myReports"><img src="<%=basePath %>assets-new/img/qualityCheck/esc.png"></a>质检报告
	
		   	<a class="head_right"><img class="login" src="<%=basePath %>assets-new/img/qualityCheck/login.png"></a>
	    <div class="login_show">
        	<a class="login_gai" href="/qualityCheck/showReset">修改密码</a>
            <a class="longin_esc" href="/qualityCheck/logout">退出登录</a>
            <img src="<%=basePath %>assets-new/img/qualityCheck/login3.png">
    	</div>
	
	</header>
    <!--质检报告-->
    <div class="report">
    	<!--报告房屋信息-->
        <div class="report_house">
        	<h1>客户信息：${orderInfo.community}-${orderInfo.building}-${orderInfo.unit}-${orderInfo.room}-${orderInfo.userName}</h1>
            <p>项目经理：${orderInfo.projectManager}</p>
            <p>开工日期：<fmt:formatDate value="${orderInfo.workingDate}" pattern="yyyy-MM-dd"/></p>
            <p>质检员：${orderInfo.qualityChecker}</p>
            <p>质检日期：<fmt:formatDate value="${checkDate}" pattern="yyyy-MM-dd"/></p>
            <p>检查人：${finishMancode}</p>
            <p>实际得分/总分数：${score}</p>
            <p>照片数量：<label type="button" style="color: red;">${imgNum}张</label>
            	<a href="#" onclick="showImg('${checkId}')" class="j_content_tda">查看照片</a>
            </p> 
        </div>
   		<!--报告内容-->
        <ul class="report_content">
        	<hr class="feport_hr">
        	<c:forEach var="item" items="${detaillist}" varStatus="status">
            <li>
            	<div class="report_chead">
                	<p class="report_1 report_border"><span>${status.index + 1}</span>
                		<c:if test="${item.status == 1}">
                		<label style="color:red;">${item.checkName}</label>
                		</c:if>
                		<c:if test="${item.status == 0}">
                		${item.checkName}
                		</c:if>
                	</p>
                	<c:if test="${item.status == 0}">
                	 <p class="report_2 report_border report_center">合格</p>
                	</c:if>
                	<c:if test="${item.status == 1}">
                	 <p class="report_2 report_border report_center" style="color:red;">不合格</p>
                	</c:if>
                    <p class="report_3 report_center report_color">详情</p>
                    <p class="report_3 report_center report_colorhover">详情</p>
                </div>
                <div class="report_house report_xq">
                    
                    
                    <table border="0">
                    	<tr>
                    		<td><p class="detail1">违规形式：</p></td>
                    		<td><span style="font-size:1rem; ">
                    			<c:if test="${item.status == 1}">${item.checkDescription}</c:if>
                    			</span>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td><p class="detail1">处理方式：</p></td>
                    		<td><span style="font-size:1rem; ">
                    			<c:if test="${item.disposeWarning == 1}">警告<br/></c:if>
                    			<c:if test="${item.disposeRectificationNow == 1}">现场整改<br/></c:if> 
                    			<c:if test="${item.disposeRectificationDelay == 1}">限期整改&nbsp;&nbsp;
                    			<fmt:formatDate value="${item.limitTime}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;
                   			 	<c:if test="${item.checkType == 1 }">线上复检</c:if>
                    			<c:if test="${item.checkType == 2 }">现场复检</c:if><br/></c:if>
                    			<c:if test="${item.disposeFine == 1}">罚款&nbsp;&nbsp;${item.disposeMoney}元</c:if>
                    			</span>
                    		</td>
                    	</tr>
                    </table>
                    <%-- <p>现场图片：</p>
                    <ul>
                        <c:forEach var="imgItem" items="${reportDetail[item]}">
                         <li>
                         <img src="${DOMAIN_NAME}${imgItem.imgUrl}" data-highres="${DOMAIN_NAME}${imgItem.imgUrl}" onclick="$(this).mbZoomify_overlay({startLevel:-1});">
                         </li>
                        </c:forEach>
                    </ul> --%>
                </div>
            </li>
            </c:forEach>
        </ul>
    </div>
    

	<!-- Modal 弹出显示照片的框 -->
	<div id="showphoto"
		style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, .5); display: none;">
		<div id="photodiv"
			style="background: #fff; font-size: 1rem; width: 94%; margin: 0 auto; position: relative; padding: 2.8rem 1rem 0; overflow: auto; height: 80%">
			<a class="pop_close"><img
				src="<%=basePath %>assets-new/img/qualityCheck/esc1.png"></a>
			<!--头部-->
			<header class="head_unified" style="height:1.4rem; line-height:0rem">
				<%-- <a href="${proUrl}"><img src="<%=basePath %>assets-new/img/qualityCheck/esc.png"></a> --%>
				照片列表
			</header>
			<!--照片列表-->
			<ul id="thumbs" class="photo_list">
			</ul>
		</div>
	</div>   
    <script type="text/javascript">
	function showImg(checkId){
		$("#showphoto").toggle();
		$("#thumbs").empty();$("#thumbs").html("读取中...........................");
      
		
		$.post("/qualityCheck/ImageList",{checkId:checkId},
				function(rs){
					
					var div = $("#thumbs");
					$("#thumbs").empty();
					
					for(var i = 0; i < rs.length; i++){
						
						var imginfo = rs[i];
						div.append("<li><img src='" + imginfo.imgThumbnailUrl + "' data-highres='" + imginfo.imgUrl + "' onclick='$(this).mbZoomify_overlay({startLevel:-1});'></li>");
					}
					var height = $(window).height()
					var popheight = $("#photodiv").height()
    				var poptop = (height-popheight)/2
					$("#photodiv").css("margin-top",poptop)
					$("body").css("overflow","hidden")
				},"json");
		
	}
    </script>
 
</body>
</html>

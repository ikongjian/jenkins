<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<head>
<title>图纸详情</title>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<script type="text/javascript">
function showPic(path){
	//页面层
	layer.open({
	    type: 1,
	    skin: 'layui-layer-rim', //加上边框
	    area: ['720px', '580px'], //宽高
	    content: "<img src='"+ path +"' />"
	});
}
</script>
</head>



    <div class="content">
        <!--图纸详情-->
        <div class="title">
            <h2>图纸详情</h2>
            <a href="javascript:void(0);" onclick="window.history.go(-1);"><img src="/assets-new/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <div class="dwg">
            <ul>
                <c:if test="${empty imgList }">
                	<div align="center"><img src="/assets-new/img/xmtz_w.png" /></div>
                </c:if>
                <c:forEach var="item" items="${imgList }">
                	<c:if test="${item.extName == 'jpg' or item.extName == 'png'}">
		                <li>
		                    <figure>
		                        <%-- <i onclick="showPic('${DOMAIN_NAME }${item.filePath}')">
		                             <!-- <img src="assets/img/pic1.png" alt="原始平面及设备勘探图" /> -->
		                        </i> --%>
		                        <img src="${DOMAIN_NAME }${item.filePath}" alt="${map[item.fileName]}" onclick="showPic('${DOMAIN_NAME }${item.filePath}')"/>
		                        <p>${map[item.fileName]}</p>
		                        <a class="xiazai"  href="javascript:void(0)" onclick="window.externalbrowser.goToExternalBrowser('http://worker.ikongjian.com/projectPicture/downloadPicture?orderNo=${orderNo }&fileName=${item.fileName}')">
		                                                                 下载
		                        </a>
		                    </figure>
		                </li>
	                </c:if>
	                <c:if test="${item.extName != 'jpg' and item.extName != 'png'}">
		                <li>
		                        <!-- <img style="background-image: url('/assets-new/img/xmtz.jpg');" /> -->
		                        <img src="/assets-new/img/xmtz.jpg" />
		                    	<!-- <span>非图片，无法查看，请联系设计师</span> -->
		                        <p>${map[item.fileName]}</p>
		                        <!-- <a href="#" download="天花及墙面装饰布置图">下载</a> -->
		                        <a class="xiazai"  href="javascript:void(0)" onclick="window.externalbrowser.goToExternalBrowser('http://worker.ikongjian.com/projectPicture/downloadPicture?orderNo=${orderNo }&fileName=${item.fileName}')">
		                   		下载
		                        </a>
		                </li>
		            </c:if>
                </c:forEach>
            </ul>
        </div>
    </div>
    <!--右侧内容框架结束-->
    <!--本页JS-->
    <script>
        $(function () {
            //隐藏返回按钮
            $(".nav").css("left","-16%");
            $(".nav").removeClass("animate");
            $(".content,.title").css("width","100%");
        })
    </script>



<%-- <body>
    <!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>图纸详情</h6>
        	<a href="/projectPicture/toProjectPictureList"><img src="/assets-new/img/esc.png"></a>
        </header>
        <div class="content">
        	<div class="detailed detailed_bhsq">
                <!-- <p class="p_left"><span>中铁国际花园：</span>刘侃</p> -->
            </div>
            <ul class="Photo">
                <c:if test="${empty imgList }">
                	<div align="center"><img src="/assets-new/img/xmtz_w.png" /></div>
                </c:if>
                <c:forEach var="item" items="${imgList }">
                	<c:if test="${item.extName == 'jpg' or item.extName == 'png'}">
                		<li>
		                	<i onclick="showPic('${DOMAIN_NAME }${item.filePath}')"><img src="${DOMAIN_NAME }${item.filePath}" /></i>
		                    <p>${map[item.fileName]}</p>
		                    <a class="xiazai" href="/projectPicture/downloadPicture?orderNo=${orderNo }&fileName=${item.fileName}">下载</a>
		                    <!-- <a class="xiazai" href="${DOMAIN_NAME }${item.filePath}">下载</a> -->
		                     <a class="xiazai"  href="javascript:void(0)" onclick="window.externalbrowser.goToExternalBrowser('http://worker.ikongjian.com/projectPicture/downloadPicture?orderNo=${orderNo }&fileName=${item.fileName}')">
		                   		下载
		                   </a>
		                </li>
                	</c:if>
                	<c:if test="${item.extName != 'jpg' and item.extName != 'png'}">
                		<li>
		                	<i><img src="/assets-new/img/wu1.png" /></i>
		                    <p>无法查看${item.extName}格式文件，请下载${item.extName}查看器查看</p>
		                    <a class="xiazai" href="/projectPicture/downloadPicture?orderNo=${orderNo }&fileName=${item.fileName}">下载</a>
		                	 <a class="xiazai" href="https://www.baidu.com/img/bd_logo1.png">下载</a>
		                </li>
		                <li>
		                	<!--无法显示图纸时候显示的默认图片-->
		                	<i style="background-image: url('/assets-new/img/xmtz.jpg');">
		                    	<!-- <span>非图片，无法查看，请联系设计师</span> -->
		                    </i>
		                    <p>${map[item.fileName]}</p>
		                    <!-- <a class="xiazai" href="${DOMAIN_NAME }${item.filePath}">下载</a> -->
		                     <a class="xiazai"  href="javascript:void(0)" onclick="window.externalbrowser.goToExternalBrowser('http://worker.ikongjian.com/projectPicture/downloadPicture?orderNo=${orderNo }&fileName=${item.fileName}')">
		                   		下载
		                   </a>
                        </li>
                	</c:if>
                </c:forEach>
            </ul>
        </div>
    </div>
</body> --%>


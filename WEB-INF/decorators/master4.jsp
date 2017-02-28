<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="version" value="2.2.3"></c:set><!-- 版本号 -->
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String height = (String)session.getAttribute("height");
%>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="no-cache" http-equiv="pragma">
    <meta content="no-cache" http-equiv="cache-control">
    <meta content="0" http-equiv="expires">
	<title><decorator:title/></title>
	
	<link rel="stylesheet" type="text/css" href="/assets-new/4th/css/ipad.css?version=${version }">
	<script type="text/javascript" src="/assets-new/4th/js/jquery-1.8.3.min.js?version=${version }"></script>
	<script type="text/javascript" src="/assets-new/4th/js/js.js?version=${version}"></script>
	
	<script type="text/javascript" src="/assets-new/js/jquery.cookie.js?version=${version }"></script>
	<script type="text/javascript" src="/assets-new/js/jquery.form.js?version=${version }"></script>
	<script type="text/javascript" src="/assets-new/js/app.js?version=${version }"></script>
	<script type="text/javascript" src="/assets-new/js/jiajian.js?version=${version }"></script>
	<script type="text/javascript" src="/assets-new/layer-v2.0/layer/layer.js?version=${version}"></script>
<decorator:head/>
</head>

<body>
	<!--侧面导航-->
    <nav class="nav animate">
        <div class="nav_1">
            <a href="/index">
                <i><img src="/assets-new/4th/img/nav_1.png"></i>
                <p class="fos_1">首页</p>
            </a>
        </div>
        <c:if test="${werks == '101' }">
        	<div class="nav_list">
	            <p><img src="/assets-new/4th/img/nav_2.png">我的任务</p>
	            <ul id="wdrw">
	                <li id="wyqd" class="navli_hover"><a href="/pmProject/pmAchieve">我要抢单</a></li>
	                <li id="xmbb"><a href="/publish/list">项目播报</a></li>
	                <!-- <li id="fprw"><a href="/package/list">任务包分配</a></li> -->
	                <li id="dbrw"><a href="/agency/list">待办任务</a></li>
	               <!--  <li id="rwbys"><a href="/waiting" class="nav_a7">任务包验收</a></li>
	                <li id="dkjl"><a href="/waiting" class="nav_a7">打款记录</a></li> -->
	            </ul>
        	</div>
        </c:if>
        <div class="nav_list">
            <p><img src="/assets-new/4th/img/nav_3.png">进度管理</p>
            <ul id="jdgl">
                <li id="qrkg"><a href="/confirmWorkDate/index">确认开工</a></li>
                <li id="xcqd"><a href="/pmProject/projectList">现场签到</a></li>
                <li id="jdtb"><a href="/process/list">进度通报</a></li>
                <c:if test="${werks == '101' }">
                	<li id="mzaz"><a href="/wood/woodList">木作安装</a></li>
                	<li id="tdys"><a href="/complete/check/list">特单验收</a></li>
                </c:if>
                <li id="jgsq"><a href="/workComplete/toProjectCompleteList">竣工申请</a></li>
            </ul>
        </div>
        <div class="nav_list">
            <p><img src="/assets-new/img/nav_4.png">材料管理</p>
            <ul id="clgl">
                <li id="flhl"><a href="/review/toReviewListPage">辅料核量</a></li>
                <li id="fhsq"><a href="/stuffAccept/projectList">发货申请</a></li>
                <li id="bhsq"><a href="/applyGoods/toApplyGoodsList">补货申请</a></li>
            </ul>
        </div>
        <c:if test="${werks == '101' }">
	        <div class="nav_list">
	            <p><img src="/assets-new/4th/img/nav_5.png">项目结算</p>
	            <ul id="xgjs">
	                <li id="fyjs"><a href="/settle/settleList">费用结算</a></li>
	            </ul>
	        </div>
        </c:if>
        <div class="nav_list">
            <p><img src="/assets-new/4th/img/nav_6.png">个人中心</p>
            <ul id="grzx">
                <li id="wdxm"><a href="/pmProject/myProjectList">我的项目</a></li>
                <li id="xmtz"><a href="/projectPicture/toProjectPictureList">项目图纸</a></li>
                <li id="xdxx"><a href="/msg/list">我的消息</a></li>
                <li id="zjbg"><a href="/check/list">质检报告</a></li>
                <li id="xgmm"><a href="/modifyPwdUI">修改密码</a></li>
            </ul>
        </div>
    </nav>
    
    <!--侧面导航结束-->
    <!--右侧内容框架-->
    <div class="content">
        <decorator:body/>
    </div>
    
    <!--右侧内容框架结束-->
    <!--本页JS-->
    <script type="text/javascript">
        $(function () {
            //隐藏返回按钮
            $(".title a").hide()
        })
    </script>
</body>
</html>

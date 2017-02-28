<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="version" value="2.2.2"></c:set><!-- 版本号 -->
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String height = (String)session.getAttribute("height");
%>
<html lang="en">
<head>

	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<title><decorator:title/></title>
	<meta name="description" content="爱空间-互联网家装，20天工期，699元/平，100%自有产业工人，8大主材品牌，环保辅材，包设计，包施工，包主材，18项精包服务，零增项，五不限，人性化设计"> 
	<meta name="keywords" content="爱空间，互联网家装，精装，零增项，五不限，人性化设计，包设计，包施工，包主材，科勒，大自然，马可波罗，博洛尼，西门子，多乐士，友邦吊顶，东方雨虹"> 
	<link rel="stylesheet" type="text/css" href="/assets-new/css/css.css?version=${version }">
	<link rel="stylesheet" type="text/css" href="/assets-new/css/ipad.css?version=${version }">
	<script type="text/javascript" src="/assets-new/js/jquery-1.8.3.min.js?version=${version }"></script>
	<script type="text/javascript" src="/assets-new/js/jquery.cookie.js?version=${version }"></script>
	<script type="text/javascript" src="/assets-new/js/jquery.form.js?version=${version }"></script>
	<script type="text/javascript" src="/assets-new/js/app.js?version=${version }"></script>
	<script type="text/javascript" src="/assets-new/js/jiajian.js?version=${version }"></script>
	<script type="text/javascript" src="/assets-new/layer-v2.0/layer/layer.js?version=${version}"></script>
<%-- 	<script type="text/javascript" src="/assets-new/js/zepto.min.js?version=${version }"></script> --%>
    <script type="text/javascript" src="/assets-new/js/js.js?version=${version}"></script>
    <script type="text/javascript">
    </script>
<decorator:head/>
</head>

<body>
	<!--侧面导航-->
    <nav class="width_16 height_100 ba_333 fl color_fff fos_1_2 nav daohang">
        <div class="text_auto nav_1 shou_ye">
            <a class="color_fff" href="/index">
                <i><img src="/assets-new/img/nav_1.png"></i>
                <p class="fos_1">首页</p>
            </a>
        </div>
        <c:if test="${werks == '101' }">
	        <div>
	            <p><img src="/assets-new/img/nav_2.png">我的任务</p>
	            <ul class="ba_666 text_auto hide" id="wdrw">
	                <li id="wyqd"><a href="/pmProject/pmAchieve" class="nav_a19">我要抢单</a></li>
	                <li id="xmbb"><a href="/publish/list" class="nav_a9">项目播报</a></li>
	               <!--  <li id="fprw"><a href="/package/list" class="nav_a7">任务包分配</a></li> -->
	                <li id="dbrw"><a href="/agency/list" class="nav_a7">待办任务</a></li>
	                <!-- <li id="fprw"><a href="/package/list" class="nav_a7">任务包分配</a></li> -->
	               <!--  <li id="rwbys"><a href="/waiting" class="nav_a7">任务包验收</a></li>
	                <li id="dkjl"><a href="/waiting" class="nav_a7">打款记录</a></li> -->
	            </ul>
        	</div>
        	<div>
				<p><img src="/assets-new/img/nav_2.png">任务包管理</p>
				<ul class="ba_666 text_auto hide" id="rwbgl">
					<li id="rwbfp"><a href="/package/allotPkg" class="nav_a19">任务包分配</a></li>
					<li id="rwbsg"><a href="/package/bulidPkg" class="nav_a9">任务包施工</a></li>
					<li id="ysdgl"><a href="/package/inspectBill" class="nav_a9">验收单管理</a></li>
					<li id="ysdfk"><a href="/package/inspectPay" class="nav_a9">验收单付款</a></li>
				</ul>
			</div>
        </c:if>
        <div>
            <p><img src="/assets-new/img/nav_3.png">进度管理</p>
            <ul class="ba_666 text_auto hide" id="jdgl">
                <li id="qrkg"><a href="/confirmWorkDate/index" class="nav_a3">确认开工</a></li>
                <li id="xcqd"><a href="/pmProject/projectList" class="nav_a13">现场签到</a></li>
                <li id="jdtb"><a href="/wood/woodList" class="nav_a6">木作安装</a></li>
                <li id="jdtb"><a href="/process/list" class="nav_a6">进度通报</a></li>
                <c:if test="${werks == '101' }">
                	<li id="mzaz"><a href="/wood/woodList" class="nav_a15">木作安装</a></li>
                	<li id="tdys"><a href="/complete/check/list" class="nav_a8">特单验收</a></li>
                </c:if>
                <li id="jgsq"><a href="/workComplete/toProjectCompleteList" class="nav_a15">竣工申请</a></li>
            </ul>
        </div>
        <div>
            <p><img src="/assets-new/img/nav_4.png">材料管理</p>
            <ul class="ba_666 text_auto hide" id="clgl">
                <li id="flhl"><a href="/review/toReviewListPage" class="nav_a22">辅料核量</a></li>
                <li id="fhsq"><a href="/stuffAccept/projectList" class="nav_a4">发货申请</a></li>
                <li id="bhsq"><a href="/applyGoods/toApplyGoodsList" class="nav_a5">补货申请</a></li>
            </ul>
        </div>
         <c:if test="${werks == '101' }">
	        <div>
	            <p><img src="/assets-new/img/nav_5.png">项目结算</p>
	            <ul class="ba_666 text_auto hide" id="xgjs">
	                <li id="fyjs"><a href="/settle/settleList" class="nav_a11">费用结算</a></li>
	            </ul>
	        </div>
        </c:if>
        <div>
            <p><img src="/assets-new/img/nav_6.png">个人中心</p>
            <ul class="ba_666 text_auto hide" id="grzx">
                <li id="wdxm"><a href="/pmProject/myProjectList" class="nav_a12">我的项目</a></li>
                <li id="xmtz"><a href="/projectPicture/toProjectPictureList" class="nav_a14">项目图纸</a></li>
                <li id="xdxx"><a href="/msg/list" class="nav_a14">我的消息</a></li>
                <li id="zjbg"><a href="/check/list" class="nav_a16">质检报告</a></li>
                <li id="xgmm"><a href="/modifyPwdUI" class="nav_a14">修改密码</a></li>
            </ul>
        </div>
    </nav>
    <!--右侧-->
    <div class="widht_84 height_100 fr ovf">
        <decorator:body/>
    </div>
</body>
</html>

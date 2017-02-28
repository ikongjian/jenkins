<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!--侧面导航-->
<nav class="nav animate daohang">
    <div class="nav_1 shou_ye">
        <a href="/index">
            <i><img src="/assets-new/4th/img/nav_1.png"></i>
            <p class="fos_1">首页</p>
        </a>
    </div>

    <div class="nav_list">
        <p><img src="/assets-new/4th/img/nav_2.png">我的任务</p>
        <ul id="wdrw">
            <c:if test="${sessionScope.werks == '101' }">
                <%--<li id="wyqd"><a href="/pmProject/pmAchieve">我要抢单</a></li>--%>
                <li id="xmbb"><a href="/publish/list">项目播报</a></li>
            </c:if>
            <li id="dbrw"><a href="/agency/list">待办任务</a></li>
        </ul>
    </div>
    <c:if test="${sessionScope.werks=='101'||sessionScope.werks=='201'||sessionScope.werks=='501'||
                  sessionScope.werks=='103'||sessionScope.werks=='306'||sessionScope.werks=='104'||
                  sessionScope.werks=='602'||sessionScope.werks=='307'||sessionScope.werks=='203'||
                  sessionScope.werks=='405'||sessionScope.werks=='308'}">
        <div class="nav_list">
            <p><img src="/assets-new/4th/img/nav_2.png">任务包</p>
            <ul id="rwbgl">
            	<li id="rwbjh"><a href="/pkg/planList">任务包计划</a></li>
                <li id="rwbfp"><a href="/package/allotPkg">任务包分配</a></li>
                <li id="rwbsg"><a href="/package/bulidPkg">任务包施工</a></li>
                <li id="ysdgl"><a href="/package/inspectBill">验收单管理</a></li>
                <li id="ysdfk"><a href="/package/inspectPay">验收单付款</a></li>
            </ul>
        </div>
    </c:if>
    <div class="nav_list">
        <p><img src="/assets-new/4th/img/nav_3.png">进度管理</p>
        <ul id="jdgl">
            <li id="qrkg"><a href="/confirmWorkDate/index">确认开工</a></li>
            <li id="xcqd"><a href="/pmProject/projectList">现场签到</a></li>
            <li id="jdtb"><a href="/process/list">进度通报</a></li>
            <c:if test="${sessionScope.werks == '101'}">
                <li id="mzaz"><a href="/wood/woodList">安装申请</a></li>
            </c:if>
            <li id="tdys"><a href="/complete/check/list">特单验收</a></li>
            <li id="jgsq"><a href="/workComplete/toProjectCompleteList">竣工申请</a></li>
        </ul>
    </div>
    <div class="nav_list">
        <p><img src="/assets-new/img/nav_4.png">材料管理</p>
        <ul id="clgl">
            <li id="flhl"><a href="/review/toReviewListPage">辅料核量</a></li>
            <li id="fhsq"><a href="/stuffAccept/projectList">发货申请</a></li>
            <li id="bhsq"><a href="/applyGoods/toApplyGoodsList">补货申请</a></li>
            <li id="szsn"><a href="/sand/list">沙子水泥</a></li>
        </ul>
    </div>
    <c:if test="${sessionScope.werks == '101' }">
        <div class="nav_list">
            <p><img src="/assets-new/4th/img/nav_5.png">项目结算</p>
            <ul id="xgjs">
                <li id="fyjs"><a href="/settle/settleList">费用结算</a></li>
            </ul>
        </div>
    </c:if>
    
    <c:if test="${sessionScope.werks == '101' }">
	    <div class="nav_list">
	        <p><img src="/assets-new/img/nav_7.png">施工工艺</p>
	        <ul id="sggy">
	            <li id="sdgc"><a href="/constructiontech/waterElectricityProject">水电工程</a></li>
	            <li id="nwgc"><a href="/constructiontech/clayTileProject">泥瓦工程</a></li>
	            <li id="mggc"><a href="/constructiontech/woodWorkProject">木工工程</a></li>
	            <li id="yggc"><a href="/constructiontech/oilWorkProject">油工工程</a></li>
	            <li id="sgmzaz"><a href="/constructiontech/carpentryInstallationProject">木作安装</a></li>
                <li id="hzdp"><a href="/constructiontech/terraceProject">智恒地坪</a></li>
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
            <li id="fjxm"><a href="/fujian/check/mlist">复检项目</a></li>
            <li id="xgmm"><a href="/modifyPwdUI">修改密码</a></li>
        </ul>
    </div>
</nav>
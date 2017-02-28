<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ikongjian.erp.enums.ComboEnum" %>
<%@page import="com.ikongjian.erp.enums.ErpContractOrderStatusEnum" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<title>订单详情</title>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<style type="text/css">
    .formDetail ul span {width:10rem;}
</style>
    <div class="content">
        <!--订单详情-->
        <div class="title">
            <h2>订单详情</h2>
            <a href="javascript:void(0);" onclick="window.history.go(-1);"><img src="/assets-new/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <div class="formDetail">
            <h4>客户信息</h4>
            <ul class="twoColumn">
                <li>
                    <span>订单编号</span>
                    <p>${order.ordersNo }</p>
                </li>
                <li>
                    <span>产品套餐</span>
                    <p>互联网<en:out enumClass="<%=ComboEnum.class%>" code="${house.productNo }"></en:out></p>
                </li>
                <li>
                    <span>客户姓名</span>
                    <p>${order.userName }</p>
                </li>
                <li>
                    <span>客户电话</span>
                    <p>${order.mobile }</p>
                </li>
                <li>
                    <span>订单状态</span>
                    <p><en:out enumClass="<%=ErpContractOrderStatusEnum.class%>" code="${order.orderStates }"></en:out></p>
                </li>
            </ul>
            <h4>合同金额</h4>
            <ul>
                <li>
                    <span>施工金额</span>
                    <p>
                       <c:if test="${from=='qiangdan' }"> ***</c:if>
                       <c:if test="${from!='qiangdan' }">
                       	<fmt:formatNumber value="${kp.bev1Rpsonst }" pattern="##.##" minFractionDigits="2" />
                       </c:if>
                    </p>
                </li>
                <li>
                    <span>材料金额</span>
                    <p>
                       <c:if test="${from=='qiangdan' }"> ***</c:if>
                       <c:if test="${from!='qiangdan' }">
                       	<fmt:formatNumber value="${kp.dlvVersion }" pattern="##.##" minFractionDigits="2" />
                       </c:if>
                    </p>
                </li>
                <li>
                    <span>总金额</span>
                    <p>
                       	<c:if test="${from=='qiangdan' }"> ***</c:if>
                      	<c:if test="${from!='qiangdan' }">
                      		<fmt:formatNumber value="${kp.prvbe }" pattern="##.##" minFractionDigits="2" />
                      	</c:if>
                       	<c:if test="${not empty bussiness.tcAmount }">
                       		￥${bussiness.tcAmount }
                       	</c:if>
                    </p>
                </li>
            </ul>
            <h4>房屋信息</h4>
            <ul>
                <li>
                    <span>施工地址</span>
                    <p>${region.fullName }</p>
                </li>
                <li>
                    <span>小区名称</span>
                    <p>${house.community }</p>
                </li>
                <li>
                    <span>门牌号</span>
                    <p>${house.building }号楼-${house.unit }单元-${house.room }室</p>
                </li>
                <li>
                    <span>房屋户型</span>
                    <p>
                    	<c:if test="${from=='qiangdan' }"> ***</c:if>
                        <c:if test="${from!='qiangdan' }"> ${house.houseType }</c:if>
                    </p>
                </li>
                <li>
                    <span>合同面积</span>
                    <p>
                    	<c:if test="${from=='qiangdan' }"> ***</c:if>
	                    <c:if test="${from!='qiangdan' }"> ${house.area }平米</c:if>
                    </p>
                </li>
            </ul>
            
            
            
            <h4>施工过程</h4>
            <ul>
                <li>
                	<span>合同开工日期</span>
                    <p><fmt:formatDate value="${bussiness.planWorkingDate }" pattern="yyyy-MM-dd"/></p>
                </li>
                <li>
                	<span>合同竣工日期</span>
                    <p><fmt:formatDate value="${bussiness.planCompleteDate }" pattern="yyyy-MM-dd"/></p>
                </li>
                <li style=" margin-bottom:10px;">
                	<span>合同工期</span>
                    <p>
                    	<c:if test="${not empty bussiness.workDays }">${bussiness.workDays }天</c:if>
                    </p>
                </li>
                <li>
                	<span>实际开工日期</span>
                    <p><fmt:formatDate value="${bussiness.workingDate }" pattern="yyyy-MM-dd"/></p>
                </li>
                <li>
                	<span>隐蔽工程完工日期</span>
                    <p><fmt:formatDate value="${bussiness.wpCheckDate }" pattern="yyyy-MM-dd"/></p>
                </li>
                <li>
                	<span>中期完工日期</span>
                    <p><fmt:formatDate value="${bussiness.midCompleteDate }" pattern="yyyy-MM-dd"/></p>
                </li>
                <li style=" margin-bottom:10px;">
                	<span>木作安装日期</span>
                    <b></b>
                </li>
                <li>
                	<span>实际竣工日期</span>
                    <p><fmt:formatDate value="${bussiness.projectCheckDate }" pattern="yyyy-MM-dd"/></p>
                </li>
                <li style=" margin-bottom:10px;">
                	<span>实际工期</span>
                    <p>
                    	<c:if test="${empty workDays }">未竣工</c:if>
                    	<c:if test="${not empty workDays }">${workDays }天</c:if>
                    </p>
                </li>
                <li>
                	<span>延期总天数</span>
                    <p>
                    	<c:if test="${not empty bussiness.delayDaysY}">
                    		${bussiness.delayDaysY + bussiness.delayDaysN}天
                    	</c:if>
                    </p>
                </li>
                <li>
                	<span>赔付天数</span>
                    <p>
                    	<c:if test="${not empty bussiness.delayDaysY}">
                    		${bussiness.delayDaysY }天
                    	</c:if>
                    </p>
                </li>
                <li>
                	<span>赔付金额</span>
                    <p>
                    	<c:if test="${not empty bussiness.delayDaysY}">
                    		${bussiness.delayDaysY*100 }元
                    	</c:if>
                    </p>
                </li>
            </ul>
            
            <h4>项目团队</h4>
            <ul>
                 <c:if test="${from!='qiangdan' }">
	                	<li>
	                    	<span>客户经理</span>
	                        <p>${customer.name }</>
	                    </li>
	                    <li>
	                    	<span>联系电话</span>
	                        <p>${customer.telephone }</p>
	                    </li>
	                    <li>
	                    	<span>设 计 师 </span>
	                        <p>${designer.name }</p>
	                    </li>
	                    <li>
	                    	<span>联系电话</span>
	                        <p>${designer.telephone }</p>
	                    </li>
	                    <li>
	                    	<span>质 检 员</span>
	                        <p>${qualityWorker.name }</p>
	                    </li>
	                    <li>
	                    	<span>联系电话</span>
	                        <p>${qualityWorker.telephone }</p>
	                    </li>
	                </c:if>
                    <li>
                    	<span>木作安装</span>
                        <p>${carpenter.name }</p>
                    </li>
                    <li>
                    	<span>联系电话</span>
                        <p>${carpenter.telephone }</>
                    </li>
                    <li>
                    	<span>地板安装</span>
                        <p>${floor.name }</p>
                    </li>
                    <li>
                    	<span>联系电话</span>
                        <p>${floor.telephone }</p>
                    </li>
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
        	<h6>订单详情</h6>
        	<a href="javascript:void(0);" onclick="window.history.go(-1);"><img src="/assets-new/img/esc.png"></a>
        </header>
        <div class="content">
        	<!--订单详情-->
            <div class="order">
            	<h2 class="title_h2">客户信息</h2>
                <ul>
                	<li>
                    	<span>订单编号：</span>
                        <b>${order.ordersNo }</b>
                    </li>
                    <li>
                    	<span>产品套餐：</span>
                        <b>互联网<en:out enumClass="<%=ComboEnum.class%>" code="${house.productNo }"></en:out></b>
                    </li>
                    <li>
                    	<span>客户姓名：</span>
                        <b>${order.userName }</b>
                    </li>
                    <li>
                    	<span>客户电话：</span>
                        <b>${order.mobile }</b>
                    </li>
                    <li>
                    	<span>订单状态：</span>
                        <b><en:out enumClass="<%=ErpContractOrderStatusEnum.class%>" code="${order.orderStates }"></en:out></b>
                    </li>
                </ul>
                <h2 class="title_h2">合同金额</h2>
                <ul class="order_ul_li100">
                	<li>
                    	<span>施工金额：</span>
                        <b>
                        	<c:if test="${from=='qiangdan' }"> ***</c:if>
                       		<c:if test="${from!='qiangdan' }"><fmt:formatNumber value="${kp.bev1Rpsonst }" pattern="##.##" minFractionDigits="2" /></c:if>
                        	
                        </b>
                    </li>
                    <li>
                    	<span>材料金额：</span>
                        <b>
                        	<c:if test="${from=='qiangdan' }"> ***</c:if>
                       		<c:if test="${from!='qiangdan' }"><fmt:formatNumber value="${kp.dlvVersion }" pattern="##.##" minFractionDigits="2" /></c:if>
                        </b>
                    </li>
                    <li>
                    	<span>总 金 额：</span>
                        <b>
                        	<c:if test="${from=='qiangdan' }"> ***</c:if>
                       		<c:if test="${from!='qiangdan' }"><fmt:formatNumber value="${kp.prvbe }" pattern="##.##" minFractionDigits="2" /></c:if>
                        	<c:if test="${not empty bussiness.tcAmount }">
                        		￥${bussiness.tcAmount }
                        	</c:if>
                        </b>
                    </li>
                </ul>
                <h2 class="title_h2">房屋信息</h2>
                <ul class="order_ul_li100">
                	<li>
                    	<span>施工地址：</span>
                        <b>${region.fullName }</b>
                    </li>
                    <li>
                    	<span>小区名称：</span>
                        <b>${house.community }</b>
                    </li>
                    <li>
                    	<span>门 牌 号：</span>
                        <b>${house.building }号楼-${house.unit }单元-${house.room }室</b>
                    </li>
                    <li>
                    	<span>房屋户型：</span>
                    	<c:if test="${from=='qiangdan' }"> ***</c:if>
                        <c:if test="${from!='qiangdan' }"> ${house.houseType }</c:if>
                    </li>
                    <li>
                    	<span>合同面积：</span>
                        <b>
	                        <c:if test="${from=='qiangdan' }"> ***</c:if>
	                        <c:if test="${from!='qiangdan' }"> ${house.area }平米</c:if>
                        </b>
                    </li>
                </ul>
                <h2 class="title_h2">施工过程</h2>
                <ul class="order_ul_li100 order_ul_li_span">
                	<li>
                    	<span>合同开工日期：</span>
                        <b><fmt:formatDate value="${bussiness.planWorkingDate }" pattern="yyyy-MM-dd"/></b>
                    </li>
                    <li>
                    	<span>合同竣工日期：</span>
                        <b><fmt:formatDate value="${bussiness.planCompleteDate }" pattern="yyyy-MM-dd"/></b>
                    </li>
                    <li style=" margin-bottom:10px;">
                    	<span>合同工期：</span>
                        <b>
                        	<c:if test="${not empty bussiness.workDays }">${bussiness.workDays }天</c:if>
                        </b>
                    </li>
                    <li>
                    	<span>实际开工日期：</span>
                        <b><fmt:formatDate value="${bussiness.workingDate }" pattern="yyyy-MM-dd"/></b>
                    </li>
                    <li>
                    	<span>隐蔽工程完工日期：</span>
                        <b><fmt:formatDate value="${bussiness.wpCheckDate }" pattern="yyyy-MM-dd"/></b>
                    </li>
                    <li>
                    	<span>中期完工日期：</span>
                        <b><fmt:formatDate value="${bussiness.midCompleteDate }" pattern="yyyy-MM-dd"/></b>
                    </li>
                    <li style=" margin-bottom:10px;">
                    	<span>木作安装日期：</span>
                        <b></b>
                    </li>
                    <li>
                    	<span>实际竣工日期：</span>
                        <b><fmt:formatDate value="${bussiness.projectCheckDate }" pattern="yyyy-MM-dd"/></b>
                    </li>
                    <li style=" margin-bottom:10px;">
                    	<span>实际工期：</span>
                        <b>
                        	<c:if test="${empty workDays }">未竣工</c:if>
                        	<c:if test="${not empty workDays }">${workDays }天</c:if>
                        </b>
                    </li>
                    <li>
                    	<span>延期总天数：</span>
                        <b>
                        	<c:if test="${not empty bussiness.delayDaysY}">
                        		${bussiness.delayDaysY + bussiness.delayDaysN}天
                        	</c:if>
                        </b>
                    </li>
                    <li>
                    	<span>赔付天数：</span>
                        <b>
                        	<c:if test="${not empty bussiness.delayDaysY}">
                        		${bussiness.delayDaysY }天
                        	</c:if>
                        </b>
                    </li>
                    <li>
                    	<span>赔付金额：</span>
                        <b>
                        	<c:if test="${not empty bussiness.delayDaysY}">
                        		${bussiness.delayDaysY*100 }元
                        	</c:if>
                        </b>
                    </li>
                </ul>
                <h2 class="title_h2">项目团队</h2>
                <ul>
	                <c:if test="${from!='qiangdan' }">
	                	<li>
	                    	<span>客户经理：</span>
	                        <b>${customer.name }</b>
	                    </li>
	                    <li>
	                    	<span>联系电话：</span>
	                        <b>${customer.telephone }</b>
	                    </li>
	                    <li>
	                    	<span>设 计 师 ：</span>
	                        <b>${designer.name }</b>
	                    </li>
	                    <li>
	                    	<span>联系电话：</span>
	                        <b>${designer.telephone }</b>
	                    </li>
	                    <li>
	                    	<span>质 检 员：</span>
	                        <b>${qualityWorker.name }</b>
	                    </li>
	                    <li>
	                    	<span>联系电话：</span>
	                        <b>${qualityWorker.telephone }</b>
	                    </li>
	                </c:if>
                    <li>
                    	<span>木作安装：</span>
                        <b>${carpenter.name }</b>
                    </li>
                    <li>
                    	<span>联系电话：</span>
                        <b>${carpenter.telephone }</b>
                    </li>
                    <li>
                    	<span>地板安装：</span>
                        <b>${floor.name }</b>
                    </li>
                    <li>
                    	<span>联系电话：</span>
                        <b>${floor.telephone }</b>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</body> --%>

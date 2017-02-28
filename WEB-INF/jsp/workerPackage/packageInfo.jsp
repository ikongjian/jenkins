<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.ikongjian.erp.enums.WorkerPackageStateEnum"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<title>任务包详情</title>
	<script type="text/javascript">
		$(function() {
            $(function() {
                $(".nav").css("left","-16%");
                $(".nav").removeClass("animate");
                $(".content,.title").css("width","100%");
            });
			$(".task_img img").click(function() {
                layer.open({
                    type:1,
                    area:["905px","580px"],
                    shade:0.3,
                    title:false,
                    shadeClose:false,
                    scrollbar:false,
                    content:"<img src='"+$(this).attr("osrc")+"?arg="+new Date().valueOf()+"'>"
                });
            });
		});
	</script>
</head>
<body>
    <div class="content">
    	<div class="title">
        	<h2>任务包详情</h2>
        	<a href="javascript:void(0);" onclick="window.history.back();"><img src="/assets-new/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <div class="formDetail">
            <h4>基本信息</h4>
            <ul class="twoColumn labelLColumn">
                <li>
                    <span>任务包名称</span>
                    <p>${pack.pkgName}</p>
                </li>
                <li>
                    <span>状态</span>
                    <p><en:out code="${pack.state}" enumClass="<%=WorkerPackageStateEnum.class%>"/></p>
                </li>
                <li>
                    <span>建议工作量</span>
                    <p></p>
                </li>
                <li>
                    <span>价格</span>
                    <p>
                        <c:if test="${!empty inspect.id}">
                            <fmt:formatNumber value="${inspect.settleMoney}" type="number"/>元
                        </c:if>
                        <c:if test="${empty inspect.id}">
                            <fmt:formatNumber value="${pack.pkgMoney}" type="number"/>元
                        </c:if>
                    </p>
                </li>
            </ul>
            <h4>安排施工</h4>
            <ul class="labelLColumn">
                <li>
                    <span>安排施工日期</span>
                    <p><fmt:formatDate value="${pack.startDate }" pattern="yyyy-MM-dd"/>至
                        <fmt:formatDate value="${pack.endDate }" pattern="yyyy-MM-dd"/></p>
                </li>
            </ul>
            <h4>施工信息</h4>
            <ul class="twoColumn labelLColumn">
                <li>
                    <span>施工项目组长</span>
                    <p>${groupVo.groupLeaderName}</p>
                </li>
                <li>
                    <span>施工项目组长电话</span>
                    <p>${groupVo.groupLeaderPhone}</p>
                </li>
            </ul>
            <h4>工序和价格</h4>
            <div class="stepAndPrise">
                <div class="projectForm">
                    <div class="formGroupBox">
                        <c:choose>
                            <c:when test="${!empty procedures}">
                                <c:forEach var="item" items="${procedures}" varStatus="status">
                                    <h5>${status.index+1 }、${item.skuName}</h5>
                                    <div class="formGroup">
                                        <label>价格</label>
                                        <p>${item.price}元/${item.unit}*${item.actualNum}=${item.totalPrice}元</p>
                                    </div>
                                    <div class="formGroup">
                                        <label>工序内容</label>
                                        <p>${item.note}</p>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="item" items="${voList}" varStatus="status">
                                    <h5>${status.index+1 }、${item.skuName}</h5>
                                    <div class="formGroup">
                                        <label>价格</label>
                                        <p>${item.price}元/${item.unit}*${item.actualNum}=${item.totalPrice}元</p>
                                    </div>
                                    <div class="formGroup">
                                        <label>工序内容</label>
                                        <p>${item.note}</p>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <c:if test="${!empty sginTime}">
                <h4>签到／完工时间</h4>
                <ul class="twoColumn labelLColumn">
                    <li>
                        <span>签到时间</span>
                        <p><fmt:formatDate value="${sginTime }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                    </li>
                    <li>
                        <span>完工时间</span>
                        <p><fmt:formatDate value="${pack.completeDate }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                    </li>
                </ul>
            </c:if>
            <c:if test="${!empty imgList1}">
                <h4>施工图片</h4>
                <ul class="buildPic task_img">
                    <c:forEach var="item" items="${imgList1}">
                        <li><img src="${DOMAIN_NAME}${item.imgUrl}"></li>
                    </c:forEach>
                </ul>
            </c:if>
            <c:if test="${!empty imgList2}">
                <h4>项目图纸</h4>
                <ul class="buildPic task_img">
                    <c:forEach var="item" items="${imgList2}">
                        <li><img src="${DOMAIN_NAME}${item.breviaryImgUrl}" osrc="${DOMAIN_NAME}${item.imgUrl}"></li>
                    </c:forEach>
                </ul>
            </c:if>
        </div>
    </div>
</body>
</html>

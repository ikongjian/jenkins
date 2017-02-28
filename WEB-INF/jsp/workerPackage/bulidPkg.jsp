<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ikongjian.erp.enums.WorkerPackageStateEnum"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<title>任务包施工</title>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
<link rel="stylesheet" type="text/css" href="/assets-new/jquery-weui/css/weui.css">
<link rel="stylesheet" type="text/css" href="/assets-new/jquery-weui/css/jquery-weui.css">
<script type="text/javascript" src="/assets-new/jquery-weui/js/jquery-weui.js"></script>
<div class="content">
	<div class="title widht_84">
		<h2 class="color_fff">任务包施工</h2>
		<i><img class="width_100" src="/assets-new/img/nav_0.png"></i>
	</div>
	<hr class="content_hr">
	<table class="table_list" border="0" cellspacing="0" cellpadding="0">
		<tbody>
			<tr class="table_listTr">
				<th scope="col" width="20%">顾客</th>
				<th scope="col" width="13%">任务包</th>
				<th scope="col" width="10%">组长姓名</th>
				<th scope="col" width="10%">安排开始日期</th>
				<th scope="col" width="10%">安排结束日期</th>
				<th scope="col" width="10%">签到日期</th>
				<th scope="col" width="12%">任务包状态</th>
				<th scope="col" width="12%">操作</th>
			</tr>
			<c:forEach var="orderPkg" items="${orderPkgs}">
				<tr>
					<td class="textL">
						<a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${orderPkg.orderNo}">${orderPkg.customerInformation}</a>
					</td>
					<td>
						<a class="td_none" href="/package/threePath/packageInfo?packageId=${orderPkg.id}">${orderPkg.pkgName}</a>
					</td>
					<td>${orderPkg.wgroupLeaderName}</td>
					<td><fmt:formatDate value="${orderPkg.startDate}" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatDate value="${orderPkg.endDate}" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatDate value="${orderPkg.signDate}" pattern="yyyy-MM-dd"/></td>
					<c:choose>
						<c:when test="${orderPkg.state==10}">
							<td class="color007aff">
						</c:when>
						<c:when test="${orderPkg.state==15||orderPkg.state==50}">
							<td class="color0cb326">
						</c:when>
						<c:when test="${orderPkg.state==20||orderPkg.state==40||orderPkg.state==60}">
							<td class="colored6c00">
						</c:when>
						<c:otherwise>
							<td>
						</c:otherwise>
					</c:choose>
					<en:out enumClass="<%=WorkerPackageStateEnum.class%>" code="${orderPkg.state}"/>
					</td>
					<td>
						<c:if test="${orderPkg.state==60}">
							<a href="javascript:void(0);" class="td_an order_inspect" data-ono="${orderPkg.orderNo}"
                                data-pid="${orderPkg.id}" data-ptype="${orderPkg.pkgType}">验收</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script type="text/javascript">
	$(function() {
        $(".order_inspect").click(function() {
            var orderNo=$(this).data("ono");
            var pkgId=$(this).data("pid");
            var pkgType=$(this).data("ptype");
            //泥瓦工程(102) 验证沙子水泥(41)  石膏基自流平工程(109)验证自流平(44)
            if(pkgType=="102"||pkgType=="109") {
                $.ajax({
                    url:"/complete/check/inspectValid",
                    type:"post",
                    data:{orderNo:orderNo,pkgType:pkgType},
                    async:false,
                    cache:false,
                    success:function(result) {
                        if(result!=null&&result.count>0) {
                            if(pkgType=="102") {
                                $.alert("您还未对该项目进行沙子水泥验收，请先在【特单验收】中操作！", "消息");
                            }
                            if(pkgType=="109") {
                                $.alert("您还未对该项目进行自流平验收，请先在【特单验收】中操作！", "消息");
                            }
                        } else {
                            window.location.href="/package/threePath/inspectSign?pkgId="+pkgId+"&orderNo="+orderNo;
                        }
                    }
                });
            } else {
                window.location.href="/package/threePath/inspectSign?pkgId="+pkgId+"&orderNo="+orderNo;
            }
        });
	})
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>待办任务</title>
    <style rel="stylesheet" type="text/css">
        .content_tab + .table_list {
            margin-top:1.6rem;
            border-top: 0.1rem solid #dddee3;
        }
    </style>
    <script type="text/javascript">
    	$(function(){
    		//待办任务
    		$(".content_tab a").click(function(){
    		    var content_tab = $(this).index();
    		    $(".content_tab a").removeClass("stay_tab");
    		    $(this).addClass("stay_tab");
    		    $(this).parent().parent().find("table").hide();
    		    $(this).parent().parent().find("table").eq(content_tab).show()
    		})
    	})
    </script>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
    <!--右侧内容框架-->
    <div class="content">
        <!--待办任务-->
        <div class="title">
            <h2 class="color_fff">待办任务</h2>
            <i><img src="/assets-new/4th/img/nav_0.png"></i>
            <%--<a href="#"><img src="/assets-new/4th/img/esc.png"></a>--%>
        </div>
        <hr class="content_hr">
        <div class="content_tab">
            <a class="stay_tab" href="javascript:void(0);">待开工<span>${workList.size()}</span></a>
            <a href="javascript:void(0);">待申请主材<span>${zcList.size()}</span></a>
            <a href="javascript:void(0);">待水电验收<span>${sdList.size()}</span></a>
            <a href="javascript:void(0);">待墙砖完工<span>${qzList.size()}</span></a>
            <a href="javascript:void(0);">待中期验收<span>${zqList.size()}</span></a>
            <a href="javascript:void(0);">待竣工验收<span>${jgList.size()}</span></a>
        </div>
        <!--待开工-->
        <table class="table_list" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr class="table_listTr">
                    <th scope="col" width="27%">顾客</th>
                    <%--<th scope="col" width="23%">合同开工日期</th>--%>
                    <th scope="col" width="23%">预计开工日期</th>
                    <th scope="col" width="12%">合同工期</th>
                    <th scope="col" width="15%">操作</th>
                </tr>
                <c:forEach var="item" items="${workList }">
                	<tr>
	                    <td class="text_left">
	                    	<a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo }">
                   			  ${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }
	                    	</a>
	                    </td>
	                    <%--<td><fmt:formatDate value="${item.workingDate }" pattern="yyyy-MM-dd"/></td>--%>
	                    <td><fmt:formatDate value="${item.planWorkingDate }" pattern="yyyy-MM-dd"/></td>
	                    <td>${item.workDays }天</td>
	                    <td><a class="td_an" href="/confirmWorkDate/threePath/confirmWorkDatePage?orderNo=${item.orderNo }">开工</a></td>
	                </tr>
                </c:forEach>
            </tbody>
        </table>
        <!--待申请主材-->
        <table class="table_list" border="0" cellspacing="0" cellpadding="0" style="display:none;">
            <tbody>
            <tr class="table_listTr">
                <th scope="col" width="27%">顾客</th>
                <th scope="col" width="23%">发货日程</th>
                <th scope="col" width="23%">申请到货日期</th>
                <th scope="col" width="12%">状态</th>
                <th scope="col" width="15%">操作</th>
            </tr>
            <c:forEach var="item" items="${zcList}">
                <tr>
                    <td class="text_left">
                        <a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${item.ternr }">
                                ${item.community}-${item.building}-${item.unit}-${item.room}-${item.customName}
                        </a>
                    </td>
                    <td>
                        <c:if test="${item.bdart=='10'}">主材第一次</c:if>
                        <c:if test="${item.bdart=='20'}">主材第二次</c:if>
                    </td>
                    <td><fmt:formatDate value="${item.wadat}" pattern="yyyy-MM-dd"/></td>
                    <td>
                        <c:if test="${item.speQiStatus=='0'}">审核</c:if>
                        <c:if test="${item.speQiStatus=='1'}">下达</c:if>
                        <c:if test="${item.speQiStatus=='2'}">拣配</c:if>
                        <c:if test="${item.speQiStatus=='3'}">已出库</c:if>
                        <c:if test="${item.speQiStatus=='4'}">已验收</c:if>
                        <c:if test="${item.speQiStatus=='5'}">结算中</c:if>
                        <c:if test="${item.speQiStatus=='6'}">已结算</c:if>
                        <c:if test="${item.speQiStatus=='7'}">已付款</c:if>
                        <c:if test="${item.speQiStatus=='8'}">删除</c:if>
                    </td>
                    <td>${item.workDays }天</td>
                    <td>
                        <c:if test="${item.bdart=='10'}">
                            <c:choose>
                                <c:when test="${fn:substring(item.vlstk,0,1)=='0'}">
                                    <a class="td_an" href="/stuffAccept/threePath/detailList?projectId=${item.ternr}&batchId=${item.bdart}&vbeln=${item.vbeln}&status=${item.speQiStatus}">详情</a>
                                    <a class="td_an" href="/stuffAccept/threePath/toModifySendTime?projectId=${item.ternr}&batchId=${item.bdart}&areaCode=${item.areaCode}">申请</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="td_an" href="/stuffAccept/threePath/detailList?projectId=${item.ternr}&batchId=${item.bdart}&vbeln=${item.vbeln}&status=${item.speQiStatus}&wadat=<fmt:formatDate value="${item.wadat}" pattern="yyyy-MM-dd"/>">详情</a>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${item.bdart=='20'}">
                            <c:choose>
                                <c:when test="${fn:substring(item.vlstk,1,2)=='0'}">
                                    <a class="td_an" href="/stuffAccept/threePath/detailList?projectId=${item.ternr}&batchId=${item.bdart}&vbeln=${item.vbeln}&status=${item.speQiStatus}">详情</a>
                                    <a class="td_an" href="/stuffAccept/threePath/toModifySendTime?projectId=${item.ternr}&batchId=${item.bdart}&areaCode=${item.areaCode}">申请</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="td_an" href="/stuffAccept/threePath/detailList?projectId=${item.ternr}&batchId=${item.bdart}&vbeln=${item.vbeln}&status=${item.speQiStatus}&wadat=<fmt:formatDate value="${item.wadat}" pattern="yyyy-MM-dd"/>">详情</a>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!--待水电验收-->
        <table class="table_list" border="0" cellspacing="0" cellpadding="0" style="display:none;">
            <tbody>
            <tr class="table_listTr">
                <th scope="col" width="27%">顾客</th>
                <%--<th scope="col" width="23%">合同开工日期</th>--%>
                <th scope="col" width="23%">预计开工日期</th>
                <th scope="col" width="12%">合同工期</th>
                <th scope="col" width="15%">操作</th>
            </tr>
            <c:forEach var="item" items="${sdList}">
                <tr>
                    <td class="text_left">
                        <a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo}">
                                ${item.community}-${item.building}-${item.unit}-${item.room}-${item.userName}
                        </a>
                    </td>
                    <%--<td><fmt:formatDate value="${item.workingDate}" pattern="yyyy-MM-dd"/></td>--%>
                    <td><fmt:formatDate value="${item.planWorkingDate}" pattern="yyyy-MM-dd"/></td>
                    <td>${item.workDays}天</td>
                    <td><a class="td_an" href="/process/threePath/toSetProcess?orderNo=${item.orderNo}">水电验收</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!--待墙砖完工-->
        <table class="table_list" border="0" cellspacing="0" cellpadding="0" style="display:none;">
            <tbody>
            <tr class="table_listTr">
                <th scope="col" width="27%">顾客</th>
                <%--<th scope="col" width="23%">合同开工日期</th>--%>
                <th scope="col" width="23%">预计开工日期</th>
                <th scope="col" width="12%">合同工期</th>
                <th scope="col" width="15%">操作</th>
            </tr>
            <c:forEach var="item" items="${qzList}">
                <tr>
                    <td class="text_left">
                        <a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo}">
                                ${item.community}-${item.building}-${item.unit}-${item.room}-${item.userName}
                        </a>
                    </td>
                    <%--<td><fmt:formatDate value="${item.workingDate}" pattern="yyyy-MM-dd"/></td>--%>
                    <td><fmt:formatDate value="${item.planWorkingDate}" pattern="yyyy-MM-dd"/></td>
                    <td>${item.workDays}天</td>
                    <td><a class="td_an" href="/process/threePath/toSetProcess?orderNo=${item.orderNo}">墙砖验收</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!--待中期验收-->
        <table class="table_list" border="0" cellspacing="0" cellpadding="0" style="display:none;">
            <tbody>
                <tr class="table_listTr">
                    <th scope="col" width="27%">顾客</th>
                    <%--<th scope="col" width="23%">合同开工日期</th>--%>
                    <th scope="col" width="23%">预计开工日期</th>
                    <th scope="col" width="12%">合同工期</th>
                    <th scope="col" width="15%">操作</th>
                </tr>
                <c:forEach var="item" items="${zqList }">
                	<tr>
	                    <td class="text_left">
	                    	<a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo }" class="color_666">
                   			${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }
                   			</a>
	                    </td>
	                    <%--<td><fmt:formatDate value="${item.workingDate }" pattern="yyyy-MM-dd"/></td>--%>
	                    <td>${item.workDays }天</td>
	                    <td>${item.area }</td>
	                    <td><a class="td_an" href="/process/threePath/toSetProcess?orderNo=${item.orderNo }">提报中期验收</a></td>
	                </tr>
                </c:forEach>
            </tbody>
        </table>
        <!--待竣工验收-->
        <table class="table_list" border="0" cellspacing="0" cellpadding="0" style="display:none;">
            <tbody>
                <tr class="table_listTr">
                    <th scope="col" width="29%">顾客</th>
                    <th scope="col" width="15%">合同开工日期</th>
                    <th scope="col" width="15%">合同竣工日期</th>
                    <th scope="col" width="15%">实际开工日期</th>
                    <th scope="col" width="11%">合同工期</th>
                    <th scope="col" width="15%">操作</th>
                </tr>
                <c:forEach var="item" items="${jgList }">
                	<tr>
	                    <td class="text_left">
	                    	<a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo }" class="color_666">
                   			${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }
	                    </td>
	                    <td><fmt:formatDate value="${item.planWorkingDate }" pattern="yyyy-MM-dd"/></td>
	                    <td><fmt:formatDate value="${item.innerCheckDate }" pattern="yyyy-MM-dd"/></td>
	                    <td><fmt:formatDate value="${item.workingDate }" pattern="yyyy-MM-dd"/></td>
	                    <td>${item.workDays }天</td>
	                    <td><a class="td_an" href="/process/threePath/toSetProcess?orderNo=${item.orderNo }">提报竣工验收</a></td>
	                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <!--右侧内容框架结束-->
    <!--本页JS-->
    <script>
        $(function () {
            //隐藏返回按钮
            $(".title a").hide()
        })
    </script>
</body>
</html>
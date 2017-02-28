<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>发货申请列表</title>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
    <!--右侧内容框架-->
    <div class="content">
        <!--发货申请列表-->
        <div class="title">
            <h2 class="color_fff">发货申请列表</h2>
            <i><img src="/assets-new/4th/img/nav_0.png"></i>
            <%--<a href="#"><img src="/assets-new/4th/img/esc.png"></a>--%>
        </div>
        <hr class="content_hr">
        <div class="content_notes">如果【主材第一次、主材第二次】看不到，请联系【工程部调度】进行材料审核</div>
        <table class="table_list" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr class="table_listTr">
                    <th scope="col" width="30%">顾客</th>
                    <th scope="col" width="20%">发货日期</th>
                    <th scope="col" width="15%">申请到货日期</th>
                    <th scope="col" width="20%">状态</th>
                    <th scope="col" width="15%">操作</th>
                </tr>
                <c:forEach var="item" items="${list}">
					<tr>
						<td class="text_left">
							<a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${item.ternr}">
								${item.community}${item.building}-${item.unit}-${item.room}-${item.customName}
							</a>
						</td>
						<td>
							<c:if test="${item.bdart=='10'}">主材第一次</c:if>
							<c:if test="${item.bdart=='20'}">主材第二次</c:if>
							<c:if test="${item.bdart=='30'}">辅料第一次</c:if>
							<c:if test="${item.bdart=='40'}">辅料第二次</c:if>
							<c:if test="${item.bdart=='50'}">木作第一次</c:if>
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
							<c:if test="${item.bdart=='30'||item.bdart=='40'}">
								<c:choose>
									<c:when test="${fn:substring(item.vlstk,2,3)=='0'}">
										<a class="td_an" href="/stuffAccept/threePath/detailList?projectId=${item.ternr}&batchId=${item.bdart}&vbeln=${item.vbeln}&status=${item.speQiStatus}">详情</a>
										<a class="td_an" href="/stuffAccept/threePath/toModifySendTime?projectId=${item.ternr}&batchId=${item.bdart}&areaCode=${item.areaCode}">申请</a>
									</c:when>
									<c:otherwise>
										<a class="td_an" href="/stuffAccept/threePath/detailList?projectId=${item.ternr}&batchId=${item.bdart}&vbeln=${item.vbeln}&status=${item.speQiStatus}&wadat=<fmt:formatDate value="${item.wadat}" pattern="yyyy-MM-dd"/>">详情</a>
									</c:otherwise>
								</c:choose>
							</c:if>
							<c:if test="${item.bdart=='50'}">
								<c:choose>
									<c:when test="${fn:substring(item.vlstk,3,fn:length(item.vlstk))=='0'}">
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<meta name="format-detection" content="telephone=no" />
<link rel="stylesheet" type="text/css" href="/assets-new/wx/css/css.css">
<script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/assets-new/layer-v2.0/layer/layer.js"></script>
<title>任务详情</title>
<script type="text/javascript">
		$(function() {
			$(".task_details_text img").click(function() {
                layer.open({
                    type:1,
                    area:["286px","380px"],
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
	<!--任务详情-->
    <div class="task_details">
    	<!--任务名称-->
    	<div class="task_details_text">
            <h2 class="task_title">任务名称</h2>
            <p>
                <span>${pa.pkgName }</span>
            </p>
        </div>
        <!--价钱-->
        <c:if test="${pa.dispatType==1}">
            <div class="task_details_text">
                <h2 class="task_title">价钱</h2>
                <p>
                <span>
                	<c:if test="${!empty inspect.id}">
                        <fmt:formatNumber value="${inspect.settleMoney}" type="number"/>元，
                        其中：工序总金额<fmt:formatNumber value="${inspect.procedureMoney}" type="number"/>元，
                        辅料总金额<fmt:formatNumber value="${inspect.excipientMoney}" type="number"/>元
                    </c:if>
                   	<c:if test="${empty inspect.id}">
                        <fmt:formatNumber value="${pa.pkgMoney}" type="number"/>元
                    </c:if>
                </span>
                </p>
            </div>
        </c:if>
        <!--要求时间-->
    	<div class="task_details_text">
            <h2 class="task_title">要求时间</h2>
            <p>
                <span><fmt:formatDate value="${pa.startDate }" pattern="yyyy-MM-dd"/> 至 
                <fmt:formatDate value="${pa.endDate }" pattern="yyyy-MM-dd"/></span>
            </p>
        </div>
        <!--施工地点-->
    	<div class="task_details_text">
            <h2 class="task_title">施工地点</h2>
            <p>
                <span><%-- ${pa.fullName }- --%>${pa.community }${pa.building }-${pa.unit }-${pa.room }-${pa.userName }</span>
            </p>
        </div>
        <!--工序和价格-->
    	<div class="task_details_text">
            <c:if test="${pa.dispatType==1}">
                <h2 class="task_title">
                    工序和价格
                    <c:if test="${!empty inspect.id}">
                        （工序总金额<fmt:formatNumber value="${inspect.procedureMoney}" type="number"/>元）
                    </c:if>
                </h2>
            </c:if>
            <c:if test="${pa.dispatType==2}">
                <h2 class="task_title">
                    工序明细
                </h2>
            </c:if>
            <c:choose>
            	<c:when test="${!empty procedures}">
            		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		            	<c:forEach var="item" items="${procedures}" varStatus="status">
                            <c:if test="${pa.dispatType==1}">
                                <tr>
                                    <th colspan="2" scope="col">${status.index+1}、${item.skuName}</th>
                                </tr>
                                <tr>
                                    <td class="task_details_texttd" width="18%">价格</td>
                                    <td width="82%">${item.price}元/${item.unit}*${item.actualNum}=${item.totalPrice}元</td>
                                </tr>
                            </c:if>
                            <c:if test="${pa.dispatType==2}">
                                <tr>
                                    <th colspan="2" scope="col">${status.index+1}、${item.skuName}&nbsp;&nbsp;${item.actualNum}${item.unit}</th>
                                </tr>
                            </c:if>
			                <tr>
			                	<td class="task_details_texttd">工序内容</td>
                                <td>${item.note}</td>
			                </tr>
		                </c:forEach>
           			</table>
            	</c:when>
            	<c:otherwise>
	            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		            	<c:forEach var="item" items="${voList }" varStatus="status">
                            <c:if test="${pa.dispatType==1}">
                                <tr>
                                    <th colspan="2" scope="col">${status.index+1}、${item.skuName}</th>
                                </tr>
                                <tr>
                                    <td class="task_details_texttd" width="18%">价格</td>
                                    <td width="82%">${item.price}元/${item.unit}*${item.actualNum}=${item.totalPrice}元</td>
                                </tr>
                            </c:if>
                            <c:if test="${pa.dispatType==2}">
                                <tr>
                                    <th colspan="2" scope="col">${status.index+1}、${item.skuName}&nbsp;&nbsp;${item.actualNum}${item.unit}</th>
                                </tr>
                            </c:if>
			                <tr>
			                	<td class="task_details_texttd">工序内容</td>
                                <td>${item.note}</td>
			                </tr>
		                </c:forEach>
		            </table>
            	</c:otherwise>
            </c:choose>
        </div>
        <c:if test="${pa.dispatType==1}">
            <%--辅料核算--%>
            <c:if test="${!empty excipients}">
                <div class="task_details_text">
                    <h2 class="task_title">辅料核算（辅料总金额<fmt:formatNumber value="${inspect.excipientMoney}" type="number"/>元）</h2>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <th scope="col">SKU</th>
                            <th scope="col">辅料名称</th>
                            <th scope="col">单位</th>
                            <th scope="col">实际用量</th>
                        </tr>
                        <c:forEach items="${excipients}" var="excipient">
                            <tr>
                                <td class="task_details_texttd" width="15%">${excipient.skuNo}</td>
                                <td class="task_details_texttd" width="55%">${excipient.skuName}</td>
                                <td class="task_details_texttd" width="15%">${excipient.unit}</td>
                                <td class="task_details_texttd" width="15%">${excipient.actualNum}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </c:if>
            <%--结算付款--%>
            <c:if test="${inspect.pkgStatus==90}">
                <div class="task_details_text">
                    <h2 class="task_title">结算付款</h2>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <th colspan="2" scope="col">1、首款</th>
                        </tr>
                        <tr>
                            <td class="task_details_texttd" width="18%">应付金额</td>
                            <td width="82%">${vo.fMMoney}</td>
                        </tr>
                        <tr>
                            <td class="task_details_texttd" width="18%">质保金</td>
                            <td width="82%">${vo.fDepositMoney}</td>
                        </tr>
                        <tr>
                            <td class="task_details_texttd" width="18%">税金</td>
                            <td width="82%">${vo.FTaxes}</td>
                        </tr>
                        <tr>
                            <td class="task_details_texttd" width="18%">其他扣款</td>
                            <td width="82%">${vo.fODeductions}</td>
                        </tr>
                        <tr>
                            <td class="task_details_texttd" width="18%">实付金额</td>
                            <td width="82%">${vo.fMoney}</td>
                        </tr>
                        <tr>
                            <td class="task_details_texttd" width="18%">备注</td>
                            <td width="82%">${vo.fMemo}</td>
                        </tr>
                        <tr>
                            <th colspan="2" scope="col">2、应付尾款</th>
                        </tr>
                        <tr>
                            <td class="task_details_texttd" width="18%">应付金额</td>
                            <td width="82%">${vo.nEMoney}</td>
                        </tr>
                    </table>
                </div>
            </c:if>
            <c:if test="${inspect.pkgStatus==95}">
                <div class="task_details_text">
                    <h2 class="task_title">结算付款</h2>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <th colspan="2" scope="col">1、首款</th>
                        </tr>
                        <tr>
                            <td class="task_details_texttd" width="18%">应付金额</td>
                            <td width="82%">${vo.fMMoney}</td>
                        </tr>
                        <tr>
                            <td class="task_details_texttd" width="18%">质保金</td>
                            <td width="82%">${vo.fDepositMoney}</td>
                        </tr>
                        <tr>
                            <td class="task_details_texttd" width="18%">税金</td>
                            <td width="82%">${vo.FTaxes}</td>
                        </tr>
                        <tr>
                            <td class="task_details_texttd" width="18%">其他扣款</td>
                            <td width="82%">${vo.fODeductions}</td>
                        </tr>
                        <tr>
                            <td class="task_details_texttd" width="18%">实付金额</td>
                            <td width="82%">${vo.fMoney}</td>
                        </tr>
                        <tr>
                            <td class="task_details_texttd" width="18%">备注</td>
                            <td width="82%">${vo.fMemo}</td>
                        </tr>
                        <tr>
                            <th colspan="2" scope="col">2、尾款</th>
                        </tr>
                        <tr>
                            <td class="task_details_texttd" width="18%">应付金额</td>
                            <td width="82%">${vo.eMMoney}</td>
                        </tr>
                            <%--<tr>
                                <td class="task_details_texttd" width="18%">质保金</td>
                                <td width="82%">${vo.eDepositMoney}</td>
                            </tr>--%>
                        <tr>
                            <td class="task_details_texttd" width="18%">税金</td>
                            <td width="82%">${vo.eTaxes}</td>
                        </tr>
                        <tr>
                            <td class="task_details_texttd" width="18%">其他扣款</td>
                            <td width="82%">${vo.eODeductions}</td>
                        </tr>
                        <tr>
                            <td class="task_details_texttd" width="18%">实付金额</td>
                            <td width="82%">${vo.eMoney}</td>
                        </tr>
                        <tr>
                            <td class="task_details_texttd" width="18%">备注</td>
                            <td width="82%">${vo.eMemo}</td>
                        </tr>
                    </table>
                </div>
            </c:if>
        </c:if>
        <c:if test="${not empty imgList and imgList.size()>0 }">
        	<div class="task_details_text">
                <h2 class="task_title">项目图纸</h2>
                <ul>
                    <c:forEach var="item" items="${imgList }" varStatus="state">
                            <img src="${DOMAIN_NAME}${item.breviaryImgUrl}" osrc="${DOMAIN_NAME}${item.imgUrl}">
                        </li>
                    </c:forEach>
                </ul>
            </div>
		</c:if>
        <a class="not_task_tel" href="tel:${pa.projectManageTelephone }">联系项目经理</a>
    </div>
</body>
</html>

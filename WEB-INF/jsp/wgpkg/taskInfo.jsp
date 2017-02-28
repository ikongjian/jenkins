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
<link rel="stylesheet" type="text/css" href="/assets-new/pkgapp/css/css.css">
<script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/assets-new/layer-v2.0/layer/layer.js"></script>
<title>任务详情</title>
<script type="text/javascript">
    $(function() {
        //赋值高
        witH($(".taskImg"),"a");
        $(".taskImg img").click(function() {
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
    function witH(me,mefind){
        var width = me.find(mefind).width();
        me.find(mefind).height(width);
    }
</script>
</head>
<body>
<section class="task">
    <div class="taskText taskData">
        <p>
            <span>名称：</span>
            <em>${pa.pkgName}</em>
        </p>
        <p>
            <span>价格：</span>
            <em>
                <c:if test="${!empty inspect.id}">
                    <fmt:formatNumber value="${inspect.settleMoney}" type="number"/>元
                </c:if>
                <c:if test="${empty inspect.id}">
                    <fmt:formatNumber value="${pa.pkgMoney}" type="number"/>元
                </c:if>
            </em>
        </p>
        <p>
            <span>时间：</span>
            <em>
                <fmt:formatDate value="${pa.startDate}" pattern="yyyy-MM-dd"/> 至
                <fmt:formatDate value="${pa.endDate}" pattern="yyyy-MM-dd"/>
            </em>
        </p>
        <p>
            <span>地点：</span>
            <em>${pa.community}-${pa.building}-${pa.unit}-${pa.room}-${pa.userName}</em>
        </p>
    </div>

    <div class="taskDetails">
        <h2>工序与价格</h2>
        <ul>
            <c:choose>
                <c:when test="${!empty procedures}">
                    <c:forEach var="item" items="${procedures}">
                        <li>
                            <div class="taskDl">
                                <img src="/assets-new/pkgapp/img/task5.png">
                                <hr>
                            </div>
                            <div class="taskDr">
                                <h3>${item.skuName}</h3>
                                <p>${item.price}元/${item.unit}*${item.actualNum}=${item.totalPrice}元</p>
                                <p>${item.note}</p>
                            </div>
                        </li>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <c:forEach var="item" items="${voList}">
                        <li>
                            <div class="taskDl">
                                <img src="/assets-new/pkgapp/img/task5.png">
                                <hr>
                            </div>
                            <div class="taskDr">
                                <h3>${item.skuName}</h3>
                                <p>${item.price}元/${item.unit}*${item.actualNum}=${item.totalPrice}元</p>
                                <p>${item.note}</p>
                            </div>
                        </li>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </ul>
        <c:if test="${inspect.pkgStatus==90}">
            <h2>结算付款</h2>
            <div class="taskMoney">
                <h3>首款</h3>
                <p>
                    <em>应付金额：</em>
                    <span>${vo.fMMoney}</span>
                </p>
                <p>
                    <em>质保金：</em>
                    <span>${vo.fDepositMoney}</span>
                </p>
                <p>
                    <em>税金：</em>
                    <span>${vo.FTaxes}</span>
                </p>
                <p>
                    <em>实付金额：</em>
                    <span>${vo.fMoney}</span>
                </p>
                <p>
                    <em>备注：</em>
                    <span>${vo.fMemo}</span>
                </p>
            </div>
            <div class="taskMoney">
                <h3>应付尾款</h3>
                <p>
                    <em>应付金额：</em>
                    <span>${vo.nEMoney}</span>
                </p>
            </div>
        </c:if>
        <c:if test="${inspect.pkgStatus==95}">
            <h2>结算付款</h2>
            <div class="taskMoney">
                <h3>首款</h3>
                <p>
                    <em>应付金额：</em>
                    <span>${vo.fMMoney}</span>
                </p>
                <p>
                    <em>质保金：</em>
                    <span>${vo.fDepositMoney}</span>
                </p>
                <p>
                    <em>税金：</em>
                    <span>${vo.FTaxes}</span>
                </p>
                <p>
                    <em>实付金额：</em>
                    <span>${vo.fMoney}</span>
                </p>
                <p>
                    <em>备注：</em>
                    <span>${vo.fMemo}</span>
                </p>
            </div>
            <div class="taskMoney">
                <h3>尾款</h3>
                <p>
                    <em>应付金额：</em>
                    <span>${vo.eMMoney}</span>
                </p>
                <%--<p>
                    <em>质保金：</em>
                    <span>${vo.eDepositMoney}</span>
                </p>--%>
                <p>
                    <em>税金：</em>
                    <span>${vo.eTaxes}</span>
                </p>
                <p>
                    <em>实付金额：</em>
                    <span>${vo.eMoney}</span>
                </p>
                <p>
                    <em>备注：</em>
                    <span>${vo.eMemo}</span>
                </p>
            </div>
        </c:if>
        <c:if test="${!empty imgList}">
            <h2>项目图纸</h2>
            <div class="taskImg">
                <c:forEach var="item" items="${imgList}">
                    <a href="javascript:void(0);">
                        <img src="${DOMAIN_NAME}${item.breviaryImgUrl}" osrc="${DOMAIN_NAME}${item.imgUrl}" width="100px;" height="100px;">
                    </a>
                </c:forEach>
            </div>
        </c:if>
    </div>
</section>
</body>
</html>

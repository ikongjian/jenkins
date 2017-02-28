<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp" %>
<style type="text/css">
    .veiw_table tr.numChange td {
        background:#fff7ec;
    }

    .veiw_table .dataTR input.J_num {
        width:100%;
    }

    input[type=button] {
        margin-top:1rem;
        width:100%;
        height:4.16rem;
        font-size:2rem;
        background:#ed6c00;
        border-radius:0.5rem;
        color:#fff;
    }
</style>
<div class="content">
    <div class="title">
        <h2>收货明细</h2>
        <a href="/complete/check/threePath/inspect?orderNo=${orderNo}"><img src="/assets-new/img/esc.png"></a>
    </div>
    <hr class="content_hr">
    <div class="orderBaseInfo">
        <ul>
            <li><span>发货单号：</span>
                ${specialsVo.materialNo}
            </li>
            <li>
                <span>采购内容：</span>台面
            </li>
            <li><span>订单状态：</span>
                <c:if test="${specialsVo.statu=='0'}">审核</c:if>
                <c:if test="${specialsVo.statu=='3'}">已收货</c:if>
            </li>
            <li><span>交货日期：</span>
                <fmt:formatDate value="${specialsVo.sendDate}" pattern="yyyy-MM-dd"/>
            </li>
        </ul>
    </div>
    <input type="hidden" id="flag" value="${flag}">
    <input type="hidden" id="cityCode" value="${cityCode}">
    <input type="hidden" name="submitToken" value="${submitToken}"/>
    <input type="hidden" name="orderNo" value="${orderNo}"/>
    <!--收货明细-->
    <table class="table_list veiw_table" border="0" cellspacing="0" cellpadding="0">
        <tr class="table_listTr">
            <th scope="col" width="15%">商品编号</th>
            <th scope="col" width="15%">商品名称</th>
            <th scope="col" width="10%">单位</th>
            <th scope="col" width="10%">采购数量</th>
            <th scope="col" width="12%">实收数量</th>
            <th scope="col" width="25%">备注</th>
        </tr>
        <c:forEach items="${basins}" var="basin">
            <tr>
                <td>
                        ${basin.matnr}
                </td>
                <td>
                        ${basin.maktg}
                </td>
                <td>
                        ${basin.meins}
                </td>
                <td>
                    <fmt:formatNumber type="number" value="${basin.lfimg}"/>
                </td>

                <td>
                    <fmt:formatNumber type="number" value="${basin.ormng}"/>
                </td>
                <td>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="projectForm">
        <div class="formGroupBox">
            <div class="formGroup">
                <label>验收人</label>
                <p>${realName}</p>
            </div>
        </div>
        <div class="submitWrap">
            <button id="submitId" class="inputSubmit" onclick="window.location.href='/complete/check/threePath/inspect?orderNo=${orderNo}'">返回</button>
        </div>
    </div>
</div>
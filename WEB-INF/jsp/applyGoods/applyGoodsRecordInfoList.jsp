<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<title>补货申请查看</title>

    <%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <div class="content">
        <div class="title">
            <h2>补货申请查看</h2>
            <a href="#" onclick="window.location.href='/applyGoods/threePath/toApplyGoodsRecordList?orderNo=${orderNo}&werks=${werks }'"><img src="/assets-new/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <div class="orderBaseInfo">
            <ul>
                <li><span>期望送货日期：</span><fmt:formatDate value="${erpLikp.wadat }" pattern="yyyy-MM-dd"/></li>
                <li><span>补货原因：</span>${erpLikp.tpqua}</li>
                <li><span>状态：</span><en:out enumClass="<%=com.ikongjian.erp.enums.ErpLikpStateEnum.class %>" code="${erpLikp.speQiStatus}"/></li>
            </ul>
        </div>
        <table class="table_list" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr class="table_listTr">
                    <th width="10%">序号</th>
                    <th width="15%">SKU</th>
                    <th width="20%">名称</th>
                    <th width="10%">单位</th>
                    <th width="15%">申请数量</th>
                    <th width="15%">单价</th>
                    <th width="15%">总价</th>
                </tr>
                <c:forEach var="item" items="${psList }" varStatus="index">
					<tr>        
	                	 <td>${index.index+1 }</td>
	                    <td>${item.matnr }</td>
	                  
	                    <td class="td_name">${item.maktg }</td>
	                    <td>${item.meins }</td>  
	                    <td>
	                       ${item.num }
	                    </td>
	                    <td>${item.price }</td>
	                    <td id="priceNum">${item.priceNum }</td>
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
            $(".nav").css("left","-16%");
            $(".nav").removeClass("animate");
            $(".content,.title").css("width","100%");
        })
    </script>


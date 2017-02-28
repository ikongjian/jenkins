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
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<title>补货申请单列表</title>
<script type="text/javascript">
$(function(){
    $(".nav").css("left","-16%");
    $(".nav").removeClass("animate");
    $(".content,.title").css("width","100%");
	var returnMsg = '${resultMsg}';
	if(returnMsg!=null&&returnMsg.length > 0){
		//弹出层
		layer.alert(returnMsg, {icon:1},function(){
			window.location.reload(true);
		});
	}
});
</script>
</head>

<body>
    <div class="content frame">
    	<div class="title">
        	<h2>补货申请单列表</h2>
        	<a href="#" onclick="window.location.href='/applyGoods/toApplyGoodsList'"><img src="/assets-new/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        	<!--补货申请单列表-->
            <table class="table_list" border="0" cellspacing="0" cellpadding="0">
                <tr class="table_listTr">
                	<th scope="col" width="25%">申请批次</th>
                    <th scope="col" width="25%">申请时间</th>
                    <th scope="col" width="35%">状态</th>
                    <th scope="col" width="15%">操作</th>
				</tr>
				<c:set var="count" value="${kpList.size()+1 }"></c:set>
				<c:forEach var="item" items="${kpList }" varStatus="status">
					<tr>        
	                	<td>第${count-1}次申请</td>
	                    <td><fmt:formatDate value="${item.erdat }" pattern="yyyy-MM-dd"/></td>
	                    <td>
	                  	${item.fhStatus}
	                    </td>
	                    <td>
                            <a class="td_an" href="/applyGoods/threePath/toApplyGoodsRecordInfoList?orderNo=${orderNo }&vbeln=${item.vbeln }&werks=${werks}&status=${item.bjStatus }">查看明细</a>
	                    <%--<input class="delete"
	                    onclick="window.location.href='/applyGoods/threePath/toApplyGoodsRecordInfoList?orderNo=${orderNo }&vbeln=${item.vbeln }&werks=${werks}&status=${item.bjStatus }'"
	                    type="button" value="查看明细">--%>
	                    </td>        
	                </tr> 
	                	<c:set var="count" value="${count-1}"></c:set>
				</c:forEach>
			</table>
    </div>
</body>
</html>


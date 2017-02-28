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
<title>添加银行卡</title>
<style type="text/css">
	.trChange td {background:#fff7ec;}
</style>
<script type="text/javascript">
	$(function(){
		$("table tr").each(function(){
    		if($(this).data("cardtag") == '1'){
    			$(this).attr("class","trChange");
    		}
    	});
	})
	function choiceCard(){
		var idStr = "";
		$("input[name=cardIds]:checked").each(function(){
			idStr+=$(this).val()+",";
		});
		$("input[name=cardIdsStr]").val(idStr);
		document.cardForm.submit();
	}
</script>
</head>

<body>
    <!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>添加银行卡</h6><!-- onclick="winBack();" -->
        	<a href="/settle/threePath/toDispaterCard?orderNo=${orderNo }&settleNo=${settleNo }" ><img src="/assets-new/img/esc.png"></a>
        </header>
        <div class="content">
            <form action="/settle/choiceCard" method="post" name="cardForm">
               <input type="hidden" name="orderNo" value="${orderNo }">
               <input type="hidden" name="cardIdsStr">
               <input type="hidden" name="settleNo" value="${settleNo }">
            </form>
        	<!--选取新材料-->
            <table class="table_1 table_2" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="quote_tr">
                	<th scope="col" width="20%">工人姓名</th>
                    <th scope="col" width="20%">工种</th>
                    <th scope="col" width="20%">银行</th>
                    <th scope="col" width="30%">分配打款记录</th>
                    <th scope="col" width="10%">操作</th>
				</tr>
				<c:forEach var="item" items="${cardList }">
					<tr data-cardTag="${item.cardTag }">        
	                	<td>${item.memberName }</td>
	                    <td>${item.category }</td>
	                    <td>${item.bankName }</td>
	                    <td>
	                    	<c:if test="${empty item.logList }">无</c:if>
	                    	<c:if test="${not empty item.logList }">
	                    		<c:forEach var="logItem" items="${item.logList }" varStatus="status">
	                    			<fmt:formatDate value="${logItem.createTime }" pattern="yyyyMMdd"/>已分配打款
	                    			<fmt:formatNumber value="${logItem.money }" pattern="00.00"/>元；
	                    			<c:if test="${!status.last }"><br></c:if>
	                    		</c:forEach>
	                    	</c:if>
	                    </td>  
	                    <td>
	                         <img class="xz1" src="/assets-new/img/xz1.png">
	                         <img class="xz2" src="/assets-new/img/xz2.png">
	                         <input class="input_none xz"  name="cardIds" type="checkbox" value="${item.id }" >
	                    </td>        
	                </tr>
				</c:forEach>
			</table>
            <input class="ok" onclick="choiceCard()" type="button" value="选好了">
        </div>
    </div>
</body>
</html>

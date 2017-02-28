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
<title>查看结算明细</title>
<script type="text/javascript">
	$(function(){
		var updateFlag ='${updateFlag}';
		if(updateFlag!=null&&updateFlag=='updateFlag'){
			alert("确认成功！");
		}
		$("#initTable").rowspanCol(0);
	});
	jQuery.fn.rowspanCol = function(colIdx) { //封装的一个JQuery小插件 
			return this.each(function(){ 
			var that; 
			var htmlStr = "";
			$('tr', this).each(function(row) { 
				$('td:eq('+colIdx+')', this).filter(':visible').each(function(col) { 
						if (that!=null && $(this).attr('id') == $(that).attr('id')) { 
							if($(this).html() != ""){
								htmlStr = $(this).html();
							}
							rowspan = $(that).attr("rowSpan"); 
							if (rowspan == undefined) { 
								$(that).attr("rowSpan",1); 
								rowspan = $(that).attr("rowSpan"); 
							} 
							rowspan = Number(rowspan)+1; 
							$(that).attr("rowSpan",rowspan); 
							$(that).html(htmlStr);
							$(this).hide(); 
						} else { 
							that = this; 
							if($(that).html() != ""){
								htmlStr = $(that).html();
							}else{
								htmlStr = "";
							}
						} 
					}); 
				}); 
			}); 
		}
</script>
</head>

<body>
<!--3级页面框架-->
<div class="right frame"> 
  	<!--头部-->
  	<header>
        <h6>查看结算明细</h6>
        <a href="/settle/settleList"><img src="/assets-new/img/esc.png"></a>
    </header>
  	<!--查看结算明细-->
  	<table id="initTable" class="table_1 table_2 table_3 table_3_1"  width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td id="td1" class="grey" colspan="2">项目合同编码</td>
      <td>${vo.orderNo }</td>
    </tr>
    <tr>
      <td id="td2" class="grey" colspan="2" width="50%">项目名称</td>
      <td width="50%">${vo.community }${vo.building }-${vo.unit }-${vo.room }-${vo.userName }</td>
    </tr>
    <tr>
      <td id="td3" class="grey" colspan="2">建筑面积（㎡）</td>
      <td><fmt:formatNumber value="${vo.area }" pattern="00.00"/></td>
    </tr>
    <tr>
      <td id="td4" class="grey" colspan="2">个性化合同价（元）</td>
      <td>
      	<c:if test="${settle.individuationMoney == null }">0.00</c:if>
      	<c:if test="${settle.individuationMoney != null }">${settle.individuationMoney }</c:if>
      </td>
    </tr>
    <c:forEach	var="item" items="${settleDetailList }">
    	<tr>
	      <td class="grey" id="${item.feeType }">
	      	<c:if test="${item.feeType == 1 }">总结算费用</c:if>
	      	<c:if test="${item.feeType == 2 }">已发生费用</c:if>
	      	<c:if test="${item.feeType == 3 }">扣款</c:if>
	      	<c:if test="${item.feeType == 4 }">不计入考核费用</c:if>
	      	<c:if test="${item.feeType == 5 }">项目罚款</c:if>
	      </td>
	      <td class="grey">${item.feeItem }</td>
	      <td>
	      	<c:if test="${item.total == null}">0.00</c:if>
	      	<c:if test="${item.total != null}">
	      		<c:if test="${item.total.unscaledValue() == 0}">0.00</c:if>
		      	<c:if test="${item.total.unscaledValue() != 0}">
		      		<c:if test="${item.direct == '-'}">${item.direct}</c:if>
		      		${item.total }
		      	</c:if>
	      	</c:if>
	      </td>
	    </tr>
    </c:forEach>
    	<tr>
	      <td id="tdLast" class="grey" colspan="2">实际结算金额<!-- （6）=（1）-（2）-（3）+（4）-（5） --></td>
	      <td>${finalCost }</td>
	    </tr>
  	</table>
  	<c:if test="${settle.state == 20 }">
  	   <form action="/settle/updateState" method="post" name="stateForm">
  	   		<input type="hidden" name="orderNo" value="${settle.contractNo }">
  	   		<input type="hidden" name="settleNo" value="${settle.settleNo }">
  	   		<input type="submit" class="ok" value="确认无误">
  	   </form>
  	</c:if>
</div>
</body>
</html>

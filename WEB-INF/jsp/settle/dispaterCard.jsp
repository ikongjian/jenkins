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
<title>分配打款明细</title>
<script src="/assets-new/js/Tc1.js"></script>
<style type="text/css">
	.trChange td {background:#fff7ec;}
</style>
<script type="text/javascript">
    $(function(){
    	var saveFlag = '${saveFlag}';
    	if(saveFlag!=null&&saveFlag.length>0){
    		alert(saveFlag);
    		window.location.href='/settle/settleList';
    		return;
    	}
    	totalMoneyfunc();
    	
    	$("table tr").each(function(){
    		if($(this).data("cardtag") == '1'){
    			$(this).attr("class","trChange");
    		}
    	});
    	/* var totalSum = 0;
		$("input[name=money]").each(function(){
			var thisDate = $(this).val();
			if(thisDate == null || thisDate.trim().length == 0){
				thisDate = 0;
			}
			totalSum = totalSum + parseFloat(thisDate);
		})
		$("#totalSum").html(totalSum.toFixed(2)); */
    })
	function addCard(){
    	var memberBankCardIds = "";
    	$("input[name=memberBankCardId]").each(function(){
    		memberBankCardIds += $(this).val()+",";
    	});
    	$("#memberCardIds").val(memberBankCardIds);
		var form = $("form[name=saveForm]");
		form.attr("action","/settle/threePath/toPMAllCard");
		form.submit();
	}
	function deleteCard(cardId){
		$.post("/settle/deleteCard",
				{
					cardId:cardId,
					orderNo:$("input[name=orderNo]").val()
				},
				function(data){
				alert(data.result);
				if(data.resultCode == 'ok'){
					$("#tr_"+cardId).remove();
					totalMoneyfunc();
					/* var totalSum = 0;
					$("input[name=money]").each(function(){
						var thisDate = $(this).val();
						if(thisDate == null || thisDate.trim().length == 0){
							thisDate = 0;
						}
						totalSum = totalSum + parseFloat(thisDate);
					})
					$("#totalSum").html(totalSum.toFixed(2)); */
				}
		});
	}
	function formatDate(obj){
		var data = $(obj).val();
		if(data == null || data.trim().length == 0){
			data = 0;
		}
		var limitMoney = $(obj).data("limitmoney");
		if(limitMoney!=null&&limitMoney>0){
			if(parseFloat(data)>parseFloat(limitMoney)){
				alert("该卡超过限额（"+limitMoney+"）了！请重新填写金额！");
				$(obj).val("0.00");
				sendMoneyTodb(obj)
				return;
			}
		}
		sendMoneyTodb(obj)
		$(obj).val(parseFloat(data).toFixed(2));
		totalMoneyfunc();
		/* var totalSum = 0;
		$("input[name=money]").each(function(){
			var thisDate = $(this).val();
			if(thisDate == null || thisDate.trim().length == 0){
				thisDate = 0;
			}
			totalSum = totalSum + parseFloat(thisDate);
		})
		$("#totalSum").html(totalSum.toFixed(2)); */
	}
	function sendMoneyTodb(obj){
		var data = $(obj).val();
		if(data == null || data.trim().length == 0){
			data = 0;
		}
		$.post("/settle/updateCardMoney",
				{
					orderNo:$("input[name=orderNo]").val(),
					memberBankId:$(obj).data("memberbankid"),
					money:data
				},function(data){
				if(data.resultMsg != 'success'){
					if(data.resultMsg == null){
						alert("未找到该卡");
					}else{
						alert(data.resultMsg);
					}
				}
		});
	}
	function totalMoneyfunc(){
		var totalSum = 0;
		$("input[name=money]").each(function(){
			var thisDate = $(this).val();
			if(thisDate == null || thisDate.trim().length == 0){
				thisDate = 0;
			}
			totalSum = totalSum + parseFloat(thisDate);
		})
		$("#totalSum").html(totalSum.toFixed(2));
	}
	function saveCard(){
		var sum = $("#totalSum").html();
		if(sum == null || sum.trim().length == 0){
			sum = 0;
		}
		var trueMoney = $("#trueMoney").html();
		if(trueMoney == null || trueMoney.trim().length == 0){
			trueMoney = 0;
		}
		var chaji = parseFloat(trueMoney)-parseFloat(sum);
		if(chaji==0){
			var form = $("form[name=saveForm]");
			form.attr("action","/settle/saveChoiceCard");
			form.submit();
		}else{
			if(chaji>=0){
				tc.one("提示","实际结算金额"+trueMoney+"元<br />已分配"+sum+"元<br />未分配"
						+chaji.toFixed(2)+"元<br />请分配完毕再确认提交！");
			}else{
				tc.one("提示","实际结算金额"+trueMoney+"元<br />已分配"+sum+"元<br />您分配超额了<br />请调整，再确认提交！");
			}
			
		}
	}
</script>
</head>

<body>
    <!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>分配打款明细</h6>
        	<a href="/settle/settleList"><img src="/assets-new/img/esc.png"></a>
        </header>
        <div class="content">
        	<!--搜索-->
            <div class="detailed detailed_bhsq">
                <p class="p_left"><span>实际结算金额：</span><b id="trueMoney" style="color:#ffac44"><fmt:formatNumber value="${settle.totalMoney }" pattern="00.00"></fmt:formatNumber></b>元</p>
            </div>
            <form action="/settle/saveChoiceCard" name="saveForm" method="post">
            	<input type="hidden" name="orderNo" value="${orderNo }">
            	<input type="hidden" name="settleNo" value="${settleNo }">
            	<input type="hidden" name="pmMemberCode" value="${pmMemberCode }">
            	<input type="hidden" name="memberCardIds" id="memberCardIds">
	        	<!--选取新材料-->
	            <table class="table_1 table_2" width="100%" border="0" cellspacing="0" cellpadding="0">
	                <tr class="quote_tr">
	                	<th scope="col" width="20%">工人姓名</th>
	                    <th scope="col" width="20%">工种</th>
	                    <th scope="col" width="20%">银行卡</th>
	                    <th scope="col" width="25%">打款金额（元）</th>
	                    <c:if test="${flag != 'show' }">
	                    	<th scope="col" width="15%">操作</th>
	                    </c:if>
					</tr>
					<c:forEach var="item" items="${cardList }">
						<tr id="tr_${item.memberBankCardId }" data-cardTag="${item.cardTag }">        
	                	<td ><input type="hidden" name="memberBankCardId" value="${item.memberBankCardId }">${item.memberName }</td>
	                    <td>${item.category }</td>
	                    <td>${item.bankName }</td>
	                    <td><input class="input_text" name="money" type="text" data-limitMoney="${item.limitMoney }" data-memberBankId="${item.memberBankCardId }"
	                    	onblur="formatDate(this)" value="<c:if test="${empty item.money }">0.00</c:if><c:if test="${!empty item.money }">${item.money }</c:if>"></td>
	                    <c:if test="${flag != 'show' }">
	                    	<td>
	                         	<input class="delete" onclick="deleteCard('${item.memberBankCardId }')" type="button" value="删除">
	                    	</td>
	                    </c:if>
	                
					</c:forEach>
				</table>
			</form>
            <div class="text_center mingxi_total">合计：￥<b id="totalSum">0.00</b></div>
            <c:if test="${flag != 'show' }">
            	<a class="clfh_a mingxi_a" href="javascript:void(0);" onclick="addCard()">添加银行卡</a>
            	<input class="ok" name="" <c:if test="${cardList.size() == 0}">disabled="disabled"</c:if> type="button" value="确认提交" onclick="saveCard()">
            </c:if>
        </div>
    </div>
</body>
</html>

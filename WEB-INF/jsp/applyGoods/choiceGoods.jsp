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
<title>选取新材料</title>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<script type="text/javascript">
$(function(){
	//加减数量使用
	$(".Jia").click(function(){
		var oldValue=parseInt($(this).parent().find(".J_num").val());
		oldValue++;
		$(this).parent().find(".J_num").val(oldValue)
	});
	$(".Jian").click(function(){
		var oldValue=parseInt($(this).parent().find(".J_num").val());
		oldValue--;
        if(oldValue>=0) {
            $(this).parent().find(".J_num").val(oldValue)
        }
	});
    $("body").delegate(".J_num","blur",function() {
        var num=$(this).val().trim();
        var numReg=/^\d+$/;
        if(!numReg.test(num)) {
            layer.alert("请输入整数",{icon:2});
            $(this).val("0");
        }
    });
});
function saveForm() {
	var matnrs="";
    $("input[name='fucaiCheckbox']:checkbox:checked").each(function(){
		var matnr=$(this).val();
		var num = $("#"+matnr+"_num").val();
		if(num==null||num.length==0) {
			layer.alert("请填写数量",{icon:2});
			$("#"+matnr+"_num").focus();
			return;
		}
		matnrs+= matnr+",";
	});
	$("#matnrStr").val(matnrs);
    layer.msg('加载中',{icon:16});
    document.saveGoodsForm.submit();
}
</script>

</head>

<body>
<div class="content" style="width:100%;">
    <div class="title" style="width:100%;">
        <h2>添加材料</h2>
        <a href="/applyGoods/threePath/toApplyBill?orderNo=${orderNo}&applyGoodsDate=${applyGoodsDate}&applyGoodsReson=${applyGoodsReson}&werks=${werks}">
            <img src="/assets-new/4th/img/esc.png">
        </a>
    </div>
    <hr class="content_hr">
    <form action="/applyGoods/threePath/toAllMaraList" method="post">
        <div class="so_sku">
            <input class="sku_so" type="text" name="maktg" value="${maktg}" placeholder="请输入名称搜索商品">
            <input class="sku_sku" type="text" name="matnrSearch" value="${matnrSearch}" placeholder="请输入SKU编号搜索商品">
            <input type="hidden" name="orderNo" value="${orderNo }">
            <input type="hidden" name="werks" value="${werks }">
            <input type="hidden" name="applyGoodsDate" value="${applyGoodsDate }">
            <input type="hidden" name="applyGoodsReson" value="${applyGoodsReson }">
            <input class="sku_an" type="submit" value="搜索">
        </div>
    </form>
    <form action="/applyGoods/saveChoiceGoods" name="saveGoodsForm" method="post">
        <input type="hidden" name="matnrStr" id="matnrStr"/>
        <input type="hidden" name="orderNo" value="${orderNo}">
        <input type="hidden" name="werks" value="${werks}">
        <input type="hidden" name="applyGoodsDate" value="${applyGoodsDate}">
        <input type="hidden" name="applyGoodsReson" value="${applyGoodsReson}">
        <input type="hidden" name="bdart" value="${bdart}">
        <table class="table_list" border="0" cellspacing="0" cellpadding="0">
            <tr class="table_listTr">
                <th scope="col" width="5%">序号</th>
                <th scope="col" width="10%">SKU</th>
                <th scope="col" width="40%">名称</th>
                <th scope="col" width="10%">单位</th>
                <th scope="col" width="12.5%">数量</th>
                <th scope="col" width="10%">操作</th>
            </tr>
            <tbody>
            <c:forEach var="item" items="${goodsList}" varStatus="index">
                <tr>
                    <td>${index.index+1}</td>
                    <td>${item.matnr}</td>
                    <td class="td_name">${item.maktg}</td>
                    <td>${item.meins}</td>
                    <td>
                        <span class="Jian">-</span>
                        <input type="text" class="J_num" name="${item.matnr}_num" id="${item.matnr}_num" value="0">
                        <span class="Jia">+</span>

                    </td>
                    <td>
                        <input id="sku_${item.matnr}" class="none" name="fucaiCheckbox" type="checkbox" value="${item.matnr}">
                        <label for="sku_${item.matnr}" class="checked">&nbsp;</label>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form>
    <input class="buttom_1" type="button" value="选好了" onclick="saveForm()">
</div>
</body>
</html>

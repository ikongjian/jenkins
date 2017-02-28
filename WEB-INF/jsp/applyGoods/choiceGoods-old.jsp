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
<script type="text/javascript">
$(function(){
	//加减数量使用
	$(".jia").click(function(){
		var oldValue=parseInt($(this).parent().find(".jiajianshu").val()); 
		oldValue++;
		$(this).parent().find(".jiajianshu").val(oldValue)
	});
	$(".jian").click(function(){
		var oldValue=parseInt($(this).parent().find(".jiajianshu").val()); 
		oldValue--;
		$(this).parent().find(".jiajianshu").val(oldValue)
	});
});
function saveForm(){
	var matnrs = "";
	$("input[name='fucaiCheckbox']:checkbox:checked").each(function(){
		var matnr = $(this).val();
		var num = $("#"+matnr+"_num").val();
		if(num == null || num.length == 0){
			//弹出层
			layer.alert("请填写数量", {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			});
			$("#"+matnr+"_num").focus();
			return;
		}
		matnrs += matnr+",";
	});
	$("#matnrStr").val(matnrs);
	document.saveGoodsForm.submit();
	//加载层-风格4
    layer.msg('加载中', {icon: 16});
}
</script>
</head>

<body>
    <!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>选取新材料</h6>
        	<a href="/applyGoods/threePath/toApplyBill?orderNo=${orderNo}&applyGoodsDate=${applyGoodsDate}&applyGoodsReson=${applyGoodsReson}&werks=${werks}">
        	    <img src="/assets-new/img/esc.png">
        	</a>
        </header>
        <div class="content">
        	<!--搜索-->
            <div class="so so2">
            <form action="/applyGoods/threePath/toAllMaraList" method="post">
            	<input class="soso" name="maktg" type="text" value="${maktg }" placeholder="请输入关键字搜索">
            	<input class="soso" name="matnrSearch" type="text" value="${matnrSearch}" placeholder="请输入商品编号搜索">
            	<input type="hidden" name="orderNo" value="${orderNo }">
            	<input type="hidden" name="werks" value="${werks }">
            	<input type="hidden" name="applyGoodsDate" value="${applyGoodsDate }">
           		<input type="hidden" name="applyGoodsReson" value="${applyGoodsReson }">
                <input class="soan" type="submit" value="搜索">
            </form>
                <img class="so_esc" src="/assets-new/img/so_esc.png">
            </div>
            <form action="/applyGoods/saveChoiceGoods" name="saveGoodsForm" method="post">
            <input type="hidden" name="matnrStr" id="matnrStr"/>
            <input type="hidden" name="orderNo" value="${orderNo }">
            <input type="hidden" name="werks" value="${werks }">
            <input type="hidden" name="applyGoodsDate" value="${applyGoodsDate }">
            <input type="hidden" name="applyGoodsReson" value="${applyGoodsReson }">
            <input type="hidden" name="bdart" value="${bdart }">
        	<!--选取新材料-->
            <table class="table_1 table_2" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="quote_tr">
                	<th scope="col" width="5%">序号</th>
                  <!--   <th scope="col" width="15%">部类</th>-->
                    <th scope="col" width="10%">sku</th>
                    <th scope="col" width="40%">名称</th>
                    <th scope="col" width="10%">单位</th>
                    <th scope="col" width="12.5%">预计数量</th>
                    <th scope="col" width="10%">操作</th>
				</tr>
				<c:forEach var="item" items="${goodsList }" varStatus="index">
					<tr>        
	                	<td>${index.index+1 }</td>
	                  <!--   <td>${item.zpdo }</td>-->
	                    <td>${item.matnr }</td>
	                    <td class="td_name">${item.maktg }</td>
	                    <td>${item.meins }</td>  
	                    <td>
	                    	<i class="jian">-</i>
	                        <input type="text" class="jiajianshu" name="${item.matnr }_num" id="${item.matnr }_num" value="1">
	                        <i class="jia">+</i>
	                    </td>
	                    <td>
	                         <img class="xz1" src="/assets-new/img/xz1.png">
	                         <img class="xz2" src="/assets-new/img/xz2.png">
	                         <input class="input_none xz"  name="fucaiCheckbox" value="${item.matnr }" type="checkbox">
	                    </td>
	                </tr>
				</c:forEach>
			</table>
			</form>
            <input class="ok" name="" type="button" onclick="saveForm()" value="选好了">
        </div>
    </div>
</body>
</html>

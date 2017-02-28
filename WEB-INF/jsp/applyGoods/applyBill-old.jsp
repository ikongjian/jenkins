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
<title>补货申请单</title>
<script type="text/javascript">
$(function(){
	$("#bdart").val('${bdart}');
	$(".jia").click(function() {
		var value=parseInt($(this).parent().find(".jiajianshu").val());//点击增加后的数量 
		var orderNo=$("input:hidden[name=orderNo]").val();
		var matnr = $(this).parent().find("input[name=matnr]").val();
		value++;
		$(this).parent().find(".jiajianshu").val(value);
			var price = $(this).parent().next("td").html();
			if(price){
				  $(this).parent().next("td").next("td").html((value*parseFloat(price)).toFixed(2)); 
			}
		  
		    
		$.post("/applyGoods/updateGoodsNumFromRedis",
				{orderNo:orderNo,matnr:matnr,matnrNum:value,token:token,loginUserName:loginUserName},
				function(data){
					if(data.errorMsg!='ok'){
						//弹出层
				/* 		layer.alert(data.errorMsg, {
						    skin: 'layui-layer-molv' //样式类名
						    ,closeBtn: 0
						}); */
					}
		});
	});
	$(".jian").click(function() {
		var value=parseInt($(this).parent().find(".jiajianshu").val());//点击增加后的数量 
		var orderNo=$("input:hidden[name=orderNo]").val();
		var matnr = $(this).parent().find("input[name=matnr]").val();
		value--;
		if(value <= 0){
			//弹出层
			layer.alert("数量不能小于0，如果不需要请删除！",{icon:2});
			return;
		}
		$(this).parent().find(".jiajianshu").val(value);
	 	var price = $(this).parent().next("td").html();
	 	if(price){
	 		$(this).parent().next("td").next("td").html((value*parseFloat(price)).toFixed(2)); 
	 	}
	
		$.post("/applyGoods/updateGoodsNumFromRedis",
				{orderNo:orderNo,matnr:matnr,matnrNum:value,token:token,loginUserName:loginUserName},
				function(data){
					if(data.errorMsg!='ok'){
						//弹出层
					/* 	layer.alert(data.errorMsg, {
						    skin: 'layui-layer-molv' //样式类名
						    ,closeBtn: 0
						}); */
					}
		});
	});	
});
function deleteGoods(obj){
	var orderNo=$("input:hidden[name=orderNo]").val();
	var matnr=$(obj).data("matnr");
	$.post("/applyGoods/deleteGoodsFromRedis",
			{orderNo:orderNo,matnr:matnr,token:token,loginUserName:loginUserName},
			function(data){
				if(data.errorMsg=='ok'){
					window.location.reload(true);
				}else{
					//弹出层
					layer.alert(data.errorMsg,{icon:2});
				}
	});
	

}
var flag = true;
function saveGoods(){
	var applyGoodsDate = $("#applyGoodsDate").val();
	var applyGoodsReson = $("#applyGoodsReson").val();
	var applyGoodWerks=$("#werks").val();
	if(applyGoodsDate==null||applyGoodsDate.length==0){
		layer.alert("日期不能为空！",{icon:2});
		return false;
	}
	var nowDate=$("#nowDate").val().trim();
	var todayDate;
	if(nowDate!=null&&nowDate!="") {
		todayDate=new Date(Date.parse(nowDate.replace(/-/g,"/")));
	} else {
		todayDate=new Date();
	}
	var date=new Date(Date.parse(applyGoodsDate.replace(/-/g,"/")));
	 if(applyGoodWerks=="101"||applyGoodWerks=="303"||applyGoodWerks=="304"||applyGoodWerks=="404") {
		$.ajax({
			url:"/stuffAccept/validDate",
			type:"post",
			dataType:"json",
			async:false,
			cache:false,
			success:function(result) {
				$("#nowDate").val(result.nowDate);
			}
		 });
		var todayDateHour=todayDate.getHours();
		if(todayDateHour>=12) {
			todayDate.setDate(todayDate.getDate()+3);
		} else {
			todayDate.setDate(todayDate.getDate()+2);
		}
		var year=todayDate.getFullYear();
		var month=(todayDate.getMonth()+1)>=10?(todayDate.getMonth()+1):"0"+(todayDate.getMonth()+1);
		var day=todayDate.getDate()>=10?todayDate.getDate():"0"+todayDate.getDate();
		var targetDayStr=year+"-"+month+"-"+day;
		var targetDay=new Date(Date.parse(targetDayStr.replace(/-/g,"/")));
		if(date<targetDay) {
			layer.alert("材料进场时间必须为："+targetDayStr+"（含）日之后的时间",{icon:2});
			return false;
		}
	} else {
		 var year=todayDate.getFullYear();
		 var month=(todayDate.getMonth()+1)>=10?(todayDate.getMonth()+1):"0"+(todayDate.getMonth()+1);
		 var day=todayDate.getDate()>=10?todayDate.getDate():"0"+todayDate.getDate();
		 var targetDayStr=year+"-"+month+"-"+day;
		 var targetDay=new Date(Date.parse(targetDayStr.replace(/-/g,"/")));
		 if(date<targetDay) {
			 layer.alert("选择的材料进场时间必须为："+targetDayStr+"（含）日之后的时间",{skin:'layui-layer-molv',closeBtn:0});
			 return false;
		 }
	}
	if(applyGoodsReson==null||applyGoodsReson.length==0){
		layer.alert("补货原因不能为空！",{icon:2});
		return false;
	}
	if($("input[name=matnrnum]").length==0){
		layer.alert("请选择补货材料",{icon:2});
		return false;
	}
	$("input[name=matnrnum]").each(function(){
		if($(this).val()==null||$(this).val().length==0||$(this).val()=="0"){
			layer.alert("数量不能小于0",{icon:2});
			return false;
		}
	});
	
	if(flag){
		flag = false;
		document.saveForm.submit();
	}
	
}
function addGoods(){
	var orderNo = $("#orderNo").val();
	var werks = $("#werks").val();
	var applyGoodsDate = $("#applyGoodsDate").val();
	var applyGoodsReson = $("#applyGoodsReson").val();
	var bdart = $("#bdart").val();
	var form = $("<form></form>");
    form.attr('action',"/applyGoods/threePath/toAllMaraList");
    form.attr('method','post');
    
    var orderNoEle = $("<input type='hidden' name='orderNo' />");
    orderNoEle.attr('value',orderNo);
    form.append(orderNoEle);
    
    var werksEle = $("<input type='hidden' name='werks' />");
    werksEle.attr('value',werks);
    form.append(werksEle);
    
    var applyGoodsDateEle = $("<input type='hidden' name='applyGoodsDate' />");
    applyGoodsDateEle.attr('value',applyGoodsDate);
    form.append(applyGoodsDateEle);
    
    var applyGoodsResonEle = $("<input type='hidden' name='applyGoodsReson' />");
    applyGoodsResonEle.attr('value',applyGoodsReson);
    form.append(applyGoodsResonEle);
    
     var bdartEle = $("<input type='hidden' name='bdart' />");
    bdartEle.attr('value',bdart);
    form.append(bdartEle);
    
    var loginUserNameEle = $("<input type='hidden' name='loginUserName' />");
    loginUserNameEle.attr('value',loginUserName);
    form.append(loginUserNameEle);
    
    var tokenEle = $("<input type='hidden' name='token' />");
    tokenEle.attr('value',token);
    form.append(tokenEle);
    
    form.appendTo("body");
    form.css('display','none');
    form.submit();
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
        	<h6>补货申请单</h6>
        	<a href="/applyGoods/toApplyGoodsList"><img src="/assets-new/img/esc.png"></a>
        </header>
        <div class="content">
           <form action="/applyGoods/saveChoiceMara" name="saveForm" method="post">
            <input type="hidden" name="orderNo" id="orderNo" value="${orderNo }">
            <input type="hidden" name="werks" id="werks" value="${werks }">
        	<!--补货申请单-->
            <div class="time_cx">
            	<p><span>期望送货日期：</span><input class="input_date" type="date" name="applyGoodsDate" id="applyGoodsDate" value="${applyGoodsDate }"/></p>
            	
                <p><span>备注：</span><input type="text" name="applyGoodsReson" id="applyGoodsReson" value="${applyGoodsReson }"/></p>
                
                <p>
            	<span>发货日程：</span>
            	<select id="bdart" name="bdart">
            	<option  value="60">主材补货</option>
				<option value="70">辅料补货</option>
            	</select>
            	</p>
            </div> 
            <table class="table_1 table_2" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="quote_tr">
                	<th scope="col" width="5%">序号</th> 
                   <!--  <th scope="col" width="10%">部类</th>-->
                    <th scope="col" width="10%">sku</th>
                    <th scope="col" width="30%">名称</th>
                    <th scope="col" width="6%">单位</th>
                    <th scope="col" width="12%">申请数量</th>
                    <th scope="col" width="10%">单价</th>
                    <th scope="col" width="10%">总价</th>
                    <th scope="col" width="15%">操作</th>
				</tr>
				<c:forEach var="item" items="${redList }" varStatus="index">
					<tr>        
	                	 <td>${index.index+1 }</td>
	                   <%--  <td>${item.zpdo }</td> --%>
	                    <td>${item.matnr }</td>
	                  
	                    <td class="td_name">${item.maktg }</td>
	                    <td>${item.meins }</td>  
	                    <td>
	                    	<i class="jian">-</i>
	                    	<input type="hidden" name="matnr" value="${item.matnr }">
	                        <input class="jiajianshu" type="text" name="matnrnum" value="${item.num }">
	                        <i class="jia">+</i>
	                    </td>
	                    <td>${item.price }</td>
	                    <td id="priceNum">${item.priceNum }</td>
	                    <td><input class="delete" onclick="deleteGoods(this)" type="button" value="删除材料" data-matnr="${item.matnr }"></td>    
	                </tr>
				</c:forEach>
			</table>
            <a class="clfh_a" href="javascript:void(0);" onclick="addGoods()">添加材料</a>
            <input class="ok" type="button" onclick="saveGoods()" value="确定">
          </form>
          <input type="hidden" id="nowDate">
        </div>
    </div>
</body>
</html>

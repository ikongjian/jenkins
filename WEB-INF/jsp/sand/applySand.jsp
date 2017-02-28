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
<title>材料申请</title>
<script type="text/javascript">
	$(function(){
		var map = ${map};
		var strS="";
		var strT="";
		var flag = true;
		for(var key in map){
			if(map[key]!=null&&map[key].length>0){
				if(flag){
					strS+="<option value='"+ key +"' selected='selected'>"+ map[key][0].name1 +"</option>";
				}else{
					strS+="<option value='"+ key +"'>"+ map[key][0].name1 +"</option>";
				}
			}
			if(flag){
				var list = map[key];
				for (var i = 0; i < list.length; i++) {
					var sand = list[i];
					strT += init(i,sand);
				}
				flag = false;
			}
		}
		$("#gys").html(strS);
		$("#sandTable").append(strT);
		
		
		$(".jia").click(function(){
			var oldValue=parseInt($(this).parent().find(".jiajianshu").val()); 
			oldValue++
			$(this).parent().find(".jiajianshu").val(oldValue)
			var value=parseInt($(this).parent().find(".jiajianshu").val());
			var price = $(this).parent().next("td").html();
			$(this).parent().next("td").next("td").html((value*parseFloat(price)).toFixed(2));
		});
		$(".jian").click(function(){
			var oldValue=parseInt($(this).parent().find(".jiajianshu").val()); 
			oldValue--
			if(oldValue>=0){
				$(this).parent().find(".jiajianshu").val(oldValue)
				var value=parseInt($(this).parent().find(".jiajianshu").val());
				var price = $(this).parent().next("td").html();
				$(this).parent().next("td").next("td").html((value*parseFloat(price)).toFixed(2));
			}
		});
	});
	function selectChange(){
		var strT = "";
		$("#sandTable").find("tr:gt(0)").remove();
		var map = ${map};
		var lifnr = $("select[name='gys'] option:selected").val();
		var list = map[lifnr];
		for (var i = 0; i < list.length; i++) {
			var sand = list[i];
			strT += init(i,sand);
		}
		$("#sandTable").append(strT);
	}
	
	function init(i,sand){
		return "<tr>"+       
			    	"<td>"+(i+1)+"</td><input class='jiajianshu' name='sku' type='hidden' value='"+ sand.matnr +"'>"+  
			        "<td class='td_name'>"+ sand.name1 +"</td>"+  
			        "<td>"+ sand.maktg +"</td>"+  
			        "<td></td>"+   
			        "<td>"+ sand.meins +"</td>"+     
			        "<td>"+   
			        "	<i class='jian'>-</i>"+   
			        "    <input class='jiajianshu' name='no' type='text' value='0'>"+
			        "    <i class='jia'>+</i>"+
			        "</td>"+
			        "<td>"+ sand.price +"</td>"+
			        "<td></td>"+
				"</tr>";
	}
	function check(){
		var date = $("input[name='date']").val();
		var remark = $("input[name='remark']").val();
		if(date==null||date.length==0){
			//墨绿深蓝风
			layer.alert('请填写期望到货时间', {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			});
			return false;
		}
		return true;
	}
</script>
</head>

<body>
    <!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>材料申请</h6>
        	<a href="#"><img src="/assets-new/img/esc.png"></a>
        </header>
        <div class="content">
        	<form action="/sand/saveSand" method="post" name="saveform" onsubmit="return check()">
        	<input type="hidden" name="productNo" value="${productNo }">
        	<input type="hidden" name="orderNo" value="${orderNo }">
        	<input type="hidden" name="werks" value="${werks }">
        	<!--补货申请单-->
            <div class="time_cx">
            	<p><span>期望到货时间：</span><input class="input_date" type="date" name="date" /></p>
                <p><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	备注：</span><input type="text" name="remark" /></p>
                <p>
                	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;供应商：</span>
                    <select name="gys" id="gys" onchange="selectChange()">
                    </select>
                </p>
            </div>
            <table id="sandTable" class="table_1 table_2" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="quote_tr">
                	<th scope="col" width="5%">序号</th>
                    <th scope="col" width="21.5%">供应商</th>
                    <th scope="col" width="21.5%">商品名称</th>
                    <th scope="col" width="10%">品牌</th>
                    <th scope="col" width="10%">单位</th>
                    <th scope="col" width="12%">数量</th>
                    <th scope="col" width="10%">单价</th>
                    <th scope="col" width="10%">总价</th>
				</tr>
			</table>
            <input class="ok" type="submit" value="确定">
            </form>
        </div>
    </div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	function saveFucai(){
		var matnrs = "";
		var dd = $("input[name='fucaiCheckbox']:checkbox:checked");
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
		document.saveForm.submit();
	}
</script>
</head>

<body>
    <!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>选取新材料</h6>
        	<a href="/review/threePath/toReviewFuCaiListPage?ternr=${ternr}&vbeln=${vbeln}&sdabw=${sdabw}&areaCode=${areaCode}&projectManagerName=${projectManagerName}&telephone=${telephone}">
        		<img src="/assets-new/img/esc.png">
        	</a>
        </header>
        <div class="content">
        	<div class="so so2">
	            <form action="/review/threePath/toALLFuCaiListPage" method="post">
		            <input class="soso" name="maktg" type="text" value="${maktg}" placeholder="请输入关键字搜索">
		            <input class="soso" name="matnrSearch" type="text" value="${matnrSearch}" placeholder="请输入商品编号搜索">
	            	<input class="soan" type="submit" value="搜索">
	            	<img class="so_esc" src="/assets-new/img/so_esc.png">
	            	<input type="hidden" name="vkorg" value="${vkorg}">
	            	<input type="hidden" name="inco1" value="${inco1}">
	            	<input type="hidden" name="ternr" value="${ternr}">
	            	<input type="hidden" name="sdabw" value="${sdabw}">
	            	<input type="hidden" name="werks" value="${werks}">
	            	<input type="hidden" name="sendDate" value="${sendDate}">
	            	<input type="hidden" name="remark" value="${remark}">
	            	<input type="hidden" name="matnrs" value="${matnrs}">
	            	<input type="hidden" name="matnrsList" value="${matnrs}">
	    			<input type="hidden" name="vbeln" value="${vbeln}">
	    			<input type="hidden" name="projectManagerName" value="${projectManagerName}">
             		<input type="hidden" name="telephone" value="${telephone}">
	            </form>
            </div>
            <form action="/review/saveAddFucai" method="post" name="saveForm">
             <input type="hidden" name="matnrStr" id="matnrStr">
             <input type="hidden" name="sendDate" value="${sendDate}"/>
             <input type="hidden" name="vkorg" id="vkorg" value="${vkorg }">
             <input type="hidden" name="inco1" id="inco1" value="${inco1 }">
             <input type="hidden" name="ternr" id="ternr" value="${ternr }">
             <input type="hidden" name="werks" id="werks" value="${werks }">
             <input type="hidden" name="sdabw" id="sdabw" value="${sdabw }">
             <input type="hidden" name="matnrs" value="${matnrs}">
             <input type="hidden" name="sendDate" value="${sendDate}">
             <input type="hidden" name="remark" value="${remark}">
             <input type="hidden" name="vbeln" value="${vbeln}">
             <input type="hidden" name="areaCode" value="${areaCode}">
             <input type="hidden" name="projectManagerName" value="${projectManagerName}">
             <input type="hidden" name="telephone" value="${telephone}">
			
			<input type="button" class="buttonclass" data-type="all" value="所有辅料">
			<c:forEach var="item" items="${tagList }">
				<input type="button" class="buttonclass" data-type="${item.code}" id="tag_${item.code}" value="${item.name }">
			</c:forEach>
			<input type="button" class="buttonclass" data-type="other" value="其他材料"/>
        	
        	<!--辅材数量复核-->
            <table class="table_1 table_2" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="quote_tr">
                	<th scope="col" width="5%">序号</th>
                    <th scope="col" width="13%">部类</th>
                    <th scope="col" width="44%">名称</th>
                    <th scope="col" width="8%">SKU</th>
                    <th scope="col" width="10%">单位</th>
                    <th scope="col" width="14%">预计数量</th>
                    <th scope="col" width="8%">操作</th>
				</tr>
				<c:forEach var="item" items="${list }" varStatus="index">
					<tr data-sku="${item.matnr}" id="fucai${status.index+1 }" data-tag="${item.tagCode }">     
	                	<td>${index.index+1 }</td>
	                    <td>${item.zpdo }</td>
	                    <td class="td_name">${item.maktg }</td>
	                    <td>${item.matnr }</td>
	                    <td>${item.meins }</td>  
	                    <td>
	                    	<i class="jian">-</i>
	                        	<input class="jiajianshu" name="${item.matnr }_num" id="${item.matnr }_num" type="text" value="1">
	                        <i class="jia">+</i>
	                    </td>
	                    <td>
	                         <img class="xz1" src="/assets-new/img/xz1.png">
	                         <img class="xz2" src="/assets-new/img/xz2.png">
	                         <input class="input_none xz" name="fucaiCheckbox" type="checkbox" value="${item.matnr }" >
	                    </td>        
	                </tr>
				</c:forEach>
			</table>
			<input class="ok" name="" type="button" value="选好了" onclick="saveFucai()">
			</form>
        </div>
    </div>
    <script type="text/javascript">
		$(function() {
			$(".jia").click(function() {
				var value=parseInt($(this).parent().find(".jiajianshu").val());//点击增加后的数量 
				value++;
				$(this).parent().find(".jiajianshu").val(value);
			});
			$(".jian").click(function() {
				var value=parseInt($(this).parent().find(".jiajianshu").val());//点击增加后的数量 
				value--;
				if(value <= 0){
					//弹出层
					layer.alert("数量不能小于0，如果不需要请删除！", {
					    skin: 'layui-layer-molv' //样式类名
					    ,closeBtn: 0
					});
					return;
				}
				$(this).parent().find(".jiajianshu").val(value);
			});	
			$(".buttonclass").click(function(){
				var type=$(this).data("type");
				if(type=='all'){
					$("tr[id^='fucai']").show();
				}else if(type=="other"){
					var tagArray = new Array();
					$("input[id^='tag_']").each(function(){
						var id=$(this).attr("id");
						tagArray.push(id.substring(4,id.length));
					});
					var goodsTag = new Array();
					$("tr[id^='fucai']").each(function(){
						goodsTag.push($(this).data("tag"));
					})
					var showArray = new Array();
					var hideArray = new Array();
					for (var i = 0; i < goodsTag.length; i++) {
						var flag = false;
						for (var j = 0; j < tagArray.length; j++) {
							if(goodsTag[i]==tagArray[j]){
								flag = true;
								break;
							}
						}
						if(flag){
							hideArray.push(goodsTag[i]);
						}else{
							showArray.push(goodsTag[i]);
						}
					}
					for (var i = 0; i < showArray.length; i++) {
						$("tr[id^='fucai'][data-tag="+showArray[i]+"]").show();
					}
					for (var i = 0; i < hideArray.length; i++) {
						$("tr[id^='fucai'][data-tag="+hideArray[i]+"]").hide();
					}
					
				}else{
					var list = $("tr[id^='fucai'][data-tag="+type+"]");
					if(list!=null&&list.length>0){
						$("tr[id^='fucai'][data-tag="+type+"]").show();
					}
					$("tr[id^='fucai'][data-tag!="+type+"]").hide();
				}
			});
		});    	
    </script>
</body>
</html>

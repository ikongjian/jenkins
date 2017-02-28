<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>选取新材料</title>
    <style type="text/css">
		.content{position:relative;}
    </style>
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
    <div class="content" style="width:100%;">
        <div class="title" style="width:100%;">
            <h2>添加材料</h2>
            <a href="/review/threePath/toReviewFuCaiListPage?ternr=${ternr}&vbeln=${vbeln}&sdabw=${sdabw}&areaCode=${areaCode}&projectManagerName=${projectManagerName}&telephone=${telephone}"">
            <img src="/assets-new/4th/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <div class="so_sku">
        	<form action="/review/threePath/toALLFuCaiListPage" method="post">
            <input class="sku_so" name="maktg" value="${maktg}" type="text" placeholder="请输入名称搜索商品">
            <input class="sku_sku" name="matnrSearch" value="${matnrSearch}" type="text" placeholder="请输入SKU编号搜索商品">
            <input class="sku_an" type="submit" value="搜索">
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
        <div class="content_nav">
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
            <ul>
            	<li class="content_navover"><a href="javascript:void(0);" class="buttonclass" data-type="all">所有辅料</a></li>
            	<li><a class="buttonclass" href="javascript:void(0);" data-type="common">常用辅料</a></li>
            	<!-- <input type="button" class="buttonclass" data-type="all" value="所有辅料"> -->
				<c:forEach var="item" items="${tagList }">
					<li><a href="javascript:void(0);" class="buttonclass" data-type="${item.code}" id="tag_${item.code}">${item.name }</a></li>
					<%-- <input type="button" class="buttonclass" data-type="${item.code}" id="tag_${item.code}" value="${item.name }"> --%>
				</c:forEach>
				<li><a href="javascript:void(0);" class="buttonclass" data-type="other">其他材料</a></li>
				<!-- <input type="button" class="buttonclass" data-type="other" value="其他材料"/> -->
            </ul>
        </div>
        <table class="table_list" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr class="table_listTr">
                    <th scope="col" width="8%">序号</th>
                    <!-- <th scope="col" width="13%">部类</th> -->
                    <th scope="col" width="20%">名称</th>
                    <th scope="col" width="12%">SKU</th>
                    <th scope="col" width="10%">单位</th>
                    <th scope="col" width="15%">预计数量</th>
                    <th scope="col" width="10%">操作</th>
                </tr>
                <c:forEach var="item" items="${list }" varStatus="index">
					<tr data-sku="${item.matnr}" id="fucai${status.index+1 }" data-tag="${item.tagCode }" data-common="${item.isCommon }">     
	                	<td>${index.index+1 }</td>
	                    <%-- <td>${item.zpdo }</td> --%>
	                    <td class="td_name">${item.maktg }</td>
	                    <td>${item.matnr }</td>
	                    <td>${item.meins }</td>  
	                    <td>
	                    	<span class="Jian">-</span>
	                    	<input class="J_num" name="${item.matnr }_num" id="${item.matnr }_num" type="text" value="0" onblur="calSpecialValue(${item.matnr },this,'blur')">
	                        <span class="Jia">+</span>
	                    </td>
	                    <td>
	                         <input id="sku_${item.matnr }" class="none" name="fucaiCheckbox" type="checkbox" value="${item.matnr }">
                        	 <label for="sku_${item.matnr }" class="checked">&nbsp;</label>
	                    </td>        
	                </tr>
				</c:forEach>
				<%-- <input class="input_none xz" name="fucaiCheckbox" type="checkbox" value="${item.matnr }" > --%>
            </tbody>
        </table>
        <input class="buttom_1" type="button" value="确定" onclick="saveFucai()">
        </form>
    </div>
    <script type="text/javascript">
		$(function() {
            $(".nav").css("left","-16%");
            $(".nav").removeClass("animate");
            $(".content,.title").css("width","100%");
            
			$(".Jia").click(function() {
				var value=parseInt($(this).parent().find(".J_num").val());//点击增加后的数量 
				//value++;
				var name=$(this).parent().find(".J_num").attr("name");
				var str = name.split("_");
				value = calSpecialValue(str[0],value,"jia");
				$(this).parent().find(".J_num").val(value);
			});
			$(".Jian").click(function() {
				var value=parseInt($(this).parent().find(".J_num").val());//点击增加后的数量 
				//value--;
				var name=$(this).parent().find(".J_num").attr("name");
				var str = name.split("_");
				value = calSpecialValue(str[0],value,"jian");
				if(value < 0){
					//弹出层
					layer.alert("数量不能小于0，如果不需要请删除！", {
					    skin: 'layui-layer-molv' //样式类名
					    ,closeBtn: 0
					});
					return;
				}
				$(this).parent().find(".J_num").val(value);
			});
            $("body").delegate(".J_num","blur",function() {
                var num=$(this).val().trim();
                var numReg=/^[0-9]*$/;
                if(!numReg.test(num)) {
                    layer.alert("请输入整数",{icon:2});
                    $(this).val("0");
                }
            });
			$(".buttonclass").click(function(){
				//添加样式
				$(this).parent().addClass("content_navover");
				$(this).parent().siblings().removeClass("content_navover");
				
				var type=$(this).data("type");
				if(type=='all'){
					$("tr[id^='fucai']").show();
				}else if(type=="other"){
					var tagArray = [];
					$("a[id^='tag_']").each(function(){
						var id=$(this).attr("id");
						tagArray.push(id.substring(4,id.length));
					});
					var goodsTag = [];
					$("tr[id^='fucai']").each(function(){
						goodsTag.push($(this).data("tag"));
					});
					var showArray = [];
					var hideArray = [];
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
				}else if(type=="common"){
					$("tr[id^='fucai'][data-common='1']").show();
					$("tr[id^='fucai'][data-common='0']").hide();
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
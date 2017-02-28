<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<head>
<title>补货申请单</title>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <style type="text/css">
        input[type=button] {
            margin-top: 1rem;
            width: 100%;
            height: 4.16rem;
            font-size: 2rem;
            background: #ed6c00;
            border-radius: 0.5rem;
            color: #fff;
        }
        .projectForm .iconForward select {
            border: 0.1rem solid #dddee3;
            height: 2.25rem;
            padding: 0 0.5rem;
            background: url("/assets-new/4th/img/select.png") no-repeat right center / 2.25rem;
        }
    </style>
<script type="text/javascript">
$(function(){

	$("#bdart").val('${bdart}');
	$(".Jia").click(function() {
		var value=parseInt($(this).parent().find(".J_num").val());//点击增加后的数量 
		var orderNo=$("input:hidden[name=orderNo]").val();
		var matnr = $(this).parent().find("input[name=matnr]").val();
		value++;
		$(this).parent().find(".J_num").val(value);
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
	
	$(".Jian").click(function() { //ok
		var value=parseInt($(this).parent().find(".J_num").val());//点击增加后的数量 
		var orderNo=$("input:hidden[name=orderNo]").val();
		var matnr = $(this).parent().find("input[name=matnr]").val();
		value--;
		if(value <= 0){
			//弹出层
			layer.alert("数量不能小于0，如果不需要请删除！",{icon:2});
			return;
		}
		$(this).parent().find(".J_num").val(value);
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
    $("body").delegate(".J_num","blur",function() {
        var num=$(this).val().trim();
        var numReg=/^[0-9]*[1-9][0-9]*$/;
        if(!numReg.test(num)) {
            layer.alert("请输入正整数",{icon:2});
            $(this).val($(this).data("onum"));
        }
    });
});
	
function deleteGoods(obj){ //ok
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
function saveGoods() {
	var applyGoodsDate = $("#applyGoodsDate").val();
	var applyGoodsReson = $("#applyGoodsReson").val();
	var applyGoodWerks=$("#werks").val();
	if(applyGoodsDate==null||applyGoodsDate.length==0){
		//弹出层
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
		//弹出层
		layer.alert("补货原因不能为空！",{icon:2});
		return false;
	}
	if($("input[name=matnrnum]").length==0){
		//弹出层
		layer.alert("请选择补货材料",{icon:2});
		return false;
	}
	$("input[name=matnrnum]").each(function(){
		if($(this).val()==null||$(this).val().length==0||$(this).val()=="0"){
			//弹出层
			layer.alert("数量不能小于0",{icon:2});
			return false;
		}
	});
	
	if(flag){
		flag = false;
		document.saveForm.submit();
	}
	
}
function addGoods(){ //ok
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

    <div class="content">
        <div class="title">
            <h2>补货申请单</h2>
            <a href="/applyGoods/toApplyGoodsList"><img src="/assets-new/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <form action="/applyGoods/saveChoiceMara" name="saveForm" method="post">
            <input type="hidden" name="orderNo" id="orderNo" value="${orderNo }">
            <input type="hidden" name="werks" id="werks" value="${werks }">
            
        <div class="projectForm">
            <div class="formGroupBox">
                <div class="formGroup">
                    <label>期望送货日期</label>
                    <p class="iconForward"><input class="taskInputdate" type="date" name="applyGoodsDate" id="applyGoodsDate" value="${applyGoodsDate}"></p>
                </div>
                <div class="formGroup">
                    <label>发货日程</label>
                    <p class="iconForward">
	                    <select id="bdart" name="bdart">
			            	<option  value="60">主材补货</option>
							<option value="70">辅料补货</option>
		            	</select>
                    </p>
                </div>
                <div class="pmBuildDet formGroup">
                    <label>备注</label>
                    <p class="iconForward"><input type="text" name="applyGoodsReson" id="applyGoodsReson" value="${applyGoodsReson }"></p>
                </div>
            </div>
            <table class="table_list replenish_list" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                    <tr class="table_listTr">
                        <th scope="col" width="5%">序号</th>
                        <th scope="col" width="10%">SKU</th>
                        <th scope="col" width="32%">名称</th>
                        <th scope="col" width="6%">单位</th>
                        <th scope="col" width="12%">申请数量</th>
                        <th scope="col" width="10%">单价</th>
                        <th scope="col" width="10%">总价</th>
                        <th scope="col" width="15%">操作</th>
                    </tr>
                   <c:forEach var="item" items="${redList}" varStatus="index">
					<tr>        
	                	<td>${index.index+1}</td>
	                    <td>${item.matnr}</td>
	                  
	                    <td class="td_name">${item.maktg}</td>
	                    <td>${item.meins}</td>
	                    <td>
	                    	<span class="Jian">-</span>
	                    	<input type="hidden" name="matnr" value="${item.matnr}">
	                        <input class="J_num" type="text" name="matnrnum" value="${item.num}" data-onum="${item.num}">
	                        <span class="Jia">+</span>
	                    </td>
	                    <td>
	                        <fmt:formatNumber value="${item.price}" type="number"/>
	                    </td>
	                    <td id="priceNum"><fmt:formatNumber value="${item.priceNum}" type="number"/></td>
	                    <td><a class="td_an" href="javascript:void(0);" onclick="deleteGoods(this)" data-matnr="${item.matnr}">删除材料</a> </td>
	                </tr>
				</c:forEach>
                </tbody>
            </table>
            <div class="submitWrap">
                <a class="addBtn" href="javascript:void(0);" onclick="addGoods()">添加材料</a>
                <input class="ok" type="button" onclick="saveGoods()" value="确定">
            </div>
        </div>
        </form>
        <input type="hidden" id="nowDate">
    </div>
    <script>
        $(function() {
            //隐藏返回按钮
            $(".nav").css("left","-16%");
            $(".nav").removeClass("animate");
            $(".content,.title").css("width","100%");
        });
    </script>
</body>

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
<title>项目停工</title>
<style type="text/css">
#tgP .input_date_li{width: 27%;}
#tgP label{width: 33%;}
#tgP label strong{float: left;width: 18%;text-align: center;color: #7b7b7b;}
#tgP label .input_date_li2{width: 80%;}
</style>
<script type="text/javascript">
	$(function(){
		var flag = '${flag}';
		if(flag!=null&&flag.length>0){
			if(flag=="success"){
				layer.alert("停工成功", {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				},function(){
					window.location.href='/process/list';
				});
			}else{
				layer.alert("停工失败", {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				},function(){
					window.location.href='/process/list';
				});
			}
		}
		$("#dxLabel1").click();
		$("#dxLabel1").addClass("label_hover");
		$("#dxLabel1").click(function(e) {
			$("#dxLabel2").removeClass("label_hover");
			$("#realDate").removeClass("input_date_li");
			$("#realDateDiv").hide();
			$(this).addClass("label_hover");
		});
		$("#dxLabel2").click(function(e) {
			$("#dxLabel1").removeClass("label_hover");
			$("#realDate").addClass("input_date_li");
			$("#realDateDiv").show();
		    $(this).addClass("label_hover");
		});
	});
	var flag = true;
	function checkform(){
		var realDate = $("#realDate").val();
		if(realDate==null||realDate.length==0){
			layer.alert("请选择停工时间", {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			});
			return false;
		}
		var stoptype = $("input[name='stopDate']:checked").val();
		if(stoptype=="1"){
			
			if(flag&&checkDate()&&checkday()){
				flag = false;
				document.saveform.submit();
			}
		}else{
			if(flag&&checkday()){
				flag = false;
				document.saveform.submit();
			}
		}
		
	}
	function checkday(){
		var projectDays = $("input[name='workDays']").val();
		if(projectDays==null||projectDays.length==0){
			layer.alert("请填写开工第几天", {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			});
			return false;
		}
		days = parseFloat(projectDays);
		if(days<1){
			layer.alert("请填写正确的天数！", {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			});
			$("input[name='workDays']").val("");
			$("input[name='workDays']").focus();
			return false;
		}
		return true;
	}
	function checkDate(){
		var realDate = $("#realDate").val();
		if(realDate==null||realDate.length==0){
			layer.alert("请选择停工开始时间！", {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			});
			return false;
		}
		var realDateEnd = $("#realDateEnd").val();
		if(realDateEnd==null||realDateEnd.length==0){
			layer.alert("请选择停工结束时间！", {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			});
			return false;
		}
		var real = new Date(realDate.replace(/-/g,"/"));
		var End = new Date(realDateEnd.replace(/-/g,"/"));
		if(real>End){
			layer.alert("停工结束时间必须大于开始时间！", {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			});
			$("#realDateEnd").val("");
			$("#realDateEnd").focus();
			return false;
		}
		var date3=End.getTime()-real.getTime()//时间差
		//计算出相差天数
		var days=Math.floor(date3/(24*3600*1000))+1;
		if(days>3){
			layer.alert("最多连续停工3天！", {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			});
			$("#realDateEnd").val("");
			//$("#realDateEnd").focus();
			return false;
		}
		return true;
	};
</script>
</head>

<body>
    <!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>项目停工</h6>
        	<a href="/process/list"><img src="/assets-new/img/esc.png"></a>
        </header>
        <div class="content">
        	<form action="/process/stop" method="post" name="saveform" id="saveform">
        	<input type="hidden" name="orderNo" value="${order.orderNo }">
        	<div class="start input_p">
                <p>
                	<span>业主：</span>
                    <b>${order.community }${order.building }-${order.unit }-${order.room }-${order.userName }</b>
                </p>
                <p>
                	<span>停工类型：</span>
                    <input class="input_dx" id="stopDate1" name="stopDate" type="radio" value="0" >
                    <label class="dxan" id="dxLabel1" for="stopDate1" >全天</label>
                    <input class="input_dx" id="stopDate2" name="stopDate" type="radio" value="1" >
                    <label class="dxan" id="dxLabel2" for="stopDate2" >连续停工</label>
                </p>
                <p id="tgP">
                	<span>停工日期：</span>
                    <input class="input_date" type="date" name="realDate" id="realDate"/>
                    <label id="realDateDiv" style="display: none">
                    	<strong>到</strong>  <input class="input_date input_date_li2" type="date" name="realDateEnd" onblur="checkDate()" id="realDateEnd" />
                    </label>
                </p>
                <p>
                	<span>停工原因：</span>
                    <input class="input_dx" id="broadcast_z" name="reasonType" type="radio" value="1">
                    <label class="dxan" id="broadcast_zblabel" for="broadcast_z">爱空间原因</label>
                    <input class="input_dx" id="broadcast_w" name="reasonType" type="radio" value="0">
                    <label class="dxan" id="broadcast_wblabel" for="broadcast_w">业主原因</label>
                </p>
                <p>
                	<span>开工第几天：</span>
                    <input class="input" type="number" name="workDays" id="workDays" onblur="checkday()" onkeyup="this.value=this.value.replace(/[^(\d)]/g,'')"/>
                </p>
                <p class="textarea_p">
                	<span>备注：</span>
                	<textarea name="reasonInfo" cols="" rows=""></textarea>
                </p>
                <p>
                	<span>&nbsp;&nbsp;</span>
                    <input class="input_ok" type="button" onclick="checkform()" value="确定">
                </p>
            </div>
            </form>
        </div>
    </div>
</body>
</html>

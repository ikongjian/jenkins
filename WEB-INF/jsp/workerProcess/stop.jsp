<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="no-cache" http-equiv="pragma">
    <meta content="no-cache" http-equiv="cache-control">
    <meta content="0" http-equiv="expires">
    <title>项目停工-进度管理</title>
    <style type="text/css">
        .projectForm input[type=button] {
            margin-bottom: 8rem;
            width: 100%;
            height: 5rem;
            background: #ed6c00;
            border-radius: .5rem;
            color: #fff;
            font-size: 2rem;
        }
    </style>
    <%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
</head>
<body>
<!--右侧内容框架-->
<div class="content">
    <!--项目停工-->
    <div class="title">
        <h2>项目停工</h2>
        <%--<i><img src="/assets-new/4th/img/nav_0.png"></i>--%>
        <a href="javascript:void(0);" onclick="window.history.go(-1);"><img src="/assets-new/4th/img/esc.png"></a>
    </div>
    <hr class="content_hr">
    <div class="projectForm">
        <form method="post" action="/process/stop" name="saveform">
            <input type="hidden" name="orderNo" value="${order.orderNo}">
            <div class="formGroupBox">
                <div class="formGroup">
                    <label>业主</label>
                    <p>${order.community}-${order.building}-${order.unit}-${order.room}-${order.userName}</p>
                </div>
                <div class="formGroup">
                    <label>停工类型</label>
                    <p>
                        <input id="oneDay" type="radio" name="stopDate" value="0" checked="checked"><label class="radio radio_hover" for="oneDay">全天</label>
                        <input id="forDay" type="radio" name="stopDate" value="1"><label class="radio" for="forDay">连续停工</label>
                    </p>
                </div>
                <div class="formGroup">
                    <label>停工日期</label>
                    <p id="onlyTime" class="iconForward">
                        <input class="taskInputdate" type="date" name="realDate1">
                    </p>
                    <p id="startStopTime" class="startStopTime" style="display: none;">
                        <input class="taskInputdate" type="date" name="realDate2">到
                        <input class="taskInputdate fR" type="date" name="realDateEnd" onblur="checkDate()">
                    </p>
                </div>
                <div class="formGroup">
                    <label>停工原因</label>
                    <p>
                        <input id="ikongjian" type="radio" name="reasonType" value="1" checked="checked"><label class="radio radio_hover" for="ikongjian">爱空间原因</label>
                        <input id="customer" type="radio" name="reasonType" value="0"><label class="radio" for="customer">业主原因</label>
                    </p>
                </div>
                <div class="formGroup">
                    <label for="buildDay">开工第几天</label>
                    <p class="iconForward"><input id="buildDay" type="number" name="workDays" onblur="checkday()" onkeyup="this.value=this.value.replace(/[^(\d)]/g,'')"></p>
                </div>
                <div class="formGroup">
                    <label for="remarks">备注</label>
                    <p><textarea id="remarks" name="reasonInfo" placeholder="输入停工原因。。。"></textarea></p>
                </div>
            </div>
            <div class="submitWrap"><input type="button" value="确定" onclick="checkForm()"></div>
        </form>
    </div>
</div>
<!--右侧内容框架结束-->
<!--本页JS-->
<script>
    $(function() {
        //隐藏返回按钮
        $(".nav").css("left","-16%");
        $(".nav").removeClass("animate");
        $(".content,.title").css("width","100%");

        //切换停工类型
        $("label[for='oneDay']").click(function() {
            $("#startStopTime").hide();
            $("#onlyTime").show();
        });
        $("label[for='forDay']").click(function() {
            $("#onlyTime").hide();
            $("#startStopTime").show();
        });
        var flag='${flag}';
        if(flag!=null&&flag.length>0) {
            if(flag=="success") {
                layer.alert("停工成功",{icon:6},function() {
                    window.location.href='/process/list';
                });
            } else {
                layer.alert("停工失败",{icon:5},function() {
                    window.location.href='/process/list';
                });
            }
        }
    });
    var flag=true;
    function checkForm() {
        var realDate;//停工(开始)日期
        var stoptype=$("input[name='stopDate']:checked").val();//停工类型
        var remarks = $("#remarks").val();
        if(remarks==null||remarks.length==0){
        	 layer.alert("请填写停工原因",{icon:2});
             return false;
        }
        if(stoptype=="0") {
            realDate=$("input[name='realDate1']").val();
            if(realDate==null||realDate=="") {
                layer.alert("请选择停工日期",{icon:2});
                return false;
            }
            if(flag&&checkday()){
                flag=false;
                document.saveform.submit();
            }
        }
        if(stoptype=="1") {
            if(flag&&checkDate()&&checkday()){
                flag=false;
                document.saveform.submit();
            }
        }
    }
    function checkday() {
        var projectDays=$("input[name='workDays']").val();
        if(projectDays==null||projectDays=="") {
            layer.alert("请填写开工第几天",{icon:2});
            return false;
        }
        var days=parseFloat(projectDays);
        if(days<1) {
            layer.alert("请填写正确的天数",{icon:2});
            $("input[name='workDays']").val("");
            $("input[name='workDays']").focus();
            return false;
        }
        return true;
    }
    function checkDate() {
        var realDate=$("input[name='realDate2']").val();
        if(realDate==null||realDate==""){
            layer.alert("请选择停工开始时间",{icon:2});
            return false;
        }
        $("input[name='realDate1']").val(realDate);
        var realDateEnd=$("input[name='realDateEnd']").val();
        if(realDateEnd==null||realDateEnd==""){
            layer.alert("请选择停工结束时间",{icon:2});
            return false;
        }
        var real=new Date(realDate.replace(/-/g,"/"));
        var End=new Date(realDateEnd.replace(/-/g,"/"));
        if(real>End) {
            layer.alert("停工结束时间必须大于开始时间",{icon:2});
            $("#realDateEnd").val("");
            $("#realDateEnd").focus();
            return false;
        }
        var date3=End.getTime()-real.getTime();//时间差
        //计算出相差天数
        var days=Math.floor(date3/(24*3600*1000))+1;
        if(days>3) {
            layer.alert("最多连续停工3天",{icon:2});
            $("#realDateEnd").val("");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
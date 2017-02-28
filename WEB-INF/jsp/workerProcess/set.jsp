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
    <title>设置进度-进度管理</title>
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
<div class="content">
    <div class="title">
        <h2>设置进度</h2>
        <a href="javascript:void(0);" onclick="window.history.go(-1);"><img src="/assets-new/4th/img/esc.png"></a>
    </div>
    <hr class="content_hr">
    <div class="projectForm">
        <form method="post" action="/process/set" id="saveform" enctype="multipart/form-data" name="saveform">
            <input type="hidden" name="orderNo" value="${order.orderNo}">
            <input type="hidden" name="isCheck" id="isCheck" value="${temList[0].isCheck}">
            <input type="hidden" name="nowDate" id="nowDate" value="${nowDate}">
            <div class="formGroupBox">
                <div class="formGroup">
                    <label>业主</label>
                    <p>${order.community}-${order.building}-${order.unit}-${order.room}-${order.userName}</p>
                </div>
                <div class="formGroup">
                    <label>完成进度节点</label>
                    <p>
                        <select name="pointId" style="display:none;">
                            <c:forEach var="item" items="${temList}">
                                <option value="${item.id}">${item.name}</option>
                            </c:forEach>
                        </select>
                        ${temList[0].name}
                    </p>
                </div>
                <c:if test="${empty temList[0].isCheck or temList[0].isCheck != 1 }">
                    <div class="formGroup">
                        <label>实际完成日期</label>
                        <p class="iconForward"><input id="realDate" class="taskInputdate" type="date" name="realDate" value="" onblur="checkDate()"></p>
                    </div>
                    <div class="formGroup">
                        <label>施工照片</label>
                        <div class="upBuildPic">
                            <div class="picWrap">
                                <label for="upPic" class="picLabel">
                                    <input id="upPic" type="file" name="imgFile" value="" style="display:none;" onchange="previewImage(this)">
                                </label>
                            </div>
                        </div>
                        <div class="tips">＊必须上传照片</div>
                    </div>
                </c:if>
                <c:if test="${temList[0].isCheck == 1 }">
                    <div class="formGroup">
                        <label>期望验收日期</label>
                        <p class="iconForward"><input id="realDate" class="taskInputdate" type="date" name="realDate" value="" onblur="checkDate()"></p>
                    </div>
                </c:if>
            </div>
            <div class="submitWrap"><input id="btnInput" type="button" onclick="checkForm()" value="确定"></div>
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
        $("body").delegate(".del_img","click",function() {
            $(this).parents(".picWrap").remove();
        });
        var maxNum = '${maxNum}';
        if(maxNum!=null&&maxNum.length>0){
            if(maxNum=="maxNum"){
                layer.alert("${checkTime}质检人员已约满，请选择其他日期", {icon:2},function(){
                    window.location.href='/process/threePath/toSetProcess?orderNo=${orderNo}';
                });
            }
        }
        var flag = '${flag}';
        if(flag!=null&&flag.length>0){
            if(flag=="success"){
                layer.alert("进度设置成功",{icon:6},function(){
                    window.location.href='/process/list';
                });
            }else{
                layer.alert("进度设置失败",{icon:5},function(){
                    window.location.href='/process/list';
                });
            }
        }
    });
    var no=1;
    function previewImage(file) {
        var picLabel=$(file).parent(".picLabel");
        if (file.files&&file.files[0]) {
            $(picLabel).append("<img id='imghead"+no+"'><a href='javascript:void(0);' class='del_img'>删除</a>");
            var img=document.getElementById("imghead"+no);
            var reader=new FileReader();
            reader.onload=function(evt) {
                img.src = evt.target.result;
            };
            reader.readAsDataURL(file.files[0]);
        }
        no+=1;
        emAdd(no);
    }
    function emAdd(no) {
        var str="<div class='picWrap'>"+
                  "<label for='upPic"+no+"' class='picLabel'>"+
                  "<input id='upPic"+no+"' accept='image/*' name='imgFile' style='display:none;' type='file' onchange='previewImage(this)'>"+
                  "</label>"+
                  "</div>";
        $(".upBuildPic").append(str);
    }
    function checkForm() {
        var realDate=$("#realDate").val().trim();
        var isCheck = $("#isCheck").val().trim();
        if(realDate==null||realDate=="") {
            layer.alert("请选择日期",{icon:2});
            return false;
        }
        if(isCheck!="1") {
            var imgSize=$(".picWrap").size();
            if(imgSize<=1) {
                layer.alert("请上传照片",{icon:2});
                return false;
            }
        }
        var pointId=$("select[name='pointId'] option:selected").val();
        if(pointId==null||pointId.length==0) {
            layer.alert("该项目已经没有进度节点可选择了",{icon:2});
            return false;
        }
        if(checkPost()) {
            $("#btnInput").attr("disabled",true);
            document.saveform.submit();
        }
    }
    /*防重复提交*/
    var isCommitted=false;
    function checkPost() {
        if(!isCommitted) {
            isCommitted=true;
            return true;
        } else {
            layer.alert("不能重复提交表单",{icon:2});
            return false;
        }
    }
    function checkDate() {
        var isCheck = $("#isCheck").val();
        var realDateStr = $("#realDate").val();
        if(isCheck == 1) {
            var realDate = new Date(realDateStr.replace(/-/g,"/"));
            var nowDateStr = $("#nowDate").val();
            var nowDate = new Date(nowDateStr.replace(/-/g,"/"));
            var n = nowDate.getTime()+2*24*60*60*1000;
            var resultDate = new Date(n);
            if(realDate<resultDate) {
                layer.alert("只能选择两天或两天以后的时间",{icon:2});
                $("#realDate").val("");
                $("#realDate").focus();

            }
        } else {
            var realDate = new Date(realDateStr.replace(/-/g,"/"));
            var nowDateStr = $("#nowDate").val();
            var nowDate = new Date(nowDateStr.replace(/-/g,"/"));
            if(realDate<nowDate){
                layer.alert("只能选择今天或今天以后的时间",{icon:2});
                $("#realDate").val("");
                $("#realDate").focus();

            }
        }
    }
</script>
</body>

</html>
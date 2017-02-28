<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
    <meta name="format-detection" content="telephone=no" />
    <title>项目播报</title>
    <link rel="stylesheet" type="text/css" href="/assets-new/wx/css/css.css">
    <link href="/assets-new/mobile/css/css.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/assets-new/layer-v2.0/layer/layer.js"></script>
    <script type="text/javascript" src="/assets-new/layer-v2.0/layer/layer.js"></script>
    <script type="text/javascript">
        $(function() {
            $("body").delegate(".del_img","click",function() {
                $(this).parents(".upBuildPic").remove();
            });
        });
        var no=0;
        function previewImage(file) {
            var span=$(file).parent();
            if (file.files&&file.files[0]) {
                $(span).find("i").remove();
                $(span).append("<i><img class='imgPrev' id='imghead"+no+"'></i><a href='javascript:void(0);' onclick=deleteBtnclk('"+no+"')>删除</a>");
                var img=document.getElementById("imghead"+no);
                var reader=new FileReader();
                reader.onload=function(evt) {img.src = evt.target.result;};
                reader.readAsDataURL(file.files[0]);
            }
            no+=1;
            var iSize=$(".imgPrev").length;
            if(iSize<6) {
                spanAdd();
            }
        }
        function deleteBtnclk(no) {
            var span=$("#imghead"+no+"").parent().parent();
            $(span).remove();
            var iSize=$(".imgPrev").length;
            if(iSize==5) {
                spanAdd();
            }
        }
        function iclick(obj) {
            $(obj).parent().find(".input_file").click();
        }
        function spanAdd() {
            var str="<span style='margin-left:20px;margin-top:20px;'>"+
                    "<i style='width:8rem;height:7rem;' onclick=iclick(this)><img src='/assets-new/mobile/img/beat.jpg'></i>"+
                    "<input class='input_file' name='imgFile' onchange='previewImage(this)' multiple accept='image/*' type='file' >"+
                    "</span>";
            $("#bid").append(str);
        }
        $(function() {
            $("#saveForm").submit(function() {
                var imgSize=$("#bid > span").length-1;
                if(imgSize==null||imgSize<1||isNaN(imgSize)) {
                    layer.msg("请上传至少一张图片！",{icon:6,time:3000});
                    return false;
                } else {
                    $(".submit_button").attr("disabled",true);
                    layer.msg("提交中，请稍候",{icon:16,time:5000,shade:0.1});
                    return true;
                }
            });
        });
    </script>
</head>

<body>
<div class="complete">
    <div class="grab_head">
        <div class="grab_icon"><img src="/assets-new/wx/img/icon.png"></div>
        <div class="grab_name">${memberInfo.name}<br><span>${memberInfo.category}</span></div>
    </div>
    <div class="broadcast">
        <div style="margin-left:20px;margin-top:20px;font-size:1rem;">
            施工照片
        </div>
        <form action="/wx/workerNew" method="post" id="saveForm" enctype="multipart/form-data">
            <input type="hidden" name="pkgId" value="${pkgId}"/>
            <input type="hidden" name="orderNo" value="${orderNo}"/>
            <p class="broadcast_night" style="display:block;">
                <b id="bid" style="width:100%;">
                    <span style="margin-left:20px;margin-top:20px;">
                        <i onclick="iclick(this)" style="width:8rem;height:7rem;"><img src="/assets-new/mobile/img/beat.jpg"></i>
                        <input class="input_file" name="imgFile" onchange="previewImage(this)" accept="image/*" type="file" >
                    </span>
                </b>
            </p>
            <div style="color:#ed6c00;margin-left:10px;margin-bottom:20px;font-size:1rem;">＊必须上传照片</div>
            <input class="button submit_button" type="submit" value="发送播报">
        </form>
    </div>
</div>
</body>
</html>

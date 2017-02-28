<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<meta name="format-detection" content="telephone=no" />
<title>早晚播报</title>
<link href="/assets-new/mobile/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/assets-new/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/assets-new/layer-v2.0/layer/layer.js"></script>
<script type="text/javascript">
var flag = false;//false 早，true:晚
$(function(){
	var result = '${result}';
	if(result!=null&&result.length>0){
		if('success' == result){
			layer.alert("播报成功！",{icon:6},function(){
				window.location.href="/mobile/publish/list";
			});
		}else if('exist' == result){
			layer.alert("系统提示：播报已经存在了",{icon:5});
		}else{
			layer.alert("系统提示：播报失败，请联系系统开发人员",{icon:5});
		}
	}
	
	$("#morning").click();
	$("label").click(function(e) {
		$("label").removeClass("label_hover");
	    $(this).addClass("label_hover");
		//$("p input").val("")
		//$("p textarea").val("")
		$("textarea[name='newsWorkerInfo']").val("");//清空施工人员
	});
	$("#morning").click(function(e) {
		$(".broadcast_night").hide();
	    $(".broadcast_morning").show();
	    $(".newsContentArea").show();
	    flag = false;
	    $("#bid").html("");//清空上传的图片
		spanAdd();
	});
	$("#night").click(function(e) {
	    $(".broadcast_morning").hide();
	    $(".newsContentArea").hide();
		$(".broadcast_night").show();
		flag = true;
	});

    $("body").delegate(".del_img","click",function() {
        $(this).parents(".worker_img").remove();
        var id=$(this).data("id");
        $.ajax({
            url:"/mobile/publish/delWorkerImg",
            type:"post",
            dataType:"json",
            data:{id:id},
            async:false,
            cache:false,
            success:function(result) {}
        });
    });

    $(".worker_img img").click(function() {
        layer.open({
            type:1,
            area:["300px","400px"],
            shade:0.3,
            title:false,
            shadeClose:false,
            scrollbar:false,
            content:"<img src='"+$(this).attr("src")+"?arg="+new Date().valueOf()+"'>"
        });
    });
});

var no = 1;
//图片上传预览    IE是用了滤镜。
function previewImage(file){
	var span = $(file).parent();
	if (file.files && file.files[0]){
		$(span).find("i").remove();
	    //$(span).append("<i><img id='imghead"+no+"'></i><a href='javascript:void(0);' onclick=deleteBtnclk('"+no+"')>删除</a>");
	    $(span).append("<i><img id='imghead"+no+"'></i><a href='javascript:void(0);' onclick=deleteBtnclk('"+no+"')>删除</a>");
	    var img = document.getElementById("imghead"+no);
	    var reader = new FileReader();
	    reader.onload = function(evt){img.src = evt.target.result;};
	    reader.readAsDataURL(file.files[0]);
	}
	no+=1;
	spanAdd();
}
function deleteBtnclk(no){
	var span = $("#imghead"+no+"").parent().parent();
	$(span).remove();
}
function iclick(obj){
	$(obj).parent().find(".input_file").click();
}
function spanAdd(){
	var str = "<span class='img_broad_cast'>"+
			   	"<i onclick=iclick(this)><img src='/assets-new/mobile/img/beat.jpg'></i>"+
			   	"<input class='input_file' name='imgFile' onchange='previewImage(this)' multiple accept='image/*' type='file' >"+
			   "</span>";
	$("#bid").append(str);
}

function savePublish(){
	var newsDate = $("input[name='newsDate']").val();
	var projectDays = $("input[name='projectDays']").val();
	
	if(newsDate==null||newsDate.length==0){
		layer.alert("请选择施工日期！",{icon:2});
		return false;
	}
	if(projectDays==null||projectDays.length==0){
		layer.alert("请填写开工第几天！",{icon:2});
		return false;
	}
	if(flag){
        var filesSize = $(".img_broad_cast").size()-1;
        if(filesSize==null||filesSize<1||isNaN(filesSize)){
            layer.alert("请选择图片！",{icon:2});
            return false;
        }
        var ids=[];
        $(".worker_img").each(function() {
            var id=$(this).data("id");
            ids.push(id);
        });
        $("input[name='workerImgIds']").val(ids);
		/*var files = document.getElementsByName("imgFile");
		if(files == null || files.length == 0){
			layer.alert("请选择图片！",{icon:2});
			return false;
		}else{
			var file = files[0].value;
			if(file==null||file.length==0){
				layer.alert("请选择图片！",{icon:2});
				return false;
			}
		}*/
	}else{
		var newsContent = $("textarea[name='newsContent']").val();
		if(newsContent==null||newsContent.length==0){
			layer.alert("请填写施工内容！",{icon:2});
			return false;
		}
        var newsWorkerInfo = $("textarea[name='newsWorkerInfo']").val();
        if(newsWorkerInfo==null||newsWorkerInfo.length==0){
            layer.alert("请填写施工人员！",{icon:2});
            return false;
        }
	}
	return true;
}
function checkday(){
	var projectDays = $("input[name='projectDays']").val();
	days = parseFloat(projectDays);
	if(days<1){
		layer.alert("请填写正确的天数！",{icon:2});
		$("input[name='projectDays']").val("");
		$("input[name='projectDays']").focus();
		return false;
	}
}
</script>
</head>

<body>
	<!--头部-->
	<header>
    	<a href="/mobile/publish/list"><img src="/assets-new/mobile/img/esc.png"></a>
    	项目播报
    </header>
    <!--早晚播报-->
    <div class="broadcast">
    <form action="/mobile/publish/publish" method="post" id="publishform" onsubmit="return savePublish();" name="publishform" enctype="multipart/form-data">
        <input type="hidden" name="workerImgIds">
    	<input type="hidden" name="orderNo" value="${item.orderNo }">
    	<p>
        	<span>顾客：</span>
            <b>${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }</b>
        </p>
        <p>
        	<span>播报类型：</span>
            <label class="label_hover" for="morning">
            <input name="newsSegment" type="radio" id="morning" value="1" checked="checked">早晨播报</label>
          	<label for="night">
          	<input id="night" name="newsSegment" type="radio" value="2">晚间播报</label>
        </p>
        <p>
        	<span>施工日期：</span>
            <input class="input_date" name="newsDate" type="date">
        </p>
        <p>
        	<span>开工第几天：</span>    
            <input name="projectDays" type="number" placeholder="请填写" onblur="checkday()">
        </p>
        <p class="newsContentArea">
        	<span>施工内容：</span>
            <textarea name="newsContent" cols="" rows="" placeholder="请填写施工内容"></textarea>
        </p>
        <p class="broadcast_morning">
        	<span>施工人员：</span>
            <textarea class="textarea_height" name="newsWorkerInfo" cols="" rows="" placeholder="请填写施工人员"></textarea>
        </p>
        <p class="broadcast_night">
        	<span>施工照片：</span>
            <b id="bid">
                <c:if test="${!empty news}">
                    <c:forEach items="${news}" var="new1">
                        <span class="worker_img img_broad_cast" data-id="${new1.id}">
                            <i style="position:relative;">
                                <strong style="display:block; position:absolute; z-index:20; font-weight:normal; font-style:normal; text-align:center; color:#d50000;">${new1.workerName}</strong>
                                <img src="${new1.imgUrl}">
                            </i>
                            <a href='javascript:void(0);' class='del_img' data-id="${new1.id}">删除</a>
                        </span>
                    </c:forEach>
                </c:if>
                <span class="img_broad_cast">
                	<i onclick="iclick(this)"><img src="/assets-new/mobile/img/beat.jpg"></i>
                    <input class="input_file" name="imgFile" onchange="previewImage(this)" multiple accept="image/*" type="file" >
                </span>
            </b>
        </p>
         <!--发送按钮-->
    	<input class="broadcast_an" type="submit" value="发送播报">
      </form>
    </div>
</body>
</html>

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
<title>填写项目播报</title>
<script type="text/javascript">
	$(function(){
		var result = '${result}';
		if(result!=null&&result.length>0){
			if('success' == result){
				//弹出层
				layer.alert("播报成功！", {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				});
			}else if('exist' == result){
				//弹出层
				layer.alert("系统提示：播报已经存在了", {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				});
			}else{
				//弹出层
				layer.alert("系统提示：播报失败，请联系系统开发人员", {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				});
			}
		}
		radioclick('z');
	});
	
	function radioclick(type){
		if('z' == type){
			$(".fill_broadcast_z input").removeAttr("disabled");
			$(".fill_broadcast_z textarea").removeAttr("disabled");
			$(".fill_broadcast_w input").attr("disabled","disabled");
			$(".fill_broadcast_w textarea").attr("disabled","disabled");
		}else{
			$(".fill_broadcast_w input").removeAttr("disabled");
			$(".fill_broadcast_w textarea").removeAttr("disabled");
			$(".fill_broadcast_z input").attr("disabled","disabled");
			$(".fill_broadcast_z textarea").attr("disabled","disabled");
		}
	}
	function savePublish(type){
		if('z' == type){
			var newsDate = $(".fill_broadcast_z input[name='newsDate']").val();
			var newsContent = $(".fill_broadcast_z textarea[name='newsContent']").val();
			var newsWorkerInfo = $(".fill_broadcast_z textarea[name='newsWorkerInfo']").val();
			var projectDays = $(".fill_broadcast_z input[name='projectDays']").val();
			
			if(newsDate==null||newsDate.length==0){
				//弹出层
				layer.alert("请选择施工日期！", {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				});
				return false;
			}
			if(newsContent==null||newsContent.length==0){
				//弹出层
				layer.alert("请填写施工内容！", {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				});
				return false;
			}
			if(newsWorkerInfo==null||newsWorkerInfo.length==0){
				//弹出层
				layer.alert("请填写施工人员！", {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				});
				return false;
			}
			if(projectDays==null||projectDays.length==0){
				//弹出层
				layer.alert("请填写开工第几天！", {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				});
				return false;
			}
			document.publishform.submit();
		}else{
			var newsDate = $(".fill_broadcast_w input[name='newsDate']").val();
			//var newsContent = $(".fill_broadcast_w textarea[name='newsContent']").val();
			var projectDays = $(".fill_broadcast_w input[name='projectDays']").val();
			if(newsDate==null||newsDate.length==0){
				//弹出层
				layer.alert("请选择施工日期！", {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				});
				return false;
			}
			/* if(newsContent==null||newsContent.length==0){
				//弹出层
				layer.alert("请填写施工内容！", {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				});
				return false;
			} */
			if(projectDays==null||projectDays.length==0){
				//弹出层
				layer.alert("请填写开工第几天！", {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				});
				return false;
			}
			var files = $("input[name='imgFile'").val();
			if(files == null || files.length == 0){
				//弹出层
				layer.alert("请选择图片！", {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				});
				return false;
			}
			document.publishform.submit();
		}
	}
	
	var no = 1;
	   //图片上传预览    IE是用了滤镜。
    function previewImage(file){
       var MAXWIDTH  = 300; 
       var MAXHEIGHT = 300;
       var em = $(file).parent();
       if (file.files && file.files[0]){
    	   $(em).find("i").remove();
           $(em).append("<i><img id='imghead"+no+"'></i><a href='javascript:void(0);' onclick=deleteBtnclk('"+no+"')>删除</a>");
           var img = document.getElementById("imghead"+no);
           //var img = $(file).prev();
           img.onload = function(){
	           var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
	           img.width  =  rect.width;
	           img.height =  rect.height;
	           //img.style.marginLeft = rect.left+'px';
	           img.style.marginTop = rect.top+'px';
           };
           var reader = new FileReader();
           reader.onload = function(evt){img.src = evt.target.result;};
           reader.readAsDataURL(file.files[0]);
       }else{ //兼容IE
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
        }
        no+=1;
        emAdd();
    }
    function clacImgZoomParam( maxWidth, maxHeight, width, height ){
        var param = {top:0, left:0, width:width, height:height};
        if( width>maxWidth || height>maxHeight )
        {
            rateWidth = width / maxWidth;
            rateHeight = height / maxHeight;
             
            if( rateWidth > rateHeight )
            {
                param.width =  maxWidth;
                param.height = Math.round(height / rateWidth);
            }else
            {
                param.width = Math.round(width / rateHeight);
                param.height = maxHeight;
            }
        }
        param.left = Math.round((maxWidth - param.width) / 2);
        param.top = Math.round((maxHeight - param.height) / 2);
        return param;
   }
	function deleteBtnclk(no){
		var em = $("#imghead"+no+"").parent().parent();
		var str = "<i class='shangchuan photo_pai' onclick='iclick(this)'></i>"+
       			  "<input class='photo_input none' multiple accept='image/*' name='imgFile' type='file' onchange='previewImage(this)'>";
       	$(em).remove();
       	//$(em).html("");
		//$(em).append(str);
	}
	function iclick(obj){
		$(obj).parent().find(".photo_input").click();
	}
	function emAdd(){
		var str = "<em>"+
			          "<i class='shangchuan photo_pai' onclick='iclick(this)'></i>"+
			          "<input class='photo_input none' multiple accept='image/*' name='imgFile' type='file' onchange='previewImage(this)'>"+
			      "</em>";
		$("#strongId").append(str);
	}
	
	function checkday(){
		var projectDays = $("input[name='projectDays']").val();
		days = parseFloat(projectDays);
		if(days<1){
			layer.alert("请填写正确的天数！", {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			});
			$("input[name='projectDays']").val("");
			$("input[name='projectDays']").focus();
			return false;
		}
	}
</script>
</head>

<body>
    <!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>项目播报</h6>
        	<a href="/publish/list"><img src="/assets-new/img/esc.png"></a>
        </header>
        <form action="/publish/publish" method="post" name="publishform" enctype="multipart/form-data">
        <input type="hidden" name="orderNo" value="${item.orderNo }">
        <!--项目播报-->
        <div class="fill_broadcast">
        	<p>
            	<span>顾&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客：</span>
                <b>${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }</b>
            </p>
            <p>
            	<span>播报类型：</span>
                <input id="broadcast_z" name="newsSegment" type="radio" value="1" onclick="radioclick('z')">
                <label id="broadcast_zblabel" for="broadcast_z">早晨播报</label>
                <input id="broadcast_w" name="newsSegment" type="radio" value="2" onclick="radioclick('w')">
                <label id="broadcast_wblabel" for="broadcast_w">晚间播报</label>
            </p>
            <div class="fill_broadcast_z">
                <p>
                    <span>施工日期：</span>
                    <input class="input_date" name="newsDate" type="date">
                </p>
                <p>
                    <span>开工第几天：</span>
                    <input class="input" name="projectDays" type="number" onblur="checkday()" onkeyup="this.value=this.value.replace(/[^(\d)]/g,'')">
                </p>
                <p>
                    <span>施工内容：</span>
                    <textarea name="newsContent" cols="" rows=""></textarea>
                </p>
                <p>
                    <span>施工人员：</span>
                    <textarea name="newsWorkerInfo" cols="" rows=""></textarea>
                </p>
                <input class="ok" type="button" onclick="savePublish('z')" value="发送播报">
            </div>
            <div class="fill_broadcast_w">
            	<p>
                    <span>施工日期：</span>
                    <input class="input_date" name="newsDate" type="date">
                </p>
                <p>
                    <span>开工第几天：</span>
                    <input class="input" name="projectDays" type="number" onkeyup="this.value=this.value.replace(/[^(\d)]/g,'')">
                </p>
                <!-- <p>
                    <span>施工内容：</span>
                    <textarea name="newsContent" cols="" rows=""></textarea>
                </p> -->
                <p>
                    <span>施工照片：</span>
                    <strong id="strongId">
                    	<em>
                    		<i class="shangchuan photo_pai"></i>
                            <input class="photo_input none" multiple accept="image/*" name="imgFile" type="file" onchange="previewImage(this)">
                        	<!-- 
                        	<i><img src="img/photo.jpg"></i>
                            <a href="#">删除</a>
                             -->
                        </em>
                        <!-- <em>
                        	<i class="shangchuan photo_pai"></i>
                            <input class="photo_input none" multiple accept="image/*" name="imgFile" type="file" onchange="previewImage(this)">
                        	<i><img src="img/photo.jpg"></i>
                            <a href="#">删除</a>
                        </em>
                        <em>
                        	<i class="shangchuan photo_pai"></i>
                            <input class="photo_input none" multiple accept="image/*" name="imgFile" type="file" onchange="previewImage(this)">
                        </em> -->
                    </strong>
                </p>
                <input class="ok" onclick="savePublish('w')" type="button" value="发送播报">
            </div>
        </div>
        </form>
    </div>
</body>
</html>

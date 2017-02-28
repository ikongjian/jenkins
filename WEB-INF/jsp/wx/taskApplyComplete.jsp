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
<title>申请完工</title>
<link rel="stylesheet" type="text/css" href="/assets-new/wx/css/css.css">
<script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/assets-new/layer-v2.0/layer/layer.js"></script>
<script type="text/javascript">
   var no = 1;
   //图片上传预览    IE是用了滤镜。
   function previewImage(file){
       var MAXWIDTH  = 105; 
       var MAXHEIGHT = 125;
       var li = $(file).parent();
       if (file.files && file.files[0]){
    	   $(li).find("img").remove();
           $(li).append("<img id='imghead"+no+"' class='complete_click'>");
           var img = document.getElementById("imghead"+no);
           //var img = $(file).prev();
           img.onload = function(){
	           var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
	           img.width  =  rect.width;
	           img.height =  rect.height;
	           //img.style.marginLeft = rect.left+'px';
	           img.style.marginTop = rect.top+'px';
           }
           var reader = new FileReader();
           reader.onload = function(evt){img.src = evt.target.result;}
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
    /**  方重复  **/
    var flagSubmit = true;
    function checkForm(){
    	if(flagSubmit){
    		var flag = true;
        	var files = $("input[name='file']");
        	if(files!=null){
        		for (var i = 0; i < files.length; i++) {
    				if($(files[i]).val()==0){
    					flag = false;
    					break;
    				}
    			}
        	}
        	if(flag){
        		flagSubmit = false;
        	}else{
        		layer.msg('请选择6张照片，然后再上传', {
        		    icon: 6,
        		    time: 2000 //2秒关闭（如果不配置，默认是3秒）
        		});
        	}
        	return flag;
    	}
    }
</script>
</head>

<body>
	<!--申请完工-->
    <div class="complete">
    	<h2 class="complete_title">请先拍照，要求至少<span>6</span>张</h2>
    	<form action="/wx/applyComplete" method="post" name="saveForm" onsubmit="return checkForm()" enctype="multipart/form-data">
        <input type="hidden" name="packageId" value="${vo.id }"/>
        <input type="hidden" name="orderNo" value="${vo.orderNo }"/>
        <input type="hidden" name="groupLeaderNo" value="${vo.wgroupLeaderNo }"/>
        <ul>
            <c:if test="${vo.state !=60 }">
            	<li>
	        		<img class="complete_click" src="/assets-new/wx/img/4.jpg">
	                <!--隐藏input --被上传按钮触发浏览上传-->
	            	<input type="file" name="file" style="display:none;" onchange="previewImage(this)">
	        	</li>
	            <li>
	            	<img class="complete_click" src="/assets-new/wx/img/4.jpg">
	                <!--隐藏input --被上传按钮触发浏览上传-->
	            	<input type="file" name="file" style="display:none;" onchange="previewImage(this)">
	            </li>
	            <li>
	            	<img class="complete_click" src="/assets-new/wx/img/4.jpg">
	                <!--隐藏input --被上传按钮触发浏览上传-->
	            	<input type="file" name="file" style="display:none;" onchange="previewImage(this)">
	            </li>
	            <li>
	            	<img class="complete_click" src="/assets-new/wx/img/4.jpg">
	                <!--隐藏input --被上传按钮触发浏览上传-->
	            	<input type="file" name="file" style="display:none;" onchange="previewImage(this)">
	            </li>
	            <li>
	            	<img class="complete_click" src="/assets-new/wx/img/4.jpg">
	                <!--隐藏input --被上传按钮触发浏览上传-->
	            	<input type="file" name="file" style="display:none;" onchange="previewImage(this)">
	            </li>
	            <li>
	            	<img class="complete_click" src="/assets-new/wx/img/4.jpg">
	                <!--隐藏input --被上传按钮触发浏览上传-->
	            	<input type="file" name="file" style="display:none;" onchange="previewImage(this)">
	            </li>
            </c:if>
            <c:if test="${vo.state == 60 }">
                <c:forEach var="item" items="${imgList }">
                	<li>
		            	<img class="complete_click" src="${DOMAIN_NAME }${item.imageUrl}">
		            </li>
                </c:forEach>
            	
            </c:if>
        </ul>
        <c:if test="${vo.state != 60 }">
        	<input class="button" type="submit" value="拍好了，申请完工">
        	<!-- <input class="button1" type="button" value="拍好了，申请完工"> -->
        </c:if>
        <!-- <a class="a_fh_class" href="javascript:void(0);" onclick="window.history.go(-1);">返回</a> -->
        </form>
    </div>
</body>
<script>
	$(".complete_click").click(function(e) {
		$(this).parent().find("input").click()
    });
</script>
</html>

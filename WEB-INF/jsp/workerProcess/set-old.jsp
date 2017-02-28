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
<title>设置进度</title>
<script type="text/javascript">
	$(function(){
		var maxNum = '${maxNum}';
		if(maxNum!=null&&maxNum.length>0){
			if(maxNum=="maxNum"){
				layer.alert("${checkTime}质检人员已约满，请选择其他日期", {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				},function(){
					window.location.href='/process/threePath/toSetProcess?orderNo=${orderNo}';
				});
			}
		}
		var flag = '${flag}';
		if(flag!=null&&flag.length>0){
			if(flag=="success"){
				layer.alert("进度设置成功", {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				},function(){
					window.location.href='/process/list';
				});
			}else{
				layer.alert("进度设置失败", {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				},function(){
					window.location.href='/process/list';
				});
			}
		}
	});
	
	function checkForm(){
		var realDate = $("#realDate").val();
		if(realDate==null||realDate.length==0){
			layer.alert("请选择日期", {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			});
			return;
		}
		var pointId = $("select[name='pointId'] option:selected").val();
		if(pointId==null||pointId.length==0){
			layer.alert("该项目已经没有进度节点可选择了", {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			});
			return;
		}
		/* var img = $("#strongId").find("img");
		if(img==null||img.length==0){
			//弹出层
			layer.alert("请上传图片！", {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			});
			return;
		} */
		if(checkPost()){
			//$("#okbtn").attr("disabled","disabled");
			$("#btnInput").attr("disabled","disabled");
			document.saveform.submit();
		}
	}
	/*防重复提交*/
	var isCommitted=false;
	function checkPost(){
		if(!isCommitted){
		  isCommitted=true;
		  return true;
		}else{
			layer.alert("不能重复提交表单", {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			});
			return false;
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
	          /*  var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
	           img.width  =  rect.width;
	           img.height =  rect.height;
	           //img.style.marginLeft = rect.left+'px';
	           img.style.marginTop = rect.top+'px'; */
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
 /* function clacImgZoomParam( maxWidth, maxHeight, width, height ){
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
} */
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
	function checkDate(){
		var isCheck = $("#isCheck").val();
		var realDateStr = $("#realDate").val();
		if(isCheck == 1){
			var realDate = new Date(realDateStr.replace(/-/g,"/"));
			var nowDateStr = $("#nowDate").val();
			var nowDate = new Date(nowDateStr.replace(/-/g,"/"));
			var n = nowDate.getTime()+2*24*60*60*1000;
			var resultDate = new Date(n);
			if(realDate<resultDate){
				layer.alert("只能选择两天或两天以后的时间", {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				});
				$("#realDate").val("");
				$("#realDate").focus();

			}
		}else{
			var realDate = new Date(realDateStr.replace(/-/g,"/"));
			var nowDateStr = $("#nowDate").val();
			var nowDate = new Date(nowDateStr.replace(/-/g,"/"));
			if(realDate<nowDate){
				layer.alert("只能选择今天或今天以后的时间", {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				});
				$("#realDate").val("");
				$("#realDate").focus();

			}
		}
	}
</script>
</head>

<body>
    <!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>设置进度</h6>
        	<a href="/process/list"><img src="/assets-new/img/esc.png"></a>
        </header>
        <form action="/process/set" method="post" id="saveform" enctype="multipart/form-data" name="saveform">
        <input type="hidden" name="orderNo" value="${order.orderNo }">
        <input type="hidden" name="isCheck" id="isCheck" value="${temList[0].isCheck }">
        <input type="hidden" name="nowDate" id="nowDate" value="${nowDate }">
        <div class="fill_broadcast">
        	<p>
				<span>业主：</span>
				<b>${order.community }${order.building }-${order.unit }-${order.room }-${order.userName }</b>
			</p>
			<p>
				<span>完成进度节点：</span>
				<select name="pointId" style="display: none;">
                	<c:forEach var="item" items="${temList }">
                    	<option value="${item.id }">${item.name }</option>
                    </c:forEach>
                </select>
                ${temList[0].name }
            </p>
            <c:if test="${empty temList[0].isCheck or temList[0].isCheck != 1 }">
	            <p>
					<span>实际完成日期：</span>
					<input class="input_date" type="date" name="realDate" id="realDate" onblur="checkDate()"/>
				</p>
            </c:if>
            <!-- <p>
				<span>实际完成日期：</span>
				<input class="input_date" type="date" name="realDate" id="realDate" />
			</p> -->
			<c:if test="${temList[0].isCheck == 1 }">
				<p>
                	<span>期望验收日期：</span>
                	<input class="input_date" type="date" name="realDate" id="realDate" onblur="checkDate()"/>
            	</p>
			</c:if>
			<!-- <p class="textarea_p">
                	<span>备注：</span>期望质检日期
                	<textarea name="reasonInfo" cols="" rows=""></textarea>
            </p> -->
			<p>
				<span>施工照片：</span>
				<strong id="strongId">
					<em>
						<i class="shangchuan photo_pai"></i>
						<input class="photo_input none" multiple accept="image/*" name="imgFile" type="file" onchange="previewImage(this)">
					</em>
					<!-- <em>
						<i><img src="img/photo.jpg"></i>
						<a href="#">删除</a>
					</em>
					<em>
						<i><img src="img/photo.jpg"></i>
						<a href="#">删除</a>
					</em> -->
				</strong>
			</p>
			<!-- <input id="okbtn" class="ok" onclick="checkForm()" type="button" value="确定"> -->
			<input class="ok" id="btnInput" onclick="checkForm()" type="button" value="确定">
        </div>
        </form>
        
        <%-- <div class="content">
        	<form action="/process/set" method="post" id="saveform" name="saveform">
        	<input type="hidden" name="orderNo" value="${order.orderNo }">
        	<div class="start input_p">
                <p>
                	<span>业主：</span>
                    <b>${order.community }${order.building }-${order.unit }-${order.room }-${order.userName }</b>
                </p>
                <p>
                	<span>完成进度节点：</span>
                    <select name="pointId" style="display: none;">
                    	<c:forEach var="item" items="${temList }">
                        	<option value="${item.id }">${item.name }</option>
                        </c:forEach>
                    </select>
                    ${temList[0].name }
                </p>
                <p>
                	<span>实际完成日期：</span>
                    <input class="input_date" type="date" name="realDate" id="realDate" />
                </p>
                <p class="textarea_p">
                	<span>备注：</span>
                	<textarea name="reasonInfo" cols="" rows=""></textarea>
                </p>
                <p>
                	<span>&nbsp;&nbsp;</span>
                    <input class="input_ok" type="button" onclick="checkForm()" value="确定">
                </p>
            </div>
            </form>
        </div> --%>
    </div>
</body>
</html>

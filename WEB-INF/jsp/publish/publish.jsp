<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>项目播报</title>
    <%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <script type="text/javascript">
	$(function(){
        $("body").delegate(".del_img","click",function() {
            $(this).parents(".picWrap").remove();
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
		var result = '${result}';
		if(result!=null&&result.length>0){
			if('success' == result){
				alert("播报成功！");
			}else if('exist' == result){
				alert("系统提示：播报已经存在了");
			}else{
				alert("系统提示：播报失败，请联系系统开发人员");
			}
		}
	});
	
	function clickbtn(){
		var type = $("input[name='newsSegment']:checked").val();
		if('1' == type){
			var newsDate = $("input[name='newsDate']").val();
			var newsContent = $("textarea[name='newsContent']").val();
			var newsWorkerInfo = $("textarea[name='newsWorkerInfo']").val();
			var projectDays = $("input[name='projectDays']").val();
			var flag = true;
			if(newsDate==null||newsDate.length==0){
				alert("请填写施工日期！");
                flag=false;
				return false;
			}
			if(newsContent==null||newsContent.length==0){
				alert("请填写施工内容！");
                flag=false;
				return false;
			}
			if(newsWorkerInfo==null||newsWorkerInfo.length==0){
				alert("请填写施工人员！");
                flag=false;
				return false;
			}
			if(projectDays==null||projectDays.length==0){
				alert("请填写开工第几天！");
                flag=false;
				return false;
			}
			if(flag){
				document.publishform.submit();
				return true;
			}else{
				return false;
			}
		}else{
			var flag = true;
			var newsDate = $("input[name='newsDate']").val();
			var projectDays = $("input[name='projectDays']").val();
			if(newsDate==null||newsDate.length==0){
				alert("请选择施工日期！");
				flag = false;
				return false;
			}
			if(projectDays==null||projectDays.length==0){
				alert("请填写开工第几天！");
				flag = false;
				return false;
			}
			var filesSize = $(".picWrap").size()-1;
			if(filesSize==null||filesSize<1||isNaN(filesSize)){
				alert("请选择图片！");
				flag = false;
				return false;
			}
			if(flag){
                var ids=[];
                $(".workerUpBuildPic").each(function() {
                    var id=$(this).data("id");
                    ids.push(id);
                });
                $("input[name='workerImgIds']").val(ids);
                document.publishform.submit();
                return true;
			}else{
				return false;
			}
		}
	}
	function checkday(){
		var projectDays = $("input[name='projectDays']").val();
		var days = parseFloat(projectDays);
		if(days<1){
			alert("请填写正确的天数！");
			$("input[name='projectDays']").val("");
			$("input[name='projectDays']").focus();

		}
	}
	
	var no = 1;
	function previewImage(file){
        var picLabel = $(file).parent(".picLabel");
        if (file.files && file.files[0]){
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
                "<label class='picLabel'>"+
                "<input accept='image/*' name='imgFile' style='display:none;' type='file' onchange='previewImage(this)'>"+
                "</label>"+
                "</div>";
        $(".meUpBuildPic").append(str);
    }
</script>
</head>

<body>
    <!--右侧内容框架-->
    <div class="content">
        <!--项目播报-->
        <div class="title">
            <h2>项目播报</h2>
            <a href="/publish/list"><img src="/assets-new/4th/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <div class="projectForm">
            <form action="/publish/publish" method="post" name="publishform" onsubmit="return savePublish()" enctype="multipart/form-data">
            <input type="hidden" name="orderNo" value="${item.orderNo }">
            <input type="hidden" name="workerImgIds">
                <div class="formGroupBox">
                    <div class="formGroup">
                        <label>顾客</label>
                        <p><span>${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }</span></p>
                    </div>
                    <div class="formGroup">
                        <label>播报类型</label>
                        <p>
                            <input id="am" type="radio" name="newsSegment" value="1" checked="checked"><label class="radio radio_hover" for="am">早晨播报</label>
                            <input id="pm" type="radio" name="newsSegment" value="2"><label class="radio" for="pm">晚间播报</label>
                        </p>
                    </div>
                    <div class="formGroup">
                        <label for="buildDate">施工日期</label>
                        <p class="iconForward"><input id="buildDate" class="taskInputdate" type="date" name="newsDate" value=""></p>
                    </div>
                    <div class="formGroup">
                        <label for="buildDay">开工第几天</label>
                        <p class="iconForward"><input id="buildDay" type="number" name="projectDays" onblur="checkday()" onkeyup="this.value=this.value.replace(/[^(\d)]/g,'')"></p>
                    </div>
                    <div class="amBuildDet">
                        <div class="formGroup">
                            <label>施工内容：</label>
                            <p><textarea name="newsContent" placeholder="输入施工内容。。。"></textarea></p>
                        </div>
                        <div class="formGroup">
                            <label>施工人员：</label>
                            <p><textarea name="newsWorkerInfo"></textarea></p>
                        </div>
                    </div>
                    <div class="pmBuildDet formGroup" style="display:none;">
                        <label>施工照片</label>
                        <div class="upBuildPic meUpBuildPic">
                            <c:if test="${!empty news}">
                                <c:forEach items="${news}" var="new1">
                                    <div class="picWrap workerUpBuildPic" data-id="${new1.id}">
                                        <label class="picLabel">
                                            <span style="position:absolute;left:0;top:0;z-index:20"><font color="red">${new1.workerName}</font></span>
                                            <img src="${new1.imgUrl}">
                                            <a href='javascript:void(0);' class='del_img' data-id="${new1.id}">删除</a>
                                        </label>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <div class="picWrap">
                                <label class="picLabel">
                                    <input type="file" name="imgFile" value="" style="display:none;" onchange="previewImage(this)">
                                </label>
                            </div>
                        </div>
                        <div class="tips">＊必须上传照片</div>
                    </div>
                </div>
                <div class="submitWrap">
                	<!-- <input type="button" onclick="savePublish()" value="发送播报"> -->
                	<button class="inputSubmit" onclick="return clickbtn();">发送播报</button>
                </div>
            </form>
        </div>
    </div>
    <!--右侧内容框架结束-->
    <!--本页JS-->
    <script>
        $(function () {
            //隐藏返回按钮
            $(".nav").css("left","-16%");
            $(".nav").removeClass("animate");
            $(".content,.title").css("width","100%");

            //切换早播、晚播
            /* var curTime = new Date();
            if(curTime.getHours() > 12){
                $("label[for=pm]").click();
                $(".amBuildDet").hide();
                $(".pmBuildDet").show();
            } */
            $("label[for=am]").click(function () {
                $(".pmBuildDet").hide();
                $(".amBuildDet").show();
            });
            $("label[for=pm]").click(function () {
                $(".amBuildDet").hide();
                $(".pmBuildDet").show();
            });
            $("#labelId").click(function(){
            	$(this).children("input").click();
            })
        })
    </script>
</body>

</html>
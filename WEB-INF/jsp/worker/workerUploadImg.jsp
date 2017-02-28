<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0"/>
		<title>上传照片</title>
        <link rel="stylesheet" type="text/css" href="/assets/css/css_wechat.css"/>
       	<link rel="stylesheet" type="text/css" href="/assets/css/css_wechat_6.css" media="screen and (min-width:375px)"/>
		<link rel="stylesheet" type="text/css" href="/assets/css/css_wechat_6plus.css" media="screen and (min-width:414px)"/>
	</head>
	<body>
		<div class="p_task">
			<h1>请进行拍照上传，要求至少<b>6</b>张</h1>
			<form action="/weixinUtilController/uploadImg" method="post" enctype="multipart/form-data" onsubmit="return checkInfo();">
				<input type="hidden" name="taskId" value="${taskId}">
				<input type="hidden" name="contractNo" value="${contractNo}">
				<input type="hidden" name="weixin" value="${weixin}">
		        <ul>
			        <li>
						<img src="${photo1}" id="show-picture1" class="preImg">
						<input type="file" id="take-picture1" name="file" accept="image/*" class="inputFile">
					</li>
					<li>
						<img src="${photo2}" id="show-picture2" class="preImg">
						<input type="file" id="take-picture2" name="file" accept="image/*" class="inputFile">
					</li>
					<li>
						<img src="${photo3}" id="show-picture3" class="preImg">
						<input type="file" id="take-picture3" name="file" accept="image/*" class="inputFile">
					</li>
					<li>
						<img src="${photo4}" id="show-picture4" class="preImg">
						<input type="file" id="take-picture4" name="file" accept="image/*" class="inputFile">
					</li>
					<li>
						<img src="${photo5}" id="show-picture5" class="preImg">
						<input type="file" id="take-picture5" name="file" accept="image/*" class="inputFile">
					</li>
					<li>
						<img src="${photo6}" id="show-picture6" class="preImg">
						<input type="file" id="take-picture6" name="file" accept="image/*" class="inputFile">
					</li>
		        </ul>
		        <div class="p_note">
		        	<h2>注意</h2>
		            <p>1、请尽量竖着拍照</p>
		            <p>2、如果施工地点没有网络，无法上传时，请先用手机自带相机拍照，然后在有网络时选取图片上传</p>
		        </div>
		        <p id="error"></p>
		        <input class="p_submit" type="submit" value="上传图片，完成任务"/>
	        </form>
		</div>
	</body>
</html>
<script type="text/javascript" src="/assets/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("li").click(function() {
			var fileInput=$(this).children(".inputFile")[0];
			var img=$(this).children(".preImg")[0];
			fileInput.click();
			cameraAndShow(fileInput,img);
		});
	});
	function cameraAndShow(fileInput,img) {
		if(fileInput&&img) {
			fileInput.onchange=function(event) {
				var files=event.target.files,file;
				if(files&&files.length>0) {
					file=files[0];
					try {
						var fileReader=new FileReader();
						fileReader.readAsDataURL(file);
						fileReader.onload=function(event) {
							img.src=event.target.result;
						};
					} catch(e) {
						var $error=$("#error");
						if($error) {
							$error.html("您的浏览器不支持图片预览！");
						}
					}
				}
			};
		}
	}
	function checkInfo() {
		var flag=true;//表示验证通过
		$(":file").each(function() {
			if($(this).val()=="") {
				alert("请选择图片！");
				flag=false;
				return false;
			}
		});
		return flag;
	}
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>质检列表</title>
<link href="<%=basePath %>assets-new/css/qualityCheck/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>assets-new/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath %>assets-new/js/qualityCheck/zhijian.js"></script>

<link rel="stylesheet" type="text/css" href="<%=basePath %>assets-new/css/qualityCheck/mb.zoomify.css" media="screen" />
<script type="text/javascript" src="<%=basePath %>assets-new/js/qualityCheck/mb.zoomify.js"></script>
</head>

<body>
	<!--头部-->
	<header class="head_unified">
		<a 
		<c:if test="${checktype==10}">href="/qualityCheck/xjlist"</c:if>
		<c:if test="${checktype==20}">href="/qualityCheck/inviteList"</c:if>
		<c:if test="${checktype==30 || checktype == 40}">href="/qualityCheck/rechecklist"</c:if>>
		
		<img src="<%=basePath %>assets-new/img/qualityCheck/esc.png"></a> 
		质检
		 <a class="head_right"><img class="login"
			src="<%=basePath %>assets-new/img/qualityCheck/login.png"></a>
		<div class="login_show">
			<a class="login_gai" href="/qualityCheck/showReset">修改密码</a> <a
				class="longin_esc" href="/qualityCheck/logout">退出登录</a> <img
				src="<%=basePath %>assets-new/img/qualityCheck/login3.png">
		</div>

	</header>
	<!--质检-->
	<div class="j_qualified">

		<div class="j_function">
			<c:if test="${checktype == 10 || checktype == 20}">
				<a href="#" id="gobackselectCategory">更改检查项</a>
			</c:if>

			<c:if test="${checktype == 10 || checktype == 20 || checktype == 40}">
				<img class="photo" src="<%=basePath %>assets-new/img/qualityCheck/ipad.png">
				<p><label onclick="showImg('${checkId}')"> 已拍<span	id="span_imgNum">${imgNum}</span>张</label></p>
				<input name="imgfile" type="file" accept="image/*" multiple="multiple">
			</c:if>
			<c:if test="${checktype == 30}">
				<label onclick="showImg('${checkId}')" style="font-size: 1.1rem; color: #0080ff; line-height: 2rem; display: block; text-align: center;">查看照片</label>
			</c:if>

		</div>


		<form id="checkForm" action="/qualityCheck/updateCheckList"
			method="post">
			<input type="hidden" name="checkId" value="${checkId}">
			<input type="hidden" name="checktype" value="${checktype}">
			<c:forEach var="item" varStatus="st" items="${checkDetails}">
				<!--检查1-->
				<div class="j_project">

					<!--左侧-->
					<div class="j_project_l">
						<h3>
							<span>${st.index + 1}</span> ${item.checkName }
						</h3>


						<c:if test="${item.standard != null and item.standard != ''}">
							<div class="standard"><p>检查标准：${item.standard}</p></div>
						</c:if>
						<c:if test="${item.standard == ''}">
							<div class="standard"><p>检查标准：无</p></div>
						</c:if>


						<div class="j_projectxz">
							<input type="hidden" name="detailId" value="${item.detailId }" />

							<input type="radio" name="isOk${st.index}" id="isOk${st.index}_1" class="j_inputok" value="0" style="display: none;"
								<c:if test="${item.status eq 0 || item.status == null}">checked="checked"</c:if> />
							<label for="isOk${st.index}_1">合格</label> 
							
							<input type="radio" name="isOk${st.index}" id="isOk${st.index}_2" class="j_input" value="1" style="display: none;"
								<c:if test="${item.status eq 1}">checked="checked"</c:if> /> 
							<label for="isOk${st.index}_2">不合格</label>
							<div class="j_projectcl"
								<c:if test="${item.status eq 1}">style="display:block;"</c:if>>
								<span data-index="${st.index}"> 
								<c:choose>
										<c:when
											test="${item.disposeWarning != 1 && item.disposeRectificationNow != 1 && item.disposeRectificationDelay != 1 && item.disposeFine!= 1}">
											<b>未处理</b>
										</c:when>
										<c:otherwise>
                      					已处理
                      					</c:otherwise>
								</c:choose>
								</span> 
								<input id="index" type="hidden" value="${st.index}" /> 
								<input id="desp${st.index}" type="hidden" value="${item.checkDescription}" /> 
								<input id="detailIdpop_anpop_an${st.index}" type="hidden" value="${item.detailId }">

								<!-- input id="desType${st.index}" type="hidden" value="${item.disposeType}"/-->
								<input id="disposeWarning${st.index}" type="hidden" value="${item.disposeWarning}"> 
								<input id="disposeRectificationNow${st.index}" type="hidden" value="${item.disposeRectificationNow}"> 
								<input id="disposeRectificationDelay${st.index}" type="hidden" value="${item.disposeRectificationDelay}"> 
								<input id="disposeFine${st.index}" type="hidden" value="${item.disposeFine}"> 
								<input id="detailId${st.index}" type="hidden" value="${item.detailId }"> 
								<input id="ltm${st.index}" type="hidden" value="${item.limitTimelong}" /> 
								<input id="ctp${st.index}" type="hidden" value="${item.checkType}" /> 
								<input id="dsm${st.index}" type="hidden" value="${item.disposeMoney}" /> 
								<input id="mustPhoto${st.index}" type="hidden" value="${item.mustPhoto}">

							</div>
							

							<c:if test="${item.status != null}">
								<input type="hidden" name="isOk" value="${item.status }">
							</c:if>
							<c:if test="${item.status == null}">
								<input type="hidden" name="isOk" value="0">
							</c:if>

						</div>
					</div>

				</div>
			</c:forEach>
			
			<span style="color: red;">${errorMessage}${message}</span>
			
			<!-- kenan 加上一个和底部大小一样的占位空格    因为底部是 position:fixed -->
			<br />
			<br />


			<!--底部-->
			<div class="j_bottom">
				<input id="optType" type="hidden" name="opt" value="save" /> 
				<span><a id="zancun" onclick="document.getElementById('checkForm').submit()">暂存</a></span>
				<span><a class="orangeBtn" href="javascript:void(0);" onclick="submit1()">提交报告</a></span>
			</div>
		</form>
	</div>
	<!--弹窗-->
	<div class="pop_project">
		<div class="pop_projectc">
			<a class="pop_close"><img
				src="<%=basePath %>assets-new/img/qualityCheck/esc1.png"></a>
			<p>
				<span>违规形式：</span>
				<textarea name="desp" cols="" rows=""></textarea>
			</p>
			<input name="index" type="hidden" /> 
			<input name="detailId" type="hidden"> 
			<input type="hidden" name="checkId" value="${checkId}">
			<p>
				<span>处理方式：</span> 
				<input type="checkbox" name="disposeWarning" id="punished1_1" style="display: none;"/> 
				<label id="disposeWarninglabel" for="punished1_1">警告</label> 
				<input type="checkbox" name="disposeRectificationNow" id="punished1_2" style="display: none;"/> 
				<label id="disposeRectificationNowlabel" for="punished1_2">现场整改</label> 
				<input type="checkbox" name="disposeRectificationDelay" id="punished1_3" style="display: none;" />
				<label id="disposeRectificationDelaylabel" for="punished1_3">限期整改</label>
				<b class="zhenggai"> 
					<label>请选择复检日期</label> 
					<input name="limitTime" type="date"  /> 
					<input type="radio" name="checkType" id="change1" value="1" style="display: none;"/> 
					<label id="checkType" for="change1">线上复检</label> 
					<input type="radio" name="checkType" id="change2" value="2" style="display: none;"/> 
					<label id="checkType" for="change2">现场复检</label>
				</b> 
				<input type="checkbox" name="disposeFine" id="punished1_4" style="display: none;"/> 
				<label id="disposeFinelabel" for="punished1_4">罚款</label> 
				<b class="rmb">
					<input name="disposeMoney" type="text" placeholder="罚款金额" />
				</b>
			</p>

			<input class="pop_an" name="" type="button" value="确定">
		</div>
	</div>


	<!-- Modal 弹出显示照片的框 -->
	<div id="showphoto"
		style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, .5); display: none;">
		<div id="photodiv"
			style="background: #fff; font-size: 1rem; width: 94%; margin: 0 auto; position: relative; padding: 2.8rem 1rem 0; overflow: auto; height: 80%">
			<a class="pop_close"><img
				src="<%=basePath %>assets-new/img/qualityCheck/esc1.png"></a>
			<!--头部-->
			<header class="head_unified"  style="height:1.4rem; line-height:0rem">
				<%-- <a href="${proUrl}"><img src="<%=basePath %>assets-new/img/qualityCheck/esc.png"></a> --%>
				照片列表
			</header>
			<!--照片列表-->
			<ul id="thumbs" class="photo_list">
			</ul>
		</div>
	</div>

<script type="text/javascript">
    		$(document).ready(function() {
					$("input[type=radio]").change(function() {
								$(this).parent().parent().find("input[name=isOk]").val($(this).val());
					})
			})
			
			
$("a[id=gobackselectCategory]").click(function(){
	var form = $("<form method='post' action='/qualityCheck/showSelectCategory' ></form>");
	var checkid = $("<input name='checkId' type='hidden' value='${checkId}'/> ");
	var checktype = $("<input name='checktype' type='hidden' value='${checktype}'/> ");
	form.append(checkid).append(checktype);
	$("body").append(form);
	
	form.submit();
});
			
			
			function showImg(checkId){
    			$("#showphoto").toggle();
    			$("#thumbs").empty();$("#thumbs").html("读取中...........................");
    	      	var checkType = "${checktype}";
    			
				$.post("/qualityCheck/ImageList",{checkId:checkId},
						function(rs){
							
							var div = $("#thumbs");
							$("#thumbs").empty();
							
							for(var i = 0; i < rs.length; i++){
								
								var imginfo = rs[i];
								var str = "<li><img src='" + imginfo.imgThumbnailUrl + "' data-highres='" + imginfo.imgUrl + "' onclick='$(this).mbZoomify_overlay({startLevel:-1});'>";
								if(checkType != 30){
									str += "<label class='photo_listdelete' data-id='" + imginfo.id + "' >删除</label>";
								}
								str += "</li>";
						        
								div.append(str);
				
							}
							var height = $(window).height()
							var popheight = $("#photodiv").height()
		    				var poptop = (height-popheight)/2
    						$("#photodiv").css("margin-top",poptop)
    						$("body").css("overflow","hidden")
						},"json");
				
			}
			
    		
    		$(".photo_listdelete").live("click",function(){
    			var id = $(this).attr("data-id");
    			var labeltext = $(this).html();
    			if(labeltext == "删除"){
	    			$(this).html("处理中");
    			}else{
    				return;
    			}
    			
    			var clickeddiv = $(this)
    			$.post("/qualityCheck/deleteImage",{id:id},
						function(rs){
							
							var div = $("#thumbs");
							var flag = rs.flag;
							var msg = rs.msg;
							if(flag == 0){
								//clickeddiv.parent().html("");
								clickeddiv.parent().hide();
							}else if(flag == 1){
								clickeddiv.html(msg);
							}
							
							var num = $("#span_imgNum").html();
							$("#span_imgNum").html(num-1);
							
							var height = $(window).height()
							var popheight = $("#photodiv").height()
		    				var poptop = (height-popheight)/2
    						$("#photodiv").css("margin-top",poptop)
    						$("body").css("overflow","hidden")
						},"json");
    		});
    		
    		
    		
    		$("#zancun").click(function(){
    			//记录暂存日志
    			operationLog(21);
    		});
    		
			
		    function submit1()
      		{
				if(confirm("是否要提交报告")){
					
					
					var isoklist = document.getElementsByName("isOk");
					for (var i = 0; i < isoklist.length; i++) {
						var isok = isoklist[i].value;
						if(isok == null || isok == undefined || isok == ""){
							alert("有未处理项,请先处理在提交");
							
							return;
						}
						
						
						var disposeWarning = $("#disposeWarning" + i + "").val();
						var disposeRectificationNow = $("#disposeRectificationNow" + i + "").val();
						var disposeRectificationDelay = $("#disposeRectificationDelay" + i + "").val();
						var disposeFine = $("#disposeFine" + i + "").val();
						if(isok == "1" && disposeWarning != 1 && disposeRectificationNow != 1 && disposeRectificationDelay != 1 && disposeFine != 1){
							alert("有未处理项,请先处理在提交");
							return;
						}
						
					  /*var mustPhoto = $("#mustPhoto" + i + "").val();
						var num =$("#span_" + i).html();
						if(mustPhoto == 0 && num < 1 && mustPhoto != ""){
							alert("有未拍照项,请先处理在提交");
							return;
						} */
						var num =$("#span_imgNum").html();
						if(num < 1){
							alert("请先至少上传一张照片,在提交");
							return;
						}
					}
					
					
					//记录日志提交报告
					operationLog(22);
					
					$("input[id=optType]").val('submit');
					document.forms['checkForm'].submit();
					$("input[id=optType]").val('save');
				} 
      		}
	</script>
</body>
</html>

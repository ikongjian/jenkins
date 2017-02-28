<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="en" uri="/enumTag"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<title>申请竣工</title>
<style type="text/css">
 input[type=button] {
  margin-top: 1rem;
  width: 100%;
  height: 5.5rem;
  font-size: 2.4rem;
  background: #ed6c00;
  border-radius: 0.5rem;
  color: #fff;
}
.photo_input{ display:none;}
.input_none{ display:none;}/*隐藏input*/
</style>
<script type="text/javascript">
    $(function() {
        $(".photo_pai").click(function() {
            $(this).parent().find("input").click();
        });
    });
//防重复
var isCommitted = true;//表单是否已经提交标识，默认为false
function checkSumbit(form){
    if(isCommitted==false){
        isCommitted = true;//提交表单后，将表单是否已经提交标识设置为true
        $("form[name="+ form +"]").submit();
    }else{
        //返回false那么表单将不提交
    }
}
function fileClick(){
	isCommitted = false;
}
function savebtn(){
	var planCompleteDate = $("#planCompleteDate").val().trim();
	if(planCompleteDate==null||planCompleteDate.length==0){
		//弹出层
		layer.alert("请填写实际竣工日期",{icon:2});
		return false;
	} else {
		$.ajax({
			url:"/stuffAccept/validDate",
			type:"post",
			dataType:"json",
			async:false,
			cache:false,
			success:function(result) {
				$("#nowDate").val(result.nowDate);
			}
		 });
		var nowDate=$("#nowDate").val().trim();
		var date=new Date(Date.parse(planCompleteDate.replace(/-/g,"/")));
		var todayDate;
		if(nowDate!=null&&nowDate!="") {
			todayDate=new Date(Date.parse(nowDate.replace(/-/g,"/")));
		} else {
			todayDate=new Date();
		}
		var year=todayDate.getFullYear();
		var month=(todayDate.getMonth()+1)>=10?(todayDate.getMonth()+1):"0"+(todayDate.getMonth()+1);
		var day=todayDate.getDate()>=10?todayDate.getDate():"0"+todayDate.getDate();
		var targetDayStr=year+"-"+month+"-"+day;
		var targetDay=new Date(Date.parse(targetDayStr.replace(/-/g,"/")));
		if(date<targetDay) {
			layer.alert("选择的竣工日期必须为："+targetDayStr+"（含）日之后的时间",{icon:2});
			return false;
		}
	}
	var img1 = $("form[name=firstForm]").find("img").attr("src");
	if(img1==null){
		//弹出层
		layer.alert("请上传工程验收单图片！",{icon:2});
		return false;
	}
    /*var img2 = $("form[name=secondForm]").find("img").attr("src");
    if(img2==null){
        //弹出层
        layer.alert("请上传工期洽商变更（延期）单图片！",{icon:2});
        return false;
    }
    var img3 = $("form[name=thridForm]").find("img").attr("src");
    if(img3==null){
        //弹出层
        layer.alert("请上传客户保修单图片！",{icon:2});
        return false;
    }*/
	var orderNo = $("form[name=firstForm]").find("input[name=orderNo]").val();
	var bohuiFlag = $("form[name=firstForm]").find("input[name=bohuiFlag]").val();
	$.post("/workComplete/saveProjectComplete",
			{orderNo:orderNo,planCompleteDate:planCompleteDate,bohuiFlag:bohuiFlag},
			function(data){
				//弹出层
				layer.alert(data.msg,{icon:2},function(){
					window.location.href='/workComplete/toProjectCompleteList';
				});
				
	});
}
var layers;
function shiliClick(type){
	var url = "";
	var title = "";
	if("first" == type){
		url = "/assets-new/img/ysd.jpg";
		title = "工程竣工验收单实例图片";
	}
	if("second" == type){
		url = "/assets-new/img/bgd.jpg";
		title = "工期洽商变更（延期）单实例图片";
	}
	if("third" == type){
		url = "/assets-new/img/bxd.jpg";
		title = "客户保修单实例图片";
	}
	//页面层
	 layers = layer.open({
		title :title,
	    type: 1,
	    skin: 'layui-layer-rim', //加上边框
	    area: ['640px', '580px'], //宽高
	    content: "<img src='"+ url +"' onclick='closeLayer()'></img>"
	});
}
function closeLayer(){
	layer.close(layers);
}
function closeA(){
	$(".endg_tc").hide();
}
function completeDateOnblur(){
	var planCompleteDate = $("#planCompleteDate").val();
	$("input[name='planCompleteDate']").each(function(){
		$(this).val(planCompleteDate);
	});
}

</script>
</head>

<body>

 <input type="hidden" id="nowDate">
 
 <div class="content">
        <!--申请竣工-->
        <div class="title">
            <h2>申请竣工</h2>
            <a href="/workComplete/toProjectCompleteList"><img src="/assets-new/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <div class="projectForm applyFinish">
            <h3>请按照下面的规则上传照片</h3>
           
                <div class="formGroupBox">
                    <div class="formGroup">
                        <label>实际竣工日期</label>
                        <p class="iconForward">
                            <input id="planCompleteDate" class="taskInputdate" name="planCompleteDate" id="planCompleteDate" type="date" name="planCompleteDate" onblur="completeDateOnblur()" value="${planCompleteDate }">
                        </p>
                    </div>
                    <div class="formGroup">
                        <div class="upBuildPic">
                            <ul>
                              <form action="/workComplete/threePath/upLoadImg" method="post" name="firstForm" enctype="multipart/form-data">
			                    <input type="hidden" name="type" value="1"/>
			                    <input type="hidden" name="orderNo" value="${orderNo }"/>
			                    <input type="hidden" name="bohuiFlag" value="${bohuiFlag }"/>
			                    <input type="hidden" name="planCompleteDate" value="${planCompleteDate }"/>
			                    <c:if test="${image == null }">
			                        <c:if test="${imgList == null }">
			                        	<!--拍照-->
						            	<li>
						                	<span>1、工程验收单</span>
						                    <label for="upPic1">
                                                <input id="upPic1"  class="photo_input input_none" name="imgfile" type="file" onclick="fileClick()" onchange="checkSumbit('firstForm')">
                                            </label>
						                    <a class="endg_sl" href="javascript:void(0);" onclick="shiliClick('first')">点击查看示例</a>
						                </li>
			                        </c:if>
			                        <c:if test="${imgList != null }">
			                        	<c:forEach var="item" items="${imgList }">
			                        		<c:if test="${item.type==1 }">
			                        			<!--这是拍完照片的-->
								                <li>
								                	<span>1、工程竣工验收单</span>
								                    <label for="upPic2">
                                                        <img src="${DOMAIN_NAME }${item.url }?math=${math}"/>
                                                        <input id="upPic2"  class="photo_input input_none" name="imgfile" type="file" onchange="checkSumbit('firstForm')">
								                    </label>
								                    <a class="endg_sc photo_pai" href="javascript:void(0);" onclick="fileClick()">重新上传</a>
								                    <c:set var="flag" value="firstHas"></c:set>
								                    <a class="endg_sl" href="javascript:void(0);"  onclick="shiliClick('first')">点击查看示例</a>
								                </li>
			                        		</c:if>
			                        	</c:forEach>
			                        	<c:if test="${flag != 'firstHas' }">
				                       			<c:if test="${item.type!=1 }">
				                       				<!--拍照-->
									            	<li >
									                	<span>1、工程竣工验收单</span>
									                    <label for="upPic3">
                                                            <input id="upPic3" class="photo_input input_none" name="imgfile" type="file" onclick="fileClick()" onchange="checkSumbit('firstForm')">
                                                        </label>
									                    <a class="endg_sl" href="javascript:void(0);"  onclick="shiliClick('first')">点击查看示例</a>
									                </li>
				                       			</c:if>
				                       		</c:if>
			                        </c:if>
			                    </c:if>
				            	<c:if test="${image != null }">
				            		<c:if test="${image.type == 1 }">
				            			<!--这是拍完照片的-->
						                <li >
						                	<span>1、工程竣工验收单</span>
						                    <label for="upPic4">
                                                <img src="${DOMAIN_NAME }${image.url }?math=${math}" />
                                                <input id="upPic4" class="photo_input input_none" name="imgfile" type="file" onclick="fileClick()" onchange="checkSumbit('firstForm')">
						                    </label>
						                    <a class="endg_sc photo_pai" href="javascript:void(0);">重新上传</a>
						                    <a class="endg_sl" href="javascript:void(0);"  onclick="shiliClick('first')">点击查看示例</a>
						                </li>
				            		</c:if>
				            		<c:if test="${image.type != 1 }">
				            			<c:if test="${imgList == null }">
				                        	<!--拍照-->
							            	<li >
							                	<span>1、工程竣工验收单</span>
							                    <label for="upPic5">
                                                    <input id="upPic5" class="photo_input input_none" name="imgfile" type="file" onclick="fileClick()" onchange="checkSumbit('firstForm')">
                                                </label>
							                    <a class="endg_sl" href="javascript:void(0);"  onclick="shiliClick('first')">点击查看示例</a>
							                </li>
			                        	</c:if>
			                        	<c:if test="${imgList != null }">
				                        	<c:forEach var="item" items="${imgList }">
				                        		<c:if test="${item.type==1 }">
				                        			<!--这是拍完照片的-->
									                <li>
									                	<span>1、工程竣工验收单</span>
									                    <label for="upPic6">
                                                            <img src="${DOMAIN_NAME }${item.url }?math=${math}"/>
                                                            <input id="upPic6" class="photo_input input_none" name="imgfile" type="file" onchange="checkSumbit('firstForm')">
									                    </label>
									                    <a class="endg_sc photo_pai" href="javascript:void(0);" onclick="fileClick()">重新上传</a>
									                    <a class="endg_sl" href="javascript:void(0);" onclick="shiliClick('first')">点击查看示例</a>
									                </li>
									                <c:set var="firstHasFlag" value="firstHasFlag"></c:set>
				                        		</c:if>
				                        	</c:forEach>
				                        	<c:if test="${firstHasFlag != 'firstHasFlag' }">
				                        		<!--拍照-->
								            	<li >
								                	<span>1、工程竣工验收单</span>
								                    <label for="upPic7">
                                                        <input id="upPic7" class="photo_input input_none" name="imgfile" type="file" onclick="fileClick()" onchange="checkSumbit('firstForm')">
                                                    </label>
								                    <a class="endg_sl" href="javascript:void(0);"  onclick="shiliClick('first')">点击查看示例</a>
								                </li>
				                        	</c:if>
				                        </c:if>
				            		</c:if>
				            	</c:if>
			               </form>
                          
                           <form action="/workComplete/threePath/upLoadImg" method="post" name="secondForm" enctype="multipart/form-data">
			                	<input type="hidden" name="type" value="2"/>
			                    <input type="hidden" name="orderNo" value="${orderNo }"/>
			                    <input type="hidden" name="bohuiFlag" value="${bohuiFlag }"/>
			                    <input type="hidden" name="planCompleteDate" value="${planCompleteDate }"/>
			                    <c:if test="${image == null }">
			                        <c:if test="${imgList == null }">
			                        	<!--拍照-->
						            	<li >
						                	<span>2、工期洽商变更（延期）单</span>
						                    <i class="photo_pai"><span></span></i>
						                    <label for="upPic8">
                                                <input id="upPic8" class="photo_input input_none" name="imgfile" type="file" onclick="fileClick()" onchange="checkSumbit('secondForm')">
                                            </label>
						                    <a class="endg_sl" href="javascript:void(0);"  onclick="shiliClick('second')">点击查看示例</a>
						                </li>
			                        </c:if>
			                        <c:if test="${imgList != null }">
			                        	<c:forEach var="item" items="${imgList }">
			                        		<c:if test="${item.type==2 }">
			                        			<!--这是拍完照片的-->
								                <li>
								                	<span>2、工期洽商变更（延期）单</span>
								                    <label  for="upPic9">
                                                        <img src="${DOMAIN_NAME }${item.url }?math=${math}" />
                                                        <input id="upPic9" class="photo_input input_none" name="imgfile" type="file" onchange="checkSumbit('secondForm')">
								                    </label>
								                    <a class="endg_sc photo_pai" href="javascript:void(0);" onclick="fileClick()">重新上传</a>
								                    <c:set var="flag" value="secondHas"></c:set>
								                    <a class="endg_sl" href="javascript:void(0);"  onclick="shiliClick('second')">点击查看示例</a>
								                </li>
			                        		</c:if>
			                        	</c:forEach>
			                        	<c:if test="${flag != 'secondHas' }">
				                       			<c:if test="${item.type!=2 }">
				                       				<!--拍照-->
									            	<li >
									                	<span>2、工期洽商变更（延期）单</span>
									                    <label for="upPic10">
                                                            <input id="upPic10" class="photo_input input_none" name="imgfile" type="file" onclick="fileClick()" onchange="checkSumbit('secondForm')">
                                                        </label>
									                    <a class="endg_sl" href="javascript:void(0);" onclick="shiliClick('second')">点击查看示例</a>
									                </li>
				                       			</c:if>
				                       		</c:if>
			                        </c:if>
			                    </c:if>
			                    <c:if test="${image != null }">
			                    	<c:if test="${image.type == 2 }">
			                    		<!--这是拍完照片的-->
						                <li>
						                	<span>2、工期洽商变更（延期）单</span>
						                    <label for="upPic11">
                                                <img src="${DOMAIN_NAME }${image.url }?math=${math}" />
                                                <input id="upPic11" class="photo_input input_none" name="imgfile" type="file" onchange="checkSumbit('secondForm')">
						                    </label>
						                    <a class="endg_sc photo_pai" href="javascript:void(0);" onclick="fileClick()">重新上传</a>
						                    <a class="endg_sl" href="javascript:void(0);"  onclick="shiliClick('second')">点击查看示例</a>
						                </li>
			                    	</c:if>
			                    	<c:if test="${image.type != 2 }">
			                    		<c:if test="${imgList == null }">
				                        	<!--拍照-->
							            	<li >
							                	<span>2、工期洽商变更（延期）单</span>
							                    <label for="upPic12">
                                                    <input id="upPic12" class="photo_input input_none" name="imgfile" type="file" onclick="fileClick()" onchange="checkSumbit('secondForm')">
                                                </label>
							                    <a class="endg_sl" href="javascript:void(0);"  onclick="shiliClick('second')">点击查看示例</a>
							                </li>
				                        </c:if>
				                        <c:if test="${imgList != null }">
				                        	<c:forEach var="item" items="${imgList }">
				                        		<c:if test="${item.type==2 }">
				                        			<!--这是拍完照片的-->
									                <li>
									                	<span>2、工期洽商变更（延期）单</span>
									                    <label for="upPic13">
                                                            <img src="${DOMAIN_NAME }${item.url }?math=${math}" />
                                                            <input id="upPic13" class="photo_input input_none" name="imgfile" type="file" onchange="checkSumbit('secondForm')">
									                    </label>
									                    <a class="endg_sc photo_pai" href="javascript:void(0);" onclick="fileClick()">重新上传</a>
									                    <a class="endg_sl" href="javascript:void(0);"  onclick="shiliClick('second')">点击查看示例</a>
									                </li>
									                <c:set var="secondHasFlag" value="secondHasFlag"></c:set>
				                        		</c:if>
				                        	</c:forEach>
				                        	<c:if test="${secondHasFlag !='secondHasFlag' }">
				                        		<!--拍照-->
								            	<li >
								                	<span>2、工期洽商变更（延期）单</span>
								                    <label for="upPic14">
                                                        <input id="upPic14" class="photo_input input_none" name="imgfile" type="file" onclick="fileClick()" onchange="checkSumbit('secondForm')">
                                                    </label>
								                    <a class="endg_sl" href="javascript:void(0);"  onclick="shiliClick('second')">点击查看示例</a>
								                </li>
				                        	</c:if>
				                        </c:if>
			                    	</c:if>
			                    </c:if>
			                </form>
                           
                            <form action="/workComplete/threePath/upLoadImg" method="post" name="thridForm" enctype="multipart/form-data">
			                	<input type="hidden" name="type" value="3"/>
			                    <input type="hidden" name="orderNo" value="${orderNo }"/>
			                    <input type="hidden" name="bohuiFlag" value="${bohuiFlag }"/>
			                    <input type="hidden" name="planCompleteDate" value="${planCompleteDate }"/>
			                    <c:if test="${image == null }">
			                        <c:if test="${imgList == null }">
			                        	<!--拍照-->
						            	<li >
						                	<span>3、客户保修单</span>
						                    <i class="photo_pai"><span></span></i>
						                    <label for="upPic15"><input id="upPic15" class="photo_input input_none" name="imgfile" type="file" onclick="fileClick()" onchange="checkSumbit('thridForm')"></label>
						                    <a class="endg_sl" href="javascript:void(0);"  onclick="shiliClick('third')">点击查看示例</a>
						                </li>
			                        </c:if>
			                        <c:if test="${imgList != null }">
					                	<c:forEach var="item" items="${imgList }">
			                       			<c:if test="${item.type==3 }">
			                       				<li>
								                	<span>3、客户保修单</span>
								                    <label for="upPic16">
								                    <img src="${DOMAIN_NAME }${item.url }?math=${math}" />
								                    <input id="upPic16" class="photo_input input_none" name="imgfile" type="file" onchange="checkSumbit('thridForm')">
								                    </label>
								                    <a class="endg_sc photo_pai" href="javascript:void(0);" onclick="fileClick()">重新上传</a>
								                    <a class="endg_sl" href="javascript:void(0);"  onclick="shiliClick('third')">点击查看示例</a>
								                </li>
								                <c:set var="flag" value="thridHas"></c:set>
			                       			</c:if>
			                       		</c:forEach>
			                       		<c:if test="${flag != 'thridHas' }">
			                       			<c:if test="${item.type!=3 }">
			                       				<!--拍照-->
								            	<li >
								                	<span>3、客户保修单</span>
								                    <i class="photo_pai"><span></span></i>
								                    <label for="upPic17"><input id="upPic17" class="photo_input input_none" name="imgfile" type="file" onclick="fileClick()" onchange="checkSumbit('thridForm')"></label>
								                    <a class="endg_sl" href="javascript:void(0);"  onclick="shiliClick('third')">点击查看示例</a>
								                </li>
			                       			</c:if>
			                       		</c:if>
					                </c:if>
			                    </c:if>
			                    <c:if test="${image != null }">
			                    	<c:if test="${image.type == 3 }">
			                    		<li>
						                	<span>3、客户保修单</span>
						                    <label for="upPic18">
						                    <img src="${DOMAIN_NAME }${image.url }?math=${math}" />
						                    <input id="uppic18" class="photo_input input_none" name="imgfile" type="file" onchange="checkSumbit('thridForm')">
						                    </label>
						                    <a class="endg_sc photo_pai" href="javascript:void(0);" onclick="fileClick()">重新上传</a>
						                    <a class="endg_sl" href="javascript:void(0);"  onclick="shiliClick('third')">点击查看示例</a>
						                </li>
			                    	</c:if>
			                    	<c:if test="${image.type!=3 }">
			                    		<c:if test="${imgList == null }">
				                        	<!--拍照-->
							            	<li >
							                	<span>3、客户保修单</span>
							                    <i class="photo_pai"><span></span></i>
							                    <label for="upPic19"><input id="upPic19" class="photo_input input_none" name="imgfile" type="file" onclick="fileClick()" onchange="checkSumbit('thridForm')"></label>
							                    <a class="endg_sl" href="javascript:void(0);"  onclick="shiliClick('third')">点击查看示例</a>
							                </li>
				                        </c:if>
				                        <c:if test="${imgList != null }">
						                	<c:forEach var="item" items="${imgList }">
				                       			<c:if test="${item.type==3 }">
				                       				<li>
									                	<span>3、客户保修单</span>
									                    <label for="upPic20">
									                    <img src="${DOMAIN_NAME }${item.url }?math=${math}" />
									                    <input id="uppic20" class="photo_input input_none" name="imgfile" type="file" onchange="checkSumbit('thridForm')">
									                    </label>
									                    <a class="endg_sc photo_pai" href="javascript:void(0);" onclick="fileClick()">重新上传</a>
									                    <a class="endg_sl" href="javascript:void(0);"  onclick="shiliClick('third')">点击查看示例</a>
									                </li>
									                <c:set var="thridListHas" value="thridListHas"></c:set>
				                       			</c:if>
				                       		</c:forEach>
				                       		<c:if test="${thridListHas !='thridListHas' }">
				                       			<!--拍照-->
								            	<li>
								                	<span>3、客户保修单</span>
								                    <i class="photo_pai"><span></span></i>
								                    <label for="upPic21"><input id="upPic21" class="photo_input input_none" name="imgfile" type="file" onclick="fileClick()" onchange="checkSumbit('thridForm')"></label>
								                    <a class="endg_sl" href="javascript:void(0);"  onclick="shiliClick('third')">点击查看示例</a>
								                </li>
				                       		</c:if>
						                </c:if>
			                    	</c:if>
			                    </c:if>
			                </form>
                                
                            </ul>
                        </div>
                        <div class="tips">＊必须上传照片</div>
                    </div>
                </div>
                <div class="submitWrap">
                     <input  name="" type="button" value="确认申请竣工" onclick="savebtn();" >
                </div>
            
        </div>
    </div>
     <script>
        $(function () {
            //隐藏返回按钮
            $(".nav").css("left","-16%");
            $(".nav").removeClass("animate");
            $(".content,.title").css("width","100%");
        })
    </script>
</body>
</html>

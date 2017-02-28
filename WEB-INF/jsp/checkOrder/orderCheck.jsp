<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String height = (String)session.getAttribute("height");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>辅材数量复核</title>
     <style type="text/css">
		.table_list tr.numChange td {background:#fff7ec;}
		.content{position:relative;}
    </style>
</head>
<body>
    <div class="content">
	   <div class="title">
	       <h2>辅料核量</h2>
	       <a href="/review/toReviewListPage"><img src="/assets-new/4th/img/esc.png"></a>
	   </div>
	   <hr class="content_hr">
	   <form action="" method="post" id="saveForm">
	   <div class="content_soso">
	       <p class="soso_date">
	           <span>第一次材料进场时间</span>
	           <input class="taskInputdate" type="date" name="sendDate" value="${sendDate}">
	       </p>
	       <p class="soso_name">
	           <span>备注</span>
	           <input type="text" name="remark" value="${remark}">
	       </p>
	   </div>
	   <div class="content_nav">
	       <ul>
	       	   <li class="content_navover" ><a class="buttonclass" href="javascript:void(0);" data-type="all">所有辅料</a></li>
			   <li><a class="buttonclass" href="javascript:void(0);" data-type="common">常用辅料</a></li>
			   <c:forEach var="item" items="${tagList }">
			    <li><a class="buttonclass" href="javascript:void(0);" data-type="${item.code}" id="tag_${item.code}">${item.name }</a></li>
				<%-- <input type="button" class="buttonclass" data-type="${item.code}" id="tag_${item.code}" value="${item.name }"> --%>
			   </c:forEach>
			   <li><a class="buttonclass" data-type="other" href="javascript:void(0);">其他材料</a></li>
			   <!-- <input type="button" class="buttonclass" data-type="other" value="其他材料"/> -->
	       </ul>
	   </div>
	   <input type="hidden" name="ternr" value="${ternr}">
	   <input type="hidden" name="vbeln" value="${vbeln}">
	   <input type="hidden" name="sdabw" value="${sdabw}">
	   <input type="hidden" name="areaCode" value="${areaCode}">
	   <input type="hidden" name="projectManagerName" value="${projectManagerName}">
	   <input type="hidden" name="telephone" value="${telephone}">
	   <table class="table_list" border="0" cellspacing="0" cellpadding="0">
	       <tbody>
	           <tr class="table_listTr">
	           	    <th scope="col" width="8%">序号</th>
					<!-- <th scope="col" width="8%">部类</th> -->
					<th scope="col" width="20%">名称</th>
					<th scope="col" width="8%">SKU</th>
					<th scope="col" width="5%">单位</th>
					<th scope="col" width="8%">预计数量</th>
					<th scope="col" width="13%">实际数量</th>
					<th scope="col" width="8%">单价</th>
					<th scope="col" width="10%">总价</th>
					<th scope="col" width="10%">操作</th>
	           </tr>
	           <c:forEach items="${erpBjlikp.bjlipss}" var="item" varStatus="status">
					<input type="hidden" name="bdart" value="${item.bdart}"/>
					<tr data-sku="${item.matnr}" id="fucai${status.index+1 }" data-tag="${item.tagCode }" data-common="${item.isCommon }">
						<td>${status.index+1}</td>
						<%-- <td>${item.zpdo}</td> --%>
						<td class="td_name">${item.maktg}
						<input name="matnrs" type="hidden" value="${item.matnr}"/>
						<input name="maktgs" type="hidden" value="${item.maktg}"/>
						</td>
						<td>${item.matnr}</td>
						<td>
							<c:if test="${empty item.meins}">
								${item.meinh}
							</c:if>
							<c:if test="${!empty item.meins}">
								${item.meins}
							</c:if>
						</td>
						<td><fmt:formatNumber value="${item.lfimg}" pattern="##"/></td>
						<td>
							<span class="Jian" data-matnr="${item.matnr}" data-oringinval="${item.kmpmg}" data-zpdo="${item.zpdo}">-</span>
								<!-- 数据去掉小数，不四舍五入 -->
								<input name="jiajianshus" class="J_num" type="text" data-matnr="${item.matnr}"
										<c:if test="${item.kmpmg==null||item.kmpmg==''}">
                                            <c:choose>
                                                <c:when test="${fn:contains(item.lfimg,'.')}">
                                                    value="<fmt:formatNumber value="${(fn:substringBefore(item.lfimg,'.'))==''?0:fn:substringBefore(item.lfimg,'.')}" pattern='##'/>" data-originval="${item.lfimg}"
                                                </c:when>
                                                <c:otherwise>
                                                    value="${item.lfimg}" data-originval="${item.lfimg}"
                                                </c:otherwise>
                                            </c:choose>
										</c:if>
										<c:if test="${item.kmpmg!=null&&item.kmpmg!=''}">
                                            <c:choose>
                                                <c:when test="${fn:contains(item.kmpmg,'.')}">
                                                    value="<fmt:formatNumber value="${(fn:substringBefore(item.kmpmg,'.'))==''?0:fn:substringBefore(item.kmpmg,'.')}" pattern='##'/>" data-originval="${item.kmpmg}"
                                                </c:when>
                                                <c:otherwise>
                                                    value="${item.kmpmg}" data-originval="${item.kmpmg}"
                                                </c:otherwise>
                                            </c:choose>
										</c:if> 
										onblur="calSpecialValue(${item.matnr },this,'blur')">
							<span class="Jia" data-matnr="${item.matnr}" data-oringinval="${item.kmpmg}" data-zpdo="${item.zpdo}">+</span>
						</td>
						<td>
							<c:if test="${item.price>0}">${item.price}</c:if>
						</td>
						<td>
							<c:if test="${item.kmpmg==null||item.kmpmg==''}">
								<fmt:formatNumber type="number" value="${item.lfimg*item.price}"/>
							</c:if>
							<c:if test="${item.kmpmg!=null&&item.kmpmg!=''}">
								<fmt:formatNumber type="number" value="${item.kmpmg*item.price}"/>
							</c:if>
						</td>
						<td>
							<c:if test="${item.state!='o'}">
								<a class="td_an" href="javascript:void(0);" data-matnr="${item.matnr}">删除材料</a>
								<input type="hidden" name="addOrUpdate" value="1"/>
							</c:if>
							<c:if test="${item.state=='o'}">
								<input type="hidden" name="addOrUpdate" value="0"/>
							</c:if>
						</td>
					</tr>
				</c:forEach>
	       </tbody>
	   </table>
	   <a class="buttom_2" href="javascript:void(0);"><span>添加材料</span></a>
	   <input type=hidden id="matnrs" name="matnrsList">
	   <input type="hidden" id="addAndUpdateMatnrs" name="addAndUpdateMatnrs"> 
	   <input type="hidden" id="addMatnrs" name="addMatnrs">
	   <input id="okbtn" class="buttom_1" type="button" value="确定">
	   </form>
	   <input type="hidden" id="nowDate">
    </div>
   
    <!--右侧内容框架结束-->
    <!--本页JS-->
    <script type="text/javascript">
		$(function() {
			var matnrs=${matnrs};
			var addMatnrs=${addMatnrs};
			var tMatnrs="",tAddMatnrs="";
			for(var i=0;i<matnrs.length;i++) {
				tMatnrs+=matnrs[i]+",";
				$("tr").each(function() {
					var sku=$(this).data("sku");
					if(matnrs[i]==sku) {
						$(this).addClass("numChange");
					}
				});
			}
			for(var i=0;i<addMatnrs.length;i++) {
				tAddMatnrs+=addMatnrs[i]+",";
			}
			tMatnrs=tMatnrs.substring(0,tMatnrs.length-1);
			tAddMatnrs=tAddMatnrs.substring(0,tAddMatnrs.length-1);
			$("#addAndUpdateMatnrs").val(tMatnrs);
			$("#addMatnrs").val(tAddMatnrs);
			$(".buttom_2").click(function() {
				var matnrs="";
				var sdabw=$("input:hidden[name=sdabw]").val();
				$("tr").each(function() {
					var sku=$(this).data("sku");
					if(sku!=null) {
						matnrs+=sku+",";
					}
				});
				$("#matnrs").val(matnrs);
				var sendDate=$("input[name=sendDate]").val();
				var areaCode=$("input[name='areaCode']").val();
				var projectManagerName=$("input[name='projectManagerName']").val();
				var telephone=$("input[name='telephone']").val();
				var url="/review/threePath/toALLFuCaiListPage?vkorg=${vkorg}&inco1=${inco1}&ternr=${ternr}&werks=${werks}&sdabw="+
						sdabw+"&sendDate="+sendDate+"&areaCode="+areaCode+"&projectManagerName="+projectManagerName+"&telephone="+telephone;
				layer.msg('加载中',{icon: 16});
				$("#saveForm").attr("action",url).submit();
			});
			$(".Jia").click(function() {
				var oldValue=parseInt($(this).parent().find(".J_num").val());//点击增加后的数量 
				var originVal=parseInt($(this).data("oringinval"));//数据库中的原始数据
				//var topLevel=Math.ceil(originVal*1.5);//能增加到的最大值
				var topLevel=Number.MAX_VALUE;
				var ternr=$("input[name=ternr]").val();
				var matnr=$(this).data("matnr");
				var zpdo=$(this).data("zpdo");//部类
				
				/*//部类为水暖或电料的，放开增加时的限制   所有的都放开限制
				if(zpdo=="水暖"||zpdo=="电料"||zpdo=="石膏制品"||zpdo=="膏粉") {
					topLevel=Number.MAX_VALUE;
				}  
				*/
				//oldValue++;
				oldValue = calSpecialValue(matnr,oldValue,"jia");
				if(oldValue<=topLevel) {
					var price=$(this).parent().next("td").html().trim();
					if(price!=null&&price!="") {
						$(this).parent().next("td").next("td").html((oldValue*parseFloat(price)).toFixed(2));
					}
					$(this).parent().find(".J_num").val(oldValue);
					if(oldValue==originVal) {
						if(addMatnrs.indexOf(matnr+"")==-1) {
							$(this).parent().next("td").next("td").next("td").find("input[name='addOrUpdate']").val(0);
							$(this).parents("tr").removeClass("numChange");
							$.ajax({
								url:"/review/updateFucaiRedis",
								type:"post",
								data:{ternr:ternr,matnr:matnr,matnrNum:$(this).parent().find(".J_num").val(),noChange:"noChange",
									  token:token,loginUserName:loginUserName},
								async:false,
								cache:false
							});
						} else {
							$(this).parents("tr").addClass("numChange");
							$.ajax({
								url:"/review/updateFucaiRedis",
								type:"post",
								data:{ternr:ternr,matnr:matnr,matnrNum:$(this).parent().find(".J_num").val(),
									  token:token,loginUserName:loginUserName},
								async:false,
								cache:false
							});
						}
					} else {
						$(this).parents("tr").addClass("numChange");
						$.ajax({
							url:"/review/updateFucaiRedis",
							type:"post",
							data:{ternr:ternr,matnr:matnr,matnrNum:$(this).parent().find(".J_num").val(),
								  token:token,loginUserName:loginUserName},
							async:false,
							cache:false
						});
					}
				}
			});
			$(".Jian").click(function() {
				var oldValue=parseInt($(this).parent().find(".J_num").val());//点击增加后的数量 
				var originVal=parseInt($(this).data("oringinval"));//数据库中的原始数据
				var lowerLevel=0;//能减到的最小值
				var ternr=$("input[name=ternr]").val();
				var matnr=$(this).data("matnr");
				//oldValue--;
				oldValue = calSpecialValue(matnr,oldValue,"jian");
				if(oldValue>=lowerLevel) {
					var price=$(this).parent().next("td").html().trim();
					if(price!=null&&price!="") {
						$(this).parent().next("td").next("td").html((oldValue*parseFloat(price)).toFixed(2));
					}
					$(this).parent().find(".J_num").val(oldValue);
					if(oldValue==originVal) {
						if(addMatnrs.indexOf(matnr+"")==-1) {
							$(this).parents("tr").removeClass("numChange");
							$(this).parent().next("td").next("td").next("td").find("input[name='addOrUpdate']").val(0);
							$.ajax({
								url:"/review/updateFucaiRedis",
								type:"post",
								data:{ternr:ternr,matnr:matnr,matnrNum:$(this).parent().find(".J_num").val(),noChange:"noChange",
									  token:token,loginUserName:loginUserName},
								async:false,
								cache:false
							});
						} else {
							$(this).parents("tr").addClass("numChange");
							$.ajax({
								url:"/review/updateFucaiRedis",
								type:"post",
								data:{ternr:ternr,matnr:matnr,matnrNum:$(this).parent().find(".J_num").val(),
									  token:token,loginUserName:loginUserName},
								async:false,
								cache:false
							});
						}
					} else {
						$(this).parents("tr").addClass("numChange");
						$.ajax({
							url:"/review/updateFucaiRedis",
							type:"post",
							data:{ternr:ternr,matnr:matnr,matnrNum:$(this).parent().find(".J_num").val(),
								  token:token,loginUserName:loginUserName},
							async:false,
							cache:false
						});
					}
				}
			});
			//手动改变辅材数量
			$(".J_num").blur(function() {
				var originVal=parseInt($(this).data("originval"));//数据库中的原始数据
				var reg=/^\d+(\.\d+)?$/;
				var inputValue=$(this).val();//填写的数量 
				var zpdo=$(this).next(".Jia").data("zpdo");//部类
				var ternr=$("input[name=ternr]").val();
				var matnr=$(this).data("matnr");
				if(!reg.exec(inputValue)) {
					$(this).val(originVal);
				} else {
					//var topLevel=Math.ceil(originVal*1.5);//能增加到的最大值
					var topLevel=Number.MAX_VALUE;
					if(inputValue>topLevel) {
						layer.alert("可填写的最大数量为："+topLevel,{skin:'layui-layer-molv',closeBtn:0});
						$(this).val(originVal);
					} else if(inputValue<0) {
						layer.alert("可填写的最小数量为："+0,{skin:'layui-layer-molv',closeBtn:0});
						$(this).val(originVal);
					} else {
						//填写的数量与原始值不相等
						if(inputValue!=originVal) {
							var price=$(this).parent().next("td").html().trim();
							if(price!=null&&price!="") {
								$(this).parent().next("td").next("td").html((inputValue*parseFloat(price)).toFixed(2));
							}
							$(this).parents("tr").addClass("numChange");
							$.ajax({
								url:"/review/updateFucaiRedis",
								type:"post",
								data:{ternr:ternr,matnr:matnr,matnrNum:$(this).parent().find(".J_num").val(),
									  token:token,loginUserName:loginUserName},
								async:false,
								cache:false
							});
						} else {
							if(addMatnrs.indexOf(matnr+"")==-1) {
								var price=$(this).parent().next("td").html().trim();
								if(price!=null&&price!="") {
									$(this).parent().next("td").next("td").html((inputValue*parseFloat(price)).toFixed(2));
								}
								$(this).parents("tr").removeClass("numChange");
								$(this).parent().next("td").next("td").next("td").find("input[name='addOrUpdate']").val(0);
								$.ajax({
									url:"/review/updateFucaiRedis",
									type:"post",
									data:{ternr:ternr,matnr:matnr,matnrNum:$(this).parent().find(".J_num").val(),noChange:"noChange",
										  token:token,loginUserName:loginUserName},
									async:false,
									cache:false
								});
							} else {
								var price=$(this).parent().next("td").html().trim();
								if(price!=null&&price!="") {
									$(this).parent().next("td").next("td").html((inputValue*parseFloat(price)).toFixed(2));
								}
								$(this).parents("tr").addClass("numChange");
								$.ajax({
									url:"/review/updateFucaiRedis",
									type:"post",
									data:{ternr:ternr,matnr:matnr,matnrNum:$(this).parent().find(".J_num").val(),
										  token:token,loginUserName:loginUserName},
									async:false,
									cache:false
								});
							}
						}
					}
				}
			});
			$(".td_an").click(function() {
				var ternr=$("input:hidden[name=ternr]").val();
				var matnr=$(this).data("matnr");
				var vbeln=$("input:hidden[name=vbeln]").val();
				var areaCode=$("input[name='areaCode']").val();
				
				var url ="/review/deleteFucaiRedis?matnr="+matnr+"&areaCode="+areaCode;
				$("#saveForm").attr("action",url).submit();
			});
			$(".buttom_1").click(function() {
				var sendDate=$("input[name='sendDate']").val();
				if(sendDate==null||sendDate=="") {
					var alertLayer = layer.alert("请选择材料进场时间",{skin:'layui-layer-molv',closeBtn: 0});
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
					var areaCode=$("input[name='areaCode']").val();
					var nowDate=$("#nowDate").val().trim();
					var date=new Date(Date.parse(sendDate.replace(/-/g,"/")));
					var todayDate;
					if(nowDate!=null&&nowDate!="") {
						todayDate=new Date(Date.parse(nowDate.replace(/-/g,"/")));
					} else {
						todayDate=new Date();
					}
					if(areaCode=="101"||areaCode=="303"||areaCode=="304"||areaCode=="404") {
						var todayDateHour=todayDate.getHours();
						if(todayDateHour>=12) {
							todayDate.setDate(todayDate.getDate()+3);
						} else {
							todayDate.setDate(todayDate.getDate()+2);
						}
						var year=todayDate.getFullYear();
						var month=(todayDate.getMonth()+1)>=10?(todayDate.getMonth()+1):"0"+(todayDate.getMonth()+1);
						var day=todayDate.getDate()>=10?todayDate.getDate():"0"+todayDate.getDate();
						var targetDayStr=year+"-"+month+"-"+day;
						var targetDay=new Date(Date.parse(targetDayStr.replace(/-/g,"/")));
						if(date<targetDay) {
							layer.alert("选择的材料进场时间必须为："+targetDayStr+"（含）日之后的时间",{skin:'layui-layer-molv',closeBtn:0});
							return false;
						} else {
							$("#okbtn").attr("disabled","disabled");
							layer.msg('提交中，请稍候',{icon:16,time:5000,shade:0.1});
							$("#saveForm").attr("action","/review/save").submit();
						}
					} else {
						var year=todayDate.getFullYear();
						var month=(todayDate.getMonth()+1)>=10?(todayDate.getMonth()+1):"0"+(todayDate.getMonth()+1);
						var day=todayDate.getDate()>=10?todayDate.getDate():"0"+todayDate.getDate();
						var targetDayStr=year+"-"+month+"-"+day;
						var targetDay=new Date(Date.parse(targetDayStr.replace(/-/g,"/")));
						if(date<targetDay) {
							layer.alert("选择的材料进场时间必须为："+targetDayStr+"（含）日之后的时间",{skin:'layui-layer-molv',closeBtn:0});
							return false;
						} else {
							$("#okbtn").attr("disabled","disabled");
							layer.msg('提交中，请稍候',{icon:16,time:5000,shade:0.1});
							$("#saveForm").attr("action","/review/save").submit();
						}
					}
				}
			});
			$(".buttonclass").click(function(){
				//添加样式
				$(this).parent().addClass("content_navover");
				$(this).parent().siblings().removeClass("content_navover");
				
				var type=$(this).data("type");
				if(type=='all'){
					$("tr[id^='fucai']").show();
				}else if(type=="other"){
					var tagArray = [];
					$("a[id^='tag_']").each(function(){
						var id=$(this).attr("id");
						tagArray.push(id.substring(4,id.length));
					});
					var goodsTag = [];
					$("tr[id^='fucai']").each(function(){
						goodsTag.push($(this).data("tag"));
					});
					var showArray = [];
					var hideArray = [];
					for (var i = 0; i < goodsTag.length; i++) {
						var flag = false;
						for (var j = 0; j < tagArray.length; j++) {
							if(goodsTag[i]==tagArray[j]){
								flag = true;
								break;
							}
						}
						if(flag){
							hideArray.push(goodsTag[i]);
						}else{
							showArray.push(goodsTag[i]);
						}
					}
					for (var i = 0; i < showArray.length; i++) {
						$("tr[id^='fucai'][data-tag="+showArray[i]+"]").show()
					}
					for (var i = 0; i < hideArray.length; i++) {
						$("tr[id^='fucai'][data-tag="+hideArray[i]+"]").hide()
					}
					
				}else if(type=="common"){
					$("tr[id^='fucai'][data-common='1']").show();
					$("tr[id^='fucai'][data-common='0']").hide();
				}else{
					var list = $("tr[id^='fucai'][data-tag="+type+"]");
					if(list!=null&&list.length>0){
						$("tr[id^='fucai'][data-tag="+type+"]").show()
					}
					$("tr[id^='fucai'][data-tag!="+type+"]").hide();
				}
			});
		}); 
	</script>
    <script>
        $(function () {
            //隐藏NAV
            $(".nav").css("left","-16%");
            $(".nav").removeClass("animate");
            $(".content,.title").css("width","100%")
        })
    </script>
</body>

</html>
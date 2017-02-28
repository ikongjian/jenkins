<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>辅材数量复核</title>
<style type="text/css">
	.veiw_table tr.numChange td {background:#fff7ec;}
</style>
</head>
<body>
	<!--3级页面框架-->
	<div class="right frame">
	 	 <!--头部-->
	 	 <header>
	     	<h6>辅材数量复核</h6>
	     	<a href="/review/toReviewListPage"><img src="/assets-new/img/esc.png"></a>
	     </header>
		 <div class="content">
			<!--辅材数量复核-->
			<form action="" method="post" id="saveForm">
				<div class="time_cx">
					第一次材料进场时间：<input class="input_date" type="date" name="sendDate" value="${sendDate}"/>
					备注：<input class="input" type="text" name="remark" value="${remark}"/>
					<input class="sok" name="confirmS" type="button" value="确定">
				</div>
				<input type="hidden" name="ternr" value="${ternr}">
				<input type="hidden" name="vbeln" value="${vbeln}">
				<input type="hidden" name="sdabw" value="${sdabw}">
				<input type="hidden" name="areaCode" value="${areaCode}">
				<input type="hidden" name="projectManagerName" value="${projectManagerName}">
				<input type="hidden" name="telephone" value="${telephone}">
				<table class="table_1 table_2 veiw_table" width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr class="quote_tr">
						<th scope="col" width="4%">序号</th>
						<th scope="col" width="11.5%">部类</th>
						<th scope="col" width="24%">名称</th>
						<th scope="col" width="9%">SKU</th>
						<th scope="col" width="6%">单位</th>
						<th scope="col" width="14%">实际数量</th>
						<th scope="col" width="11%">单价</th>
						<th scope="col" width="11%">总价</th>
					</tr>
					<c:forEach items="${erpBjlikp.bjlipss}" var="item" varStatus="status">
						<input type="hidden" name="bdart" value="${item.bdart}"/>
						<tr data-sku="${item.matnr}">
							<td>${status.index+1}</td>
							<td>${item.zpdo}</td>
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
							<td>
								<c:if test="${item.isCheckNum==0||empty item.isCheckNum}">
									<i class="jian" data-matnr="${item.matnr}" data-oringinval="${item.kmpmg}" data-zpdo="${item.zpdo}">-</i>
									<!-- 数据去掉小数，不四舍五入 -->
									<input name="jiajianshus"  class="jiajianshu" type="text" data-matnr="${item.matnr}"
										<c:if test="${item.kmpmg==null||item.kmpmg==''}">
											<c:choose>
												<c:when test="${fn:contains(item.lfimg,'.')}">
													value="<fmt:formatNumber value="${fn:substringBefore(item.lfimg,'.')}" pattern='##'/>" data-originval="${item.lfimg}"
												</c:when>
												<c:otherwise>
													value="${item.lfimg}" data-originval="${item.lfimg}"
												</c:otherwise>
											</c:choose>
										</c:if>
										<c:if test="${item.kmpmg!=null&&item.kmpmg!=''}">
											<c:choose>
												<c:when test="${fn:contains(item.kmpmg,'.')}">
													value="<fmt:formatNumber value="${fn:substringBefore(item.kmpmg,'.')}" pattern='##'/>" data-originval="${item.kmpmg}"
												</c:when>
												<c:otherwise>
													value="${item.kmpmg}" data-originval="${item.kmpmg}"
												</c:otherwise>
											</c:choose>
										</c:if>>
									<i class="jia" data-matnr="${item.matnr}" data-oringinval="${item.kmpmg}" data-zpdo="${item.zpdo}">+</i>
								</c:if>
								<c:if test="${item.isCheckNum==1}">
									<input name="jiajianshus"  class="jiajianshu check_num_no_change" type="text" data-matnr="${item.matnr}" readonly="readonly"
										<c:if test="${item.kmpmg==null||item.kmpmg==''}">
											<c:choose>
												<c:when test="${fn:contains(item.lfimg,'.')}">
													value="<fmt:formatNumber value="${fn:substringBefore(item.lfimg,'.')}" pattern='##'/>" data-originval="${item.lfimg}"
												</c:when>
												<c:otherwise>
													value="${item.lfimg}" data-originval="${item.lfimg}"
												</c:otherwise>
											</c:choose>
										</c:if>
										<c:if test="${item.kmpmg!=null&&item.kmpmg!=''}">
											<c:choose>
												<c:when test="${fn:contains(item.kmpmg,'.')}">
													value="<fmt:formatNumber value="${fn:substringBefore(item.kmpmg,'.')}" pattern='##'/>" data-originval="${item.kmpmg}"
												</c:when>
												<c:otherwise>
													value="${item.kmpmg}" data-originval="${item.kmpmg}"
												</c:otherwise>
											</c:choose>
										</c:if>>
								</c:if>
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
								
								<c:if test="${item.state!='o'}">
									<input type="hidden" name="addOrUpdate" value="1"/>
								</c:if>
								<c:if test="${item.state=='o'}">
									<input type="hidden" name="addOrUpdate" value="0"/>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
				<input type=hidden id="matnrs" name="matnrsList">
				<input type="hidden" id="addAndUpdateMatnrs" name="addAndUpdateMatnrs"> 
				<input type="hidden" id="addMatnrs" name="addMatnrs">
				<input class="ok" name="confirmS" type="button" value="确定">
			</form>
			<input type="hidden" id="nowDate">
		</div>
	</div>
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
			$(".jia").click(function() {
				var oldValue=parseInt($(this).parent().find(".jiajianshu").val());//点击增加后的数量 
				var originVal=parseInt($(this).data("oringinval"));//数据库中的原始数据
				var topLevel=Number.MAX_VALUE;
				var ternr=$("input:hidden[name=ternr]").val();
				var matnr=$(this).data("matnr");
				var zpdo=$(this).data("zpdo");//部类
				oldValue++;
				if(oldValue<=topLevel) {
					var price=$(this).parent().next("td").html().trim();
					if(price!=null&&price!="") {
						$(this).parent().next("td").next("td").html((oldValue*parseFloat(price)).toFixed(2));
					}
					$(this).parent().find(".jiajianshu").val(oldValue);
					if(oldValue==originVal) {
						if(addMatnrs.indexOf(matnr+"")==-1) {
							$(this).parent().next("td").next("td").next("td").find("input[name='addOrUpdate']").val(0);
							$(this).parents("tr").removeClass("numChange");
							$.ajax({
								url:"/review/updateFucaiRedis",
								type:"post",
								data:{ternr:ternr,matnr:matnr,matnrNum:$(this).parent().find(".jiajianshu").val(),noChange:"noChange",
									  token:token,loginUserName:loginUserName},
								async:false,
								cache:false
							});
						} else {
							$(this).parents("tr").addClass("numChange");
							$.ajax({
								url:"/review/updateFucaiRedis",
								type:"post",
								data:{ternr:ternr,matnr:matnr,matnrNum:$(this).parent().find(".jiajianshu").val(),
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
							data:{ternr:ternr,matnr:matnr,matnrNum:$(this).parent().find(".jiajianshu").val(),
								  token:token,loginUserName:loginUserName},
							async:false,
							cache:false
						});
					}
				}
			});
			$(".jian").click(function() {
				var oldValue=parseInt($(this).parent().find(".jiajianshu").val());//点击增加后的数量 
				var originVal=parseInt($(this).data("oringinval"));//数据库中的原始数据
				var lowerLevel=0;//能减到的最小值
				var ternr=$("input:hidden[name=ternr]").val();
				var matnr=$(this).data("matnr");
				oldValue--;
				if(oldValue>=lowerLevel) {
					var price=$(this).parent().next("td").html().trim();
					if(price!=null&&price!="") {
						$(this).parent().next("td").next("td").html((oldValue*parseFloat(price)).toFixed(2));
					}
					$(this).parent().find(".jiajianshu").val(oldValue);
					if(oldValue==originVal) {
						if(addMatnrs.indexOf(matnr+"")==-1) {
							$(this).parents("tr").removeClass("numChange");
							$(this).parent().next("td").next("td").next("td").find("input[name='addOrUpdate']").val(0);
							$.ajax({
								url:"/review/updateFucaiRedis",
								type:"post",
								data:{ternr:ternr,matnr:matnr,matnrNum:$(this).parent().find(".jiajianshu").val(),noChange:"noChange",
									  token:token,loginUserName:loginUserName},
								async:false,
								cache:false
							});
						} else {
							$(this).parents("tr").addClass("numChange");
							$.ajax({
								url:"/review/updateFucaiRedis",
								type:"post",
								data:{ternr:ternr,matnr:matnr,matnrNum:$(this).parent().find(".jiajianshu").val(),
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
							data:{ternr:ternr,matnr:matnr,matnrNum:$(this).parent().find(".jiajianshu").val(),
								  token:token,loginUserName:loginUserName},
							async:false,
							cache:false
						});
					}
				}
			});
			//手动改变辅材数量
			$(".jiajianshu").blur(function() {
				var originVal=parseInt($(this).data("originval"));
				var reg=/^\d+(\.\d+)?$/; 
				var inputValue=$(this).val();//填写的数量 
				var zpdo=$(this).next(".jia").data("zpdo");//部类
				var ternr=$("input:hidden[name=ternr]").val();
				var matnr=$(this).data("matnr");
				if(!reg.exec(inputValue)) {
					$(this).val(originVal);
				} else {
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
								data:{ternr:ternr,matnr:matnr,matnrNum:$(this).parent().find(".jiajianshu").val(),
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
									data:{ternr:ternr,matnr:matnr,matnrNum:$(this).parent().find(".jiajianshu").val(),noChange:"noChange",
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
									data:{ternr:ternr,matnr:matnr,matnrNum:$(this).parent().find(".jiajianshu").val(),
										  token:token,loginUserName:loginUserName},
									async:false,
									cache:false
								});
							}
						}
					}
				}
			});
			$(".delete").click(function() {
				var ternr=$("input:hidden[name=ternr]").val();
				var matnr=$(this).data("matnr");
				var vbeln=$("input:hidden[name=vbeln]").val();
				var areaCode=$("input[name='areaCode']").val();
				var url ="/review/deleteFucaiRedis?matnr="+matnr+"&areaCode="+areaCode;
				$("#saveForm").attr("action",url).submit();
			});
			$("input[name='confirmS']").click(function() {
				var sendDate=$("input[name='sendDate']").val();
				if(sendDate==null||sendDate=="") {
					var alertLayer=layer.alert("请选择材料进场时间",{skin:'layui-layer-molv',closeBtn: 0});
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
					var todayDate;
					if(nowDate!=null&&nowDate!="") {
						todayDate=new Date(Date.parse(nowDate.replace(/-/g,"/")));
					} else {
						todayDate=new Date();
					}
					var todayDateHour=todayDate.getHours();
					if(todayDateHour>=12) {
						todayDate.setDate(todayDate.getDate()+2);
					} else {
						todayDate.setDate(todayDate.getDate()+1);
					}
					var year=todayDate.getFullYear();
					var month=(todayDate.getMonth()+1)>=10?(todayDate.getMonth()+1):"0"+(todayDate.getMonth()+1);
					var day=todayDate.getDate()>=10?todayDate.getDate():"0"+todayDate.getDate();
					var targetDayStr=year+"-"+month+"-"+day;
					var targetDay=new Date(Date.parse(targetDayStr.replace(/-/g,"/")));
					
					var date=new Date(Date.parse(sendDate.replace(/-/g,"/")));
					if(date<targetDay) {
						layer.alert("选择的材料进场时间必须为："+targetDayStr+"（含）日之后的时间",{skin:'layui-layer-molv',closeBtn:0});
						return false;
					} else {
						$("input[name='confirmS']").attr("disabled","disabled");
						layer.msg('提交中，请稍候',{icon:16,time:5000,shade:0.1});
						$("#saveForm").attr("action","/review/save").submit();
					}
				}
			});
		});
	</script>
	</body>
</html>
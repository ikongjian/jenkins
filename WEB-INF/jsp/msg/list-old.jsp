<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/pageTag" prefix="page"%>
<header>
	<h6>消息列表</h6>
</header>
<link rel="stylesheet" type="text/css" href="/assets-new/dropload/dropload.css">
<style>
.time_cx p {
    float: left;
    margin-bottom: 0.7rem;
    width: 42%;
}
.time_cx1 p.time_p50 {
    width: 42%;
}
</style>
<div class="content">
	<form action="/msg/listMore" method="post" id="pmMsgForm">
		<div class="time_cx time_cx1">
	     	<p><span>消息标题：</span><input type="text" name="title" value="${pmMsg.title}"/></p>
	         <p class="time_p50"><span>查询日期：</span><input type="date" name="start" value="${pmMsg.start}"/>至<input type="date" name="end" value="${pmMsg.end}"/></p>
	         <p class="time_p15"><input type="submit" value="查询"></p>
	     </div>
     </form>
	<table class="table_1" width="100%" border="0" cellspacing="0" cellpadding="0">
		<thead>
			<tr class="quote_tr">
				<th scope="col" width="10%">消息类型</th>
				<th scope="col" width="40%">消息标题</th>
				<th scope="col" width="16%">发布时间</th>
				<th scope="col" width="13%">发布人</th>
				<th scope="col" width="14%">阅读状态</th>
				<th scope="col" width="12%">操作</th>
			</tr>
		</thead>
		<input type="hidden" id="nowDate">
		<tbody class="innerBody">
			<c:forEach items="${list}" var="pmMsg">
				<tr>
					<td>
						<c:if test="${pmMsg.type==1}">重要通知</c:if>										
						<c:if test="${pmMsg.type==2}">紧急通知</c:if>										
						<c:if test="${pmMsg.type==3}">日常通知</c:if>	
						<c:if test="${pmMsg.type==4}">判责罚款</c:if>			
					</td>
					<td>${pmMsg.title}</td>
					<td>
						<fmt:formatDate value="${pmMsg.applyDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td>${pmMsg.createUser}</td>
					<td>
						<c:if test="${pmMsg.readState==1}">未查阅</c:if>
						<c:if test="${pmMsg.readState==2}">已查阅</c:if>
					</td>
					<td><a href="#" class="view_msg" data-id="${pmMsg.id}">查看</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script type="text/javascript">
	/* function getLocalTime(ns) { 
		var now=new Date(ns); 
		var year=now.getFullYear();
		var month=(now.getMonth()+1)>=10?(now.getMonth()+1):"0"+(now.getMonth()+1);
		var day=now.getDate()>=10?now.getDate():"0"+now.getDate();
		return year+"-"+month+"-"+day; 
	} */
	function GetDateDiff(startDate,endDate) {  
	    var startTime=new Date(Date.parse(startDate.replace(/-/g,"/"))).getTime();     
	    var endTime=new Date(Date.parse(endDate.replace(/-/g,"/"))).getTime();     
	    var dates=(endTime-startTime)/(1000*60*60*24);     
	    return  dates;    
	}
	$(function() {
		$("body").delegate(".view_msg","click",function() {
			var id=$(this).data("id");
			window.location.href="/msg/threePath/detail?id="+id;
		});
		$("#pmMsgForm").submit(function() {
			var title=$(":input[name='title']").val().trim();
			var start=$(":input[name='start']").val().trim();
			var end=$(":input[name='end']").val().trim();
			if(title!=null&&title!="") {
				return true;
			} else {
				if(start==null||start==''||end==null||end=='') {
					layer.alert("请选择查询开始与结束日期",{icon:5});
					return false;
				} else {
					var dayDiff=GetDateDiff(start,end);
					if(dayDiff<0) {
						layer.alert("请选择有效的查询开始与结束日期",{icon:5});
						return false;
					} else if(dayDiff>30) {
						layer.alert("仅能查询30天内的数据，请重新设置查询时间",{icon:5});
						return false;
					} else {
						return true;
					}
					/* else {
						$.ajax({
							url:"/msg/validDate",
							type:"post",
							dataType:"json",
							async:false,
							cache:false,
							success:function(result) {
								$("#nowDate").val(result.nowDate);
							}
						 });
						var nowDate=$("#nowDate").val().trim();
						var todayDate;
						if(nowDate!=null&&nowDate!="") {
							todayDate=new Date(Date.parse(nowDate.replace(/-/g,"/")));
						} else {
							todayDate=new Date();
						}
						var startDay=new Date(Date.parse(start.replace(/-/g,"/")));
						var endDay=new Date(Date.parse(end.replace(/-/g,"/")));
						var year=todayDate.getFullYear();
						var month=(todayDate.getMonth()+1)>=10?(todayDate.getMonth()+1):"0"+(todayDate.getMonth()+1);
						var day=todayDate.getDate()>=10?todayDate.getDate():"0"+todayDate.getDate();
						var targetDayStr=year+"-"+month+"-"+day;
						var targetDay=new Date(Date.parse(targetDayStr.replace(/-/g,"/")));
						targetDay.setDate(targetDay.getDate()-30);
						if(startDay<targetDay||endDay>todayDate) {
							layer.alert("仅能查询当前日期前30天内的数据，请重新设置查询时间！",{icon:5});
							return false;
						} else {
							return true;
						}
					} */
				}
			}
		});
		/* var counter=0,num=5,pageStart=0,pageEnd=0;
	    $('.table_1').dropload({
	        scrollArea:window,
	        loadDownFn:function(me) {
	        	counter++;
                pageEnd=num*counter;
                pageStart=pageEnd-num;
	            $.ajax({
	                type:'post',
	                url:'/msg/dropMsgs',
	                data:{start:(pageStart+1),end:pageEnd},
	                dataType:'json',
	                success:function(data) {
	                	if(data!=null&&data.length>0) {
	                		var result='';
		                    for(var i=0;i<num;i++) {
		                    	if(data[i]!=null) {
			                    	var type="",readState="";
		    						if(data[i].type==1) {
		    							type="重要通知";
		    						}
		    						if(data[i].type==2) {
		    							type="紧急通知";
		    						}
		    						if(data[i].type==3) {
		    							type="日常通知";
		    						}
		    						if(data[i].readState==1) {
		    							readState='未查阅';
		    						}
		    						if(data[i].readState==2) {
		    							readState='已查阅';
		    						}
			                        result+='<tr><td>'+type+'</td><td>'+data[i].title+'</td><td>'+getLocalTime(data[i].createDate)+'</td><td>'+data[i].createUser+'</td><td>'+
			                        readState+'</td><td><a href="#" class="view_msg" data-id="'+data[i].id+'">查看</a></td></tr>';
			                        if((i+1)>data.length) {
			                            me.lock();
			                            me.noData();
			                            break;
			                        }
		                    	} else {
		                    		me.lock();
		                            me.noData();
		                    		break;
		                    	}
		                    }
		                    setTimeout(function() {
		                        $('.innerBody').append(result);
		                        me.resetload();
		                    },1000);
	                	}
	                },
	                error:function(xhr,type) {
	                    me.resetload();
	                }
	            });
	        }
	    }); */
	});
</script>
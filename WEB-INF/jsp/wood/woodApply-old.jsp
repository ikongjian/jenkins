<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>木作申请</title>
<script type="text/javascript">
	var isCommit = true;
	function btnClick(){
		var confirmDateStr = $("input[name='confirmDate']").val();
		var confirmDate = new Date(confirmDateStr.replace(/-/g,"/"));
		var fwqDateStr = '${fwqDate}';
		var fwqDate = new Date(fwqDateStr.replace(/-/g,"/"));
		var afterDate = fwqDate.setDate(fwqDate.getDate()+3);
		var after = new Date(afterDate);
		if(confirmDate>=after){
			if(isCommit){
				isCommit = false;
				$.ajax({
			        cache: true,
			        type: "POST",
			        url:"/wood/apply",
			        data:$('#saveform').serialize(),
			        async: false,
			        error: function(request) {
			            alert("Connection error");
			        },
			        success: function(data) {
			           if(data.msg=='success'){
			        	 //弹出层
			       		layer.alert("申请成功！", {
			       		    skin: 'layui-layer-molv' //样式类名
			       		    ,closeBtn: 0
			       		},function(){
			       			window.location.href="/wood/woodList";
			       		});
			           }else{
			        	   layer.alert(data.msg, {
				       		    skin: 'layui-layer-molv' //样式类名
				       		    ,closeBtn: 0
				       		});
			           }

			        }
			    });
			}
		}else{
			var year=after.getFullYear();
			var month=(after.getMonth()+1)>=10?(after.getMonth()+1):"0"+(after.getMonth()+1);
			var day=after.getDate()>=10?after.getDate():"0"+after.getDate();
			var targetDayStr=year+"-"+month+"-"+day;
			layer.alert("请选择"+targetDayStr+"（含）日之后的时间！", {
       		    skin: 'layui-layer-molv' //样式类名
       		    ,closeBtn: 0
       		});

		}

	}
</script>
</head>

<body>
    <!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>木作申请</h6>
        	<a href="/wood/woodList"><img src="/assets-new/img/esc.png"></a>
        </header>
        <div class="content">
        	<form action="/wood/apply" name="saveform" id="saveform" method="post">
        	<input type="hidden" name="orderNo" value="${orderNo }">
        	<input type="hidden" name="installNo" value="${queryInstallDetail.installNo }">
        	<!--补货申请单-->
            <div class="time_cx">
            	<p><span>安装日期：</span>
            		<input class="input_date" type="date" name="confirmDate" value="<fmt:formatDate value="${queryInstallDetail.confirmInstallDate }" pattern="yyyy-MM-dd"/>"/></p>
            </div>
            <table class="table_1 table_2" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="quote_tr">
                	<th scope="col" width="5%">序号</th>
                    <th scope="col" width="55%%">安装项目</th>
                    <th scope="col" width="20%">预估数量</th>
                    <th scope="col" width="20%">单位</th>
				</tr>
				<c:forEach var="item" items="${queryInstallDetail.detail }" varStatus="status">
					<tr>
                	<td>${status.index+1 }</td>
                    <td>${item.maktx }</td>
                    <td>${item.num }</td>
                    <td>${item.unit }</td>
                </tr>
				</c:forEach>
			</table>
            <input class="ok" onclick="btnClick()" type="button" value="确定">
        </div>
        </form>
    </div>
</body>
</html>

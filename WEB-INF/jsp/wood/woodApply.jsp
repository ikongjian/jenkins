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
<title>木作申请</title>
    <style type="text/css">
        .projectForm input[type=button] {
            margin-bottom: 8rem;
            width: 100%;
            height: 5rem;
            background: #ed6c00;
            border-radius: .5rem;
            color: #fff;
            font-size: 2rem;
        }
    </style>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
<script type="text/javascript">
    $(function () {
        //隐藏返回按钮
        $(".nav").css("left","-16%");
        $(".nav").removeClass("animate");
        $(".content,.title").css("width","100%");
    });
	var isCommit=true;
	function btnClick() {
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
			       		layer.alert("申请成功！",{icon:6},function(){
			       			window.location.href="/wood/woodList";
			       		});
			           }else{
			        	   layer.alert(data.msg,{icon:0});
			           }
			           
			        }
			    });
			}
		}else{
			var year=after.getFullYear();
			var month=(after.getMonth()+1)>=10?(after.getMonth()+1):"0"+(after.getMonth()+1);
			var day=after.getDate()>=10?after.getDate():"0"+after.getDate();
			var targetDayStr=year+"-"+month+"-"+day;
			layer.alert("请选择"+targetDayStr+"（含）日之后的时间！",{icon:2});

		}
		
	}
</script>
</head>

<body>
    <div class="content">
        <div class="title">
            <h2>木作申请</h2>
            <a href="/wood/woodList?flag=wood"><img src="/assets-new/4th/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <div class="projectForm projectTableFrom">
            <form action="/wood/apply" name="saveform" id="saveform" method="post">
                <input type="hidden" name="orderNo" value="${orderNo}">
                <input type="hidden" name="askBillNo" value="${askBillNo}">
                <input type="hidden" name="installNo" value="${queryInstallDetail.installNo}">
                <div class="formGroup">
                    <label>安装日期</label>
                    <p class="iconForward">
                        <input class="taskInputdate" type="date" name="confirmDate" value="<fmt:formatDate value="${queryInstallDetail.confirmInstallDate }" pattern="yyyy-MM-dd"/>">
                    </p>
                </div>
            </form>
            <table class="table_list" border="0" cellspacing="0" cellpadding="0">
                <tr class="table_listTr">
                    <th scope="col" width="5%">序号</th>
                    <th scope="col" width="55%%">安装项目</th>
                    <th scope="col" width="20%">预估数量</th>
                    <th scope="col" width="20%">单位</th>
                </tr>
                <tbody>
                <c:forEach var="item" items="${queryInstallDetail.detail }" varStatus="status">
                    <tr>
                        <td>${status.index+1 }</td>
                        <td>${item.maktx }</td>
                        <td>${item.num }</td>
                        <td>${item.unit }</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="submitWrap"><input type="button" onclick="btnClick()" value="确定"></div>
        </div>
    </div>
</body>
</html>

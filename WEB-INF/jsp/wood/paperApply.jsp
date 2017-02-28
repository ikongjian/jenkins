<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="no-cache" http-equiv="pragma">
    <meta content="no-cache" http-equiv="cache-control">
    <meta content="0" http-equiv="expires">
    <title>壁纸安装申请</title>
    <%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <script type="text/javascript">
        $(function() {
            $("#paperForm").submit(function() {
                var checkDate=$(".input_date").val().trim();
                if(checkDate==null||checkDate=="") {
                    layer.alert("请选择期望安装日期！",{icon:2});
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
                    var date=new Date(Date.parse(checkDate.replace(/-/g,"/")));
                    var todayDate;
                    if(nowDate!=null&&nowDate!="") {
                        todayDate=new Date(Date.parse(nowDate.replace(/-/g,"/")));
                    } else {
                        todayDate=new Date();
                    }
                    todayDate.setDate(todayDate.getDate()+4);
                    var year=todayDate.getFullYear();
                    var month=(todayDate.getMonth()+1)>=10?(todayDate.getMonth()+1):"0"+(todayDate.getMonth()+1);
                    var day=todayDate.getDate()>=10?todayDate.getDate():"0"+todayDate.getDate();
                    var targetDayStr=year+"-"+month+"-"+day;
                    var targetDay=new Date(Date.parse(targetDayStr.replace(/-/g,"/")));
                    if(date<targetDay) {
                        layer.alert("选择的期望安装日期必须为："+targetDayStr+"（含）日之后的时间",{icon:2});
                        return false;
                    } else {
                        layer.msg("数据提交中，请稍候.",{icon:16});
                        $("#tijiao").attr("disabled",true);
                        return true;
                    }
                }
            });
        });
    </script>
</head>

<div class="content" style="width:100%;">
    <div class="title">
        <h2>壁纸安装申请</h2>
        <a href="/wood/woodList?flag=paper"><img src="/assets-new/img/esc.png"></a>
    </div>
    <hr class="content_hr">
    <form action="/wood/paperApply" method="post" id="paperForm">
        <input type="hidden" id="nowDate">
        <input type="hidden" name="orderNo" value="${orderNo}">
        <input type="hidden" name="ebeln" value="${ebeln}">
        <div class="projectForm projectTableFrom">
            <div class="formGroup" style="overflow:hidden;">
                <label>期望安装日期</label>
                <p class="iconForward" style="width:40%;float:left;">
                    <input class="taskInputdate input_date" type="date" name="installDate">
                </p>
                <p>
                    <label style="float:left; padding:0 2rem 0 6rem;">周六日是否可施工</label>
                    <input id="yes" type="radio" name="workType" value="2" checked="checked"><label class="radio radio_hover" for="yes" style="min-width:5rem;">是</label>
                    <input id="no" type="radio" name="workType" value="1"><label class="radio" for="no" style="min-width:5rem;">否</label>
                </p>
            </div>
            <table class="table_list" border="0" cellspacing="0" cellpadding="0">
                <tr class="table_listTr">
                    <th scope="col" width="8%">序号</th>
                    <th scope="col" width="20%">商品名称</th>
                    <th scope="col" width="20">规格/型号/颜色</th>
                    <th scope="col" width="10%">单位</th>
                    <th scope="col" width="25%">备注</th>
                </tr>
                <c:forEach items="${result.erpEkpos}" var="erpEkpo" varStatus="ekkoState">
                    <tr>
                        <td>${ekkoState.index+1}</td>
                        <td>${erpEkpo.txz01}</td>
                        <td>${erpEkpo.mfrpn}</td>
                        <td>${erpEkpo.meins}</td>
                        <td>${erpEkpo.exlin}</td>
                    </tr>
                </c:forEach>
            </table>
            <div class="submitWrap"><input id="tijiao" type="submit" value="确定"></div>
        </div>
    </form>
</div>

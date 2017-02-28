<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="no-cache" http-equiv="pragma">
    <meta content="no-cache" http-equiv="cache-control">
    <meta content="0" http-equiv="expires">
    <meta name="format-detection" content="telephone=no"/>
    <link rel="stylesheet" type="text/css" href="/assets-new/wx/css/css.css">
    <script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/assets-new/layer-v2.0/layer/layer.js"></script>
    <title>未完工任务</title>
</head>

<body>
<!--未完工任务-->
<div class="grab not_task">
    <div class="grab_head">
        <div class="grab_icon"><img src="/assets-new/wx/img/icon.png"></div>
        <div class="grab_name">${memberInfo.name}<br><span>${memberInfo.category}</span></div>
        <input type="hidden" id="wNo" value="${memberInfo.code}">
    </div>
    <!--未完工任务-->
    <div class="grab_task">
        <c:forEach var="item" items="${paList }">
            <!--任务-->
            <div class="grab_task1">
                <h2>
                    任务：${item.pkgName}
                    <c:if test="${item.consType==2}">
                        <span style="background:url(/assets-new/pkgapp/img/task1.png) no-repeat center center/100%;font-weight: normal; padding:0 0.7692rem;">返补</span>
                    </c:if>
                    <a href="/wx/taskInfo?packageId=${item.id }">查看详情></a>
                </h2>

                <div class="grab_task_text">
                    <c:if test="${item.dispatType==1}">
                        <p><span>价钱：</span><b>${item.pkgMoney}元</b></p>
                    </c:if>

                    <p><span>工期：</span><b><fmt:formatDate value="${item.startDate}" pattern="yyyy-MM-dd"/>至<fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd"/></b></p>

                    <p><span>地点：</span><b>${item.fullName}-${item.community}-${item.building}-${item.unit}-${item.room}-${item.userName}</b></p>

                    <p><span>项目经理：</span><b class="b_name">${item.projectManageName}</b><a href="tel:${item.projectManageTelephone}">联系TA</a></p>
                </div>

                <c:set value="0" var="isflag"/> <!-- 判断是否是组长登录 0:组员  1:组长 -->
                <c:set value="0" var="mapisflag"/> <!-- 判断是否签到 0:未签到  1:已签到-->

                <c:forEach items="${mapLeader}" var="mapLeader">
                    <c:forEach var="map" items="${map}">
                        <c:if test="${map.key==item.id and map.value==true}">
                            <c:set value="1" var="mapisflag"/>
                        </c:if>
                    </c:forEach>
                    <c:if test="${mapLeader.key==item.id and mapLeader.value==true}">
                        <c:set value="1" var="isflag"/>
                    </c:if>
                </c:forEach>
                    <%--普通工人组--%>
                <c:if test="${item.dispatType==1}">
                    <%--组长登录--%>
                    <c:if test="${isflag==1}">
                        <%--未签到--%>
                        <c:if test="${mapisflag==0}">
                            <a class="nosign_button sign_ok" href="javascript:void(0);" data-pid="${item.id}">开工签到</a>
                            <a class="signed_button" href="javascript:void(0);">申请返补</a>
                        </c:if>
                        <%--已签到--%>
                        <c:if test="${mapisflag==1}">
                            <a class="nosign_button" href="/wx/workerNewUI?pkgId=${item.id}&orderNo=${item.orderNo}">项目播报</a>
                            <c:choose>
                                <%--木作安装、地板安装 类型的任务包可用申请返补，返补包只能申请一次--%>
                                <c:when test="${item.rclPkgCount==0&&(item.pkgType==105||item.pkgType==110)}">
                                    <a class="nosign_button" href="/wx/taskRecallUI?pkgId=${item.id}">申请返补</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="signed_button" href="javascript:void(0);">申请返补</a>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        <a class="nosign_button complete_ok" href="javascript:void(0);" data-ptype="${item.pkgType}" style="width:92%;"
                           data-pid="${item.id}" data-ono="${item.orderNo}">申请完工</a>
                    </c:if>
                    <%--组员登录--%>
                    <c:if test="${isflag!=1}">
                        <a class="nosign_button" href="/wx/workerNewUI?pkgId=${item.id}&orderNo=${item.orderNo}">项目播报</a>
                    </c:if>
                </c:if>
                    <%--外协工人组--%>
                <c:if test="${item.dispatType==2}">
                    <%--组长登录--%>
                    <c:if test="${isflag==1}">
                        <%--未签到--%>
                        <c:if test="${mapisflag==0}">
                            <a class="nosign_button sign_ok" href="javascript:void(0);" data-pid="${item.id}">开工签到</a>
                        </c:if>
                        <%--已签到--%>
                        <c:if test="${mapisflag==1}">
                            <a class="nosign_button" href="/wx/workerNewUI?pkgId=${item.id}&orderNo=${item.orderNo}">项目播报</a>
                        </c:if>
                        <a class="nosign_button complete_ok" href="javascript:void(0);" data-ptype="${item.pkgType}" data-pid="${item.id}" data-ono="${item.orderNo}">申请完工</a>
                    </c:if>
                    <%--组员登录--%>
                    <c:if test="${isflag!=1}">
                        <a class="nosign_button" href="/wx/workerNewUI?pkgId=${item.id}&orderNo=${item.orderNo}">项目播报</a>
                    </c:if>
                </c:if>
            </div>
        </c:forEach>
    </div>
</div>
<script type="text/javascript">
    $(function() {
        //未到开工日期，不允许点【签到】
        $(".sign_ok").click(function() {
            var pId=$(this).data("pid");
            $.ajax({
                url:"/wx/getPkgStartDate",
                data:{pId:pId},
                type:"post",
                dataType:"json",
                async:false,
                cache:false,
                success:function(result) {
                    var nowDate=result.cDate;
                    var todayDate=new Date();
                    if(nowDate!=null&&nowDate!="") {
                        todayDate=new Date(Date.parse(nowDate.replace(/-/g,"/")));
                    }
                    var startDate=new Date(Date.parse((result.date).replace(/-/g,"/")));
                    var year=todayDate.getFullYear();
                    var month=(todayDate.getMonth()+1)>=10?(todayDate.getMonth()+1):"0"+(todayDate.getMonth()+1);
                    var day=todayDate.getDate()>=10?todayDate.getDate():"0"+todayDate.getDate();
                    var targetDayStr=year+"-"+month+"-"+day;
                    var targetDay=new Date(Date.parse(targetDayStr.replace(/-/g,"/")));
                    if(targetDay<startDate) {
                        layer.msg("请待此包到达开工日期后再进行签到",{icon:6,time:3000});
                    } else {
                        window.location.href="/wx/signView/"+pId;
                    }
                }
            });
        });
        //未点【签到】，不允许点【申请完工】
        $(".complete_ok").click(function() {
            var pId=$(this).data("pid");
            var orderNo=$(this).data("ono");
            var pkgType=$(this).data("ptype");
            var wNo=$("#wNo").val();
            $.ajax({
                url:"/wx/getPkgIsSign",
                data:{pId:pId,wNo:wNo},
                type:"post",
                dataType:"json",
                async:false,
                cache:false,
                success:function(result) {
                    if(result) {
                        if(pkgType!=null&&pkgType!="") {
                            <%--木作安装、地板安装 类型的任务包 上传图片--%>
                            if(pkgType=="105"||pkgType=="110") {
                                window.location.href="/wx/applyCompleteUI?pkgId="+pId;
                            } else {
                                window.location.href="/wx/toApplyComplete?packageId="+pId+"&orderNo="+orderNo;
                            }
                        }
                    } else {
                        layer.msg("请签到后再申请完工",{icon:6,time:3000});
                    }
                }
            });
        });
    });
</script>
</body>
</html>

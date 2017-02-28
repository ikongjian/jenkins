<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="no-cache" http-equiv="pragma">
    <meta content="no-cache" http-equiv="cache-control">
    <meta content="0" http-equiv="expires">
    <title>复检申请-现场</title>
    <!-- Add mousewheel plugin (this is optional) -->
    <script type="text/javascript" src="/assets-new/fancyBox/lib/jquery.mousewheel.pack.js?v=3.1.3"></script>
    <!-- Add fancyBox main JS and CSS files -->
    <script type="text/javascript" src="/assets-new/fancyBox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
    <link rel="stylesheet" type="text/css" href="/assets-new/fancyBox/source/jquery.fancybox.css?v=2.1.5" media="screen" />
    <!-- Add Button helper (this is optional) -->
    <link rel="stylesheet" type="text/css" href="/assets-new/fancyBox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
    <script type="text/javascript" src="/assets-new/fancyBox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
    <!-- Add Thumbnail helper (this is optional) -->
    <link rel="stylesheet" type="text/css" href="/assets-new/fancyBox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
    <script type="text/javascript" src="/assets-new/fancyBox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
    <!-- Add Media helper (this is optional) -->
    <script type="text/javascript" src="/assets-new/fancyBox/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
    <script type="text/javascript" src="/assets-new/fancyBox/check_detail.js"></script>
    <style type="text/css">
        .fancybox-custom .fancybox-skin {
            box-shadow: 0 0 50px #222;
        }
    </style>
    <script type="text/javascript">
        $(function() {
            $(".goods_zk").click(function(e) {
                $(this).parent().parent().parent().find(".table_goods").toggle();
                $(this).parent().find("a").toggle()
            });
            $("#xcUpdateForm").submit(function() {
                var checkDate=$(".input_date").val().trim();
                if(checkDate==null||checkDate=="") {
                    layer.alert("请选择期望检查日期！",{icon:2});
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
                    todayDate.setDate(todayDate.getDate()+2);
                    var year=todayDate.getFullYear();
                    var month=(todayDate.getMonth()+1)>=10?(todayDate.getMonth()+1):"0"+(todayDate.getMonth()+1);
                    var day=todayDate.getDate()>=10?todayDate.getDate():"0"+todayDate.getDate();
                    var targetDayStr=year+"-"+month+"-"+day;
                    var targetDay=new Date(Date.parse(targetDayStr.replace(/-/g,"/")));
                    if(date<targetDay) {
                        layer.alert("选择的期望检查日期必须为："+targetDayStr+"（含）日之后的时间",{skin:'layui-layer-molv',closeBtn:0});
                        return false;
                    } else {
                        return true;
                    }
                }
            });
        });
    </script>
</head>

<!--3级页面框架-->
<div class="right frame">
    <!--头部-->
    <header>
        <h6>复检申请-现场</h6>
        <a href="javascript:void(0);" onclick="window.history.go(-1);"><img src="/assets-new/img/esc.png"></a>
    </header>
    <form action="/fujian/check/xcUpdate" method="post" id="xcUpdateForm">
        <input type="hidden" name="checkId" value="${checkId}">
        <input type="hidden" name="orginCheckId" value="${orginCheckId}">
        <input type="hidden" name="orderNo" value="${orderNo}">
        <input type="hidden" id="nowDate">
        <div class="content">
            <!--复检申请详情-->
            <div class="time_cx recheck">
                <span>期望检查日期：</span>
                <input class="input_date" type="date" name="checkDate">
                <c:if test="${!empty imgs}">
                    <a class="lookPic fancybox-buttons" data-fancybox-group="button" href="${domain}${imgs[0].imgUrl}">查看照片</a>
                    <c:forEach items="${imgs}" var="img" varStatus="status">
                        <c:if test="${status.index>0}">
                            <a class="lookPic fancybox-buttons" data-fancybox-group="button" href="${domain}${img.imgUrl}" style="display:none;"></a>
                        </c:if>
                    </c:forEach>
                </c:if>
            </div>
            <!--复检申请详情内容-->
            <div class="zcheck_text">
                <ul>
                    <c:forEach items="${details}" var="item" varStatus="status">
                        <li>
                            <div class="zchenck_px">
                                <p class="zchenck_p1">${status.index+1}</p>
                                <p class="zchenck_p2">${item.checkName}</p>
                                <p class="zchenck_p3">不合格</p>
                                <p class="zchenck_p4">
                                    <a class="goods_zk goods_zk1">详细</a>
                                    <a class="goods_zk goods_zk2">收起</a>
                                </p>
                            </div>
                            <div class="zchenck_nr table_goods">
                                <p><span>违规形式：</span>${item.checkDescription}</p>
                                <p>
                                    <span>处理方式：</span>
                                    <c:if test="${item.disposeWarning==1}">警告&nbsp;&nbsp;</c:if>
                                    <c:if test="${item.disposeRectificationNow==1}">现场整改&nbsp;&nbsp;</c:if>
                                    <c:if test="${item.disposeRectificationDelay==1}">限期整改：
                                    <fmt:formatDate value="${item.limitTime}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;
                                    <c:if test="${item.checkType==1}">线上复检</c:if>
                                    <c:if test="${item.checkType==2}">现场复检</c:if>&nbsp;&nbsp;</c:if>
                                    <c:if test="${item.disposeFine==1}">罚款：${item.disposeMoney}元</c:if>
                                </p>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <input type="submit" class="ok" value="确定"/>
    </form>
</div>

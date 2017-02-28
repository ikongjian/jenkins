<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<title>消息详情-个人中心</title>


<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>

    <!--右侧内容框架-->
    <div class="content">
        <!--消息详情-->
        <div class="title">
            <h2>消息详情</h2>
            <a href="/msg/list"><img src="/assets-new/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <div class="formDetail">
            <h4>消息详情</h4>
            <ul>
                <li>
                    <span>消息类型</span>
                    <p>
	                    <c:if test="${pmMsg.type==1}">重要通知</c:if>										
						<c:if test="${pmMsg.type==2}">紧急通知</c:if>										
						<c:if test="${pmMsg.type==3}">日常通知</c:if>	
						<c:if test="${pmMsg.type==4}">判责罚款</c:if>	
                    </p>
                </li>
                <li>
                    <span>消息标题</span>
                    <p>${pmMsg.title}</p>
                </li>
                <li>
                    <span>发布时间</span>
                    <p><fmt:formatDate value="${pmMsg.applyDate}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                </li>
                <li>
                    <span>发布人</span>
                    <p>${pmMsg.createUser}</p>
                </li>
                <li>
                    <span>消息内容</span>
                    <p>${pmMsg.content} </p>
                </li>
            </ul>
        </div>
    </div>

<%-- <header>
	<h6>消息详情</h6>
	<a href="/msg/list"><img src="/assets-new/img/esc.png"></a>
</header>
<div class="content">
	<!--消息详情-->
	<div class="order">
		<h2 class="title_h2">消息详情</h2>
		<ul class="order_ul_li100">
			<li>
				<span>消息类型：</span> 
				<b>
					<c:if test="${pmMsg.type==1}">重要通知</c:if>										
					<c:if test="${pmMsg.type==2}">紧急通知</c:if>										
					<c:if test="${pmMsg.type==3}">日常通知</c:if>	
					<c:if test="${pmMsg.type==4}">判责罚款</c:if>	
				</b>
			</li>
			<li><span>消息标题：</span> <b>${pmMsg.title}</b></li>
			<li><span>发布时间：</span> <b><fmt:formatDate value="${pmMsg.applyDate}" pattern="yyyy-MM-dd HH:mm:ss"/></b></li>
			<li><span>发 布 人：</span> <b>${pmMsg.createUser}</b></li>
			<li><span>消息内容：</span> <b style="width:100%;">${pmMsg.content}</b></li>
		</ul>
	</div>
</div>
<style>
.order li img{width:100%;}
</style> --%>
<script type="text/javascript">

$(function () {
    //隐藏返回按钮
    $(".nav").css("left","-16%");
    $(".nav").removeClass("animate");
    $(".content,.title").css("width","100%");
});

	$(".order_ul_li100 img").click(function() {
           layer.open({
               type:1,
               area:["905px","580px"],
               shade:0.3,
               title:false,
               shadeClose:false,
               scrollbar:false,
               content:"<img src='"+$(this).attr("src")+"?arg="+new Date().valueOf()+"'>"
           });
       });
	
	$(".formDetail img").click(function() {
		var imgSrc = $(this).attr("src");
        layer.open({
            type:1,
            area:["905px","580px"],
            shade:0.3,
            title:false,
            shadeClose:false,
            scrollbar:false,
            content:"<img src='"+$(this).attr("src")+"?arg="+new Date().valueOf()+"'>"
        });
    });
</script>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"> 
        <title><decorator:title/></title>
        <meta name="description" content="爱空间-互联网家装，20天工期，699元/平，100%自有产业工人，8大主材品牌，环保辅材，包设计，包施工，包主材，18项精包服务，零增项，五不限，人性化设计"> 
		<meta name="keywords" content="爱空间，互联网家装，精装，零增项，五不限，人性化设计，包设计，包施工，包主材，科勒，大自然，马可波罗，博洛尼，西门子，多乐士，友邦吊顶，东方雨虹"> 
		<link rel="stylesheet" type="text/css" href="/assets-new/css/css.css">
        <script type="text/javascript" src="/assets-new/js/jquery-1.8.3.min.js"></script>
        <script type="text/javascript" src="/assets-new/js/jquery.cookie.js"></script>
        <script type="text/javascript" src="/assets-new/js/jquery.form.js"></script>
		<script type="text/javascript" src="/assets-new/js/app.js"></script>
		<script type="text/javascript" src="/assets-new/js/jiajian.js"></script>
		<script type="text/javascript" src="/assets-new/layer-v2.0/layer/layer.js"></script>
		<script type="text/javascript">
		/** 浏览器 **/
		function winBack(){
			window.history.back();
		}
		function winForward(){
			window.history.forward();
		}
		
		/** 熊师傅 pad app **/
		function winAppGoBack(){
			window.userinfo.goback();
		}
		function winAppGoForward(){
			window.userinfo.goforward();
		}
		</script>
		<decorator:head/>
    </head>

<body>
    <decorator:body/>
</body>
</html>

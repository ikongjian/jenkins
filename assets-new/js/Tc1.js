//弹出层
//title  = 标题
//text   = 内容
var tc = 
{
	//标题 + 内容 + 一个按钮的弹窗
	one:function(title,text,off){
		//添加弹窗
		$("body").append(
		"<div class='poptc'><div class='poptcnr'><h6>"+title+"</h6><p>"+text+"</p><a class='popan poptc_gb' href='javascript:void(0)'>确定</a><a href=javascript:void(0); class='poptc_an poptc_qx'><img src=img/esc_tc.png></a></div></div>"
		)
		//关闭弹窗
		gb(off)
		//CSS
		css()
	},
	//标题 + 内容 + 两个按钮的弹窗
	two:function(title,text,off){
		$("body").append(
		"<div class='poptc'><div class='poptcnr'><h6>"+title+"</h6><p>"+text+"</p><span><a class='popan1 popan2 poptc_qx' href='javascript:void(0)'>取消</a><a class='popan1 poptc_gb' href='javascript:void(0)'>确定</a></span><a href=javascript:void(0); class='poptc_an poptc_qx'><img src=img/esc_tc.png></a></div></div>"
		)
		//关闭弹窗
		gb(off)
		//CSS
		css()
	},
}

//关掉弹窗
function gb(off){
	$(".poptc_gb").click(function(e) {
		$(".poptc").remove()
		if(off){
			eval(off+"();");
			}
	})
	$(".poptc_qx").click(function(e) {
		$(".poptc").remove()
	})
}
//CSS
function css(){
	$(".area_tc li").css({
		"margin":"0px",
		"padding":"0px",
		"list-style-type":"none"
	})
	$(".poptc").css({
		"position":"fixed",
		"top":"0",
		"left":"0",
		"z-index":"1000",
		"background":"rgba(0,0,0,.4)",
		"width":"100%",
		"height":"100%"
	})
	$(".poptcnr").css({
		"background":"#f5f4f2 none repeat scroll 0 0",
		"border-radius":"15px",
		"box-shadow":"0 0 10px #b2b2b2",
		"margin":"0 auto",
		"padding":"50px 10px 40px",
		"position":"relative",
		"text-align":"center",
		"top":"20%",
		"width":"40%"	
	})
	$(".poptcnr h6").css({
		"color":"#ffac44",
		"font-size":"20px",
		"font-weight":"normal",
		"margin":"0 0 10px 0"
	})
	$(".poptcnr p").css({
		"color":"#434343",
		"font-size":"16px",
		"line-height":"24px",
		"margin-bottom":"10px"	
	})
	$(".poptcnr a.popan").css({
		"background":"#ffac44",
		"border-radius":"15px",
		"color":"#fff",
		"display":"block",
		"font-size":"16px",
		"height":"40px",
		"line-height":"40px",
		"line-height":"40px",
		"margin":"0 auto",
		"width":"50%"	
	})
	$(".poptcnr a.poptc_an").css({
		"position":"absolute",
		"right":"5%",
		"top":"0px"
	})
	$(".poptcnr span").css({
		"display":"block",
		"width":"100%",
		"height":"58px",
		"color":"#fff",	
	})
	$(".poptcnr a.popan1").css({
		"display":"block",
		"width":"40%",
		"height":"40px",
		"line-height":"40px",
		"text-align":"center",
		"float":"left",
		"background":"#ffac44",
		"border-radius":"10px",
		"font-size":"16px",
		"color":"#fff",
	})
	$(".poptcnr a.popan2").css({
		"background":"#818181",
        "margin":"0 5% 0 7.5%"
			
	})
}

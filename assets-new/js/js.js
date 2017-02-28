function setCookie(c_name,value) {
	var exdate=new Date();
	exdate.setDate(exdate.getDate()+1);
	document.cookie= c_name + "="+value+";expires="+exdate.toGMTString()+';path=/;';
}
//读取cookies
function getCookie(name) {
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg)) {
    	return unescape(arr[2]);
    } else {
    	return null;
    }
}
//删除cookies
function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime()-1);
    var cval=getCookie(name);
    if(cval!=null) {
    	document.cookie=name+"="+null+";expires="+exp.toGMTString()+';path=/;';
    }
}
$(function() {
	//导航展开/收缩
	$(".nav p").on("click",function() {
        if($(this).parent().find("ul").css("display") == "none"){
            $(".nav ul").hide()
            $(".nav p").removeClass("p_hover");
            $(this).parent("div").find("ul").toggle() 
            $(this).addClass("p_hover"); 
        }else if($(this).parent().find("ul").css("display") == "block"){
            $(".nav ul").hide()
            $(".nav p").removeClass("p_hover");
        }
    });
	//导航显示隐藏
    $(".title i").on("click", function() {
        if($(".nav").hasClass("animate")) {
            $(".nav").animate({
                left:"-16%",
            });
            $(".title").animate({
                width:"100%",
            });
            $(".content").animate({
                width:"100%",
            });
            $(".nav").removeClass("animate")
        } else {
            $(".nav").animate({
                left:"0%",
            });
            $(".title").animate({
                width:"84%",
            });
            $(".content").animate({
                width:"84%",
            });
            $(".nav").addClass("animate");
        }
    });
	//设置cookies
	$(".daohang ul li").click(function() {
    	var id=$(this).attr("id");
    	setCookie("menuid",id);
        return true;
	});
    var menuid=getCookie("menuid");
	if(menuid!=null) {
		$("#"+menuid).parents("div").find("p").addClass("p_hover");
    	$("#"+menuid).parent("ul").css("display","block");
    	$("#"+menuid).addClass("ba_ff4a00"); 
	}
    $(".shou_ye").click(function() {
    	var menuId=getCookie("menuid");
    	if(menuId!=null) {
    		delCookie("menuid"); 
    		$("#"+menuId).parents("div").find("p").removeClass("p_hover");
        	$("#"+menuId).parent("ul").css("display","none");
        	$("#"+menuId).removeClass("ba_ff4a00"); 
    	}
    });
});

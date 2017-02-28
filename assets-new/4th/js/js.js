//设置cookie
function setCookie(c_name,value) {
    var exdate=new Date();
    exdate.setDate(exdate.getDate()+1);
    document.cookie= c_name + "="+value+";expires="+exdate.toGMTString()+';path=/;';
}
//读取cookie
function getCookie(name) {
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg)) {
        return unescape(arr[2]);
    } else {
        return null;
    }
}
//删除cookie
function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime()-1);
    var cval=getCookie(name);
    if(cval!=null) {
        document.cookie=name+"="+null+";expires="+exp.toGMTString()+';path=/;';
    }
}
$(function() {
    $(".daohang ul li").click(function() {
        var id=$(this).attr("id");
        setCookie("menuid",id);
        return true;
    });
    var menuid=getCookie("menuid");
    if(menuid!=null) {
        $("#"+menuid).parents("div").find("p").addClass("p_hover");
        $("#"+menuid).parent("ul").css("display","block");
        $("#"+menuid).addClass("navli_hover");
    }
    $(".shou_ye").click(function() {
        var menuId=getCookie("menuid");
        if(menuId!=null) {
            delCookie("menuid");
            $("#"+menuId).parents("div").find("p").removeClass("p_hover");
            $("#"+menuId).parent("ul").css("display","none");
            $("#"+menuId).removeClass("navli_hover");
        }
    });
    //二级导航
    $(".nav p").on("click", function() {
        if ($(this).parent().find("ul").css("display") == "none") {
            $(".nav ul").hide();
            $(".nav p").removeClass("p_hover");
            $(this).parent("div").find("ul").toggle();
            $(this).addClass("p_hover");
        } else if ($(this).parent().find("ul").css("display") == "block") {
            $(".nav ul").hide();
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
            $(".nav").removeClass("animate");
        } else {
            $(".nav").animate({
                left:"0%",
            });
            $(".title").animate({
                width:"100%",
            });
            $(".content").animate({
                width:"84%",
            });
            $(".nav").addClass("animate");
        }
    });
    //单选
  /*  $(".radio").click(function(){
        $(".radio").removeClass("radio_hover");
        $(this).addClass("radio_hover");
    });*/
    
    //单选
    $(".radio").click(function(){
        $(this).siblings("label").removeClass("radio_hover")
        $(this).addClass("radio_hover")
    });
    
    //多选
    $(".checked").click(function(){
        if($(this).hasClass("checked_hover")){
           $(this).removeClass("checked_hover")
        }else{
           $(this).addClass("checked_hover") 
        }
    })
});
function calSpecialValue(matnr,value,type){
	if(matnr=="10003312"
		||matnr=="10003313"
		||matnr=="10003314"
		||matnr=="10003315"
		||matnr=="10003316"
		||matnr=="10003317"
		||matnr=="10003318"
		||matnr=="10003319"
		||matnr=="10003320"
		||matnr=="10003321"
		||matnr=="10003322"
		||matnr=="10003323"
		||matnr=="10003324"
		||matnr=="10003325"
		||matnr=="10003326"
		||matnr=="10003327"
		||matnr=="10003328"
		||matnr=="10003329"
		||matnr=="10003330"
		||matnr=="10003331"){
		if(type=='jia'){
			return value=value+50;
		}else if(type=='jian'){
			value=value-50;
			if(value<0){
				value=0;
			}
			return value;
		}else if(type=='blur'){
			var valueThis = $(value).val();
			var values = valueThis%50;
			if(values!=0){
				alert("请输入50的倍数");
				$(value).val("0");
			}
		}
	}else{
		if(type=='jia'){
			return ++value;
		}else if(type=='jian'){
			return --value;
		}else if(type=='blur'){
			return;
		}
	}
}

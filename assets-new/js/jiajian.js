// JavaScript Document
$(document).ready(function(){
	/*//获取浏览器高度赋值给DIV
	var gao = document.body.clientHeight
	$(".nav,.right,.app").css("height",gao)
	//加减数量使用
	$(".jia").click(function(){
		var oldValue=parseInt($(this).parent().find(".jiajianshu").val()); 
		oldValue++
		$(this).parent().find(".jiajianshu").val(oldValue)
	});
	$(".jian").click(function(){
		var oldValue=parseInt($(this).parent().find(".jiajianshu").val()); 
		oldValue--
		$(this).parent().find(".jiajianshu").val(oldValue)
	});*/
	//多选
	$(".xz1").click(function() {
        $(this).hide()
		$(this).parent().find(".xz2").show()
		$(this).parent().find(".xz").click()
    });
	$(".xz2").click(function() {
        $(this).hide()
		$(this).parent().find(".xz1").show()
		$(this).parent().find(".xz").click()
    });
	//多选联动
	$(".work_xzi").click(function(e) {
        $(this).parents("li").find(".work_xzp").click()
    });
	$(".work_xzp").toggle(function(e) {
		$(this).parent().find(".xz1").click()
    },function(){
  		$(this).parent().find(".xz2").click()
  	});
	//搜索
	$(document).keyup(function(){
		 if($(".soso").val() == ""){
		 $(".so_esc").hide()			 
			 }
		 else{
			 $(".so_esc").show()
			 }
		 })
	$(".so_esc").click(function(e) {
        $(".soso").val('')
		$(this).hide()
    });
	//拍照
	$(".photo_pai").click(function(e) {
        $(this).parent().find(".photo_input").click()
    });
	//申请竣工_弹出实例图
	$(".endg_sl").click(function(e) {
    	$(".endg_tc").show() 
    });
	$(".endg_tc a").click(function(e) {
        $(".endg_tc").hide()
    });
	//收货发货 —— 展开
	/*$(".goods_zk").click(function(e) {
    	$(this).parent().parent().find(".table_goods").toggle()
		$(this).parent().find("a").toggle()
    });*/
	//项目进度
	$(".percent_ul li .percent").eq(0).show()
	$(".percent_ul li").click(function(e) {
		$(".percent").hide()
        $(this).find(".percent").show()
    });
	//项目播报
	$(".fill_broadcast_z").show()
	$("#broadcast_zblabel").click()
	$("#broadcast_zblabel").addClass("label_hover")
	$("#broadcast_zblabel").click(function(e) {
		$(".fill_broadcast_w").hide()
		$("#broadcast_wblabel").removeClass("label_hover")
		$(".fill_broadcast_w p input,.fill_broadcast_w p textarea").val("")
		$(this).addClass("label_hover")
	    $(".fill_broadcast_z").show()
	});
	$("#broadcast_wblabel").click(function(e) {
		$(".fill_broadcast_z").hide()
		$("#broadcast_zblabel").removeClass("label_hover")
		$(".fill_broadcast_z p input,.fill_broadcast_z p textarea").val("")
	    $(this).addClass("label_hover")
		$(".fill_broadcast_w").show()
	});
	//待办任务
	$(".ned_tab p").click(function(){
	    var ned_tab = $(this).index()
	    $(".ned_tab p").removeClass("ned_p")
	    $(this).addClass("ned_p")
	    $(this).parent().parent().find("table").hide()
	    $(this).parent().parent().find("table").eq(ned_tab).show()
	})
	
});
// TAB_切换
function set(name,cursel,n){
	for(i=1;i<=n;i++){
	var menu=document.getElementById(name+i);
	var con=document.getElementById(name+"_"+i);
	menu.className=i==cursel?"z_hover":"";
	con.style.display=i==cursel?"block":"none";
	} 
}
function showList(id,num){
	if(num == 1){
		document.getElementById(id).style.display = "block";
	}
	else{
		document.getElementById(id).style.display = "none";
	}
} 
//质检报告详情
/*$(".goods_zk").click(function(e) {
	$(this).parent().parent().parent().find(".table_goods").toggle()
	$(this).parent().find("a").toggle()
});*/

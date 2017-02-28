// 求浏览器高度
$(document).ready(function() {
	var land = ($(window).height());
	$(".land").css("height", land)
	$(".details").css("height", land)
	$(".details_pj").css("height", land)
	//评价弹出按钮
	$(".details_pja").click(function(e) {
    	$(".details_pj").show()
	});
	//评价弹出按钮
	$(".live_no").click(function(e) {
    	$(".details_pj").hide()
	});
	//点击星星切换按钮
	$(".formItemDiff").click(function(e) {
        $(".live_ok").hide()
		$(".live_aok").show()
    });
})
// TAB切换
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
//评分

$(document).ready(function(e) {
	$(".formItemDiff").hover(function() {
	$(this).addClass("formItemDiff1")
	$(this).prevAll().addClass("formItemDiff1")
	$(this).nextAll().removeClass("formItemDiff1")
	$("#pointP").html($(this).prevAll().length+1+"分");
	});
});

// 测量工具首页 - 选择
$(document).ready(function() {
	//测量工具_首页
	//能否在规定时间开工
	$("#kg_no").click(function(e) {
		$("#home_ts").text("＊请告知客户：未按开工日期签约，开工日期将延期")
    });
	//是否有电梯
	$("#dt_no").click(function(e) {
		$("#home_ts").text("＊请告知客户：需收取上楼费,2-3层6元/平米,4-6层8元/平米")
    });
	//是否六环内
	$("#lh_no").click(function(e) {
		$("#home_ts").text("＊请告知客户：需收取远程费 50公里之内2.5% 50-100公里5%")
    });
	//厨房推拉门是否需要垭口
	$("#cf_yes").click(function(e) {
		$("#home_ts").text("＊请告知客户：个性化垭口需增加15天工期")
    });
	$("#kg_yes,#dt_yes,#lh_yes,#cf_no").click(function(e) {
		$("#home_ts").text("")
	})
	//测量详情页面
	//是弹出，否不弹出！
	$(".input_yes").click(function(e) {
        $(this).parents("li").find(".clgj_tx").show()
    });
    $(".input_no").click(function(e) {
        $(this).parents("li").find(".clgj_tx").hide()
    });
})
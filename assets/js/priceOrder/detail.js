//填充maralist
function fillMaraList(html){
	$("#maraList").empty();
	$("#maraList").append(html);
}
//清空maralist
function emptyMaraList(){
	$("#maraList").empty(); 
}

//弹出图纸列表框
function showDesignImgDiv(divId,title){
	$("#"+divId).dialog({
          title:    title, 
          'class':  "mydialog", 
          onClose: function() { $(this).dialog("close"); }
      });
}

$(window).scroll(function () {
    $('.ui-dialog').css('position', "fixed");
});

function addSelectedSku(){
	var type=$("#listType").val();
	var ok=selectAndAddSku(type);//查询并保存添加的sku到辅料列表中
	if(ok){
		$("#addDiv").hide();
	}
}

function addRows(divId,title,type){
	$("#listType").val(type);
	$("#"+divId).show();
}

//查询并保存添加的sku到辅料列表中
function selectAndAddSku(type){
	var matnrs="";//用来拼接列表中已经有的商品编码,用来排除
	var nums="";//用来拼接列表中已经有的商品编码,用来排除
	var matnrCheckObj=document.getElementsByName("matnrCheck");
	var skuNumObj=document.getElementsByName("skuNum");
	var allWrite=true;//标记数量是否填写完整
	for (var i = 0; i < matnrCheckObj.length; i++) {
		if(matnrCheckObj[i].checked==true){
			matnrs+=matnrCheckObj[i].value+",";
			var num=skuNumObj[i].value;
			if(!num || num==""){
				skuNumObj[i].style.background="yellow";
				allWrite=false;
			}else{
				skuNumObj[i].style.background="white";
				nums+=skuNumObj[i].value+",";
			}
		}
	}
	matnrs=matnrs.substring(0, matnrs.length-1);//去掉最后的逗号	
	nums=nums.substring(0, nums.length-1);//去掉最后的逗号
	if(allWrite){
		$(window.parent.document).contents().find("#"+nowFrameName)[0].contentWindow.fillSku(matnrs,nums,type);
		return true;
	}else{
		alert("请填写sku数量!");
		return false;
	}
}

//当前显示iframe的id(默认为第一个,材料清单),用来标识需要提交的form在哪个iframe
var nowFrameName="fucaiFrame";
function changeTab(toPageType,vbeln){

	if(toPageType=="cailiao"){
		$("#list_clqd").show()
		$("#list_zcst,#list_fcst,#list_mzst,#list_gxhst").hide()
	}
	
	if(toPageType=="zhucai"){
        $("#list_zcst").show()
        $("#list_clqd,#list_fcst,#list_mzst,#list_gxhst").hide()
		$(".nav-justifiedli2").addClass("nav-justifiedhover")
		$(".nav-justifiedli1,.nav-justifiedli3,.nav-justifiedli4").removeClass("nav-justifiedhover")
	}
	
	if(toPageType=="fucai"){
        $("#list_fcst").show()
        $("#list_clqd,#list_zcst,#list_mzst,#list_gxhst").hide()
		$(".nav-justifiedli1").addClass("nav-justifiedhover")
		$(".nav-justifiedli2,.nav-justifiedli3,.nav-justifiedli4").removeClass("nav-justifiedhover")
	}
	
	if(toPageType=="muzuo"){
		$("#list_mzst").show()
		$("#list_clqd,#list_zcst,#list_fcst,#list_gxhst").hide()
		$(".nav-justifiedli3").addClass("nav-justifiedhover")
		$(".nav-justifiedli1,.nav-justifiedli2,.nav-justifiedli4").removeClass("nav-justifiedhover")
	}
	
	if(toPageType=="gexinghua"){
        $("#list_gxhst").show()
        $("#list_clqd,#list_zcst,#list_fcst,#list_mzst").hide()
		$(".nav-justifiedli4").addClass("nav-justifiedhover")
		$(".nav-justifiedli1,.nav-justifiedli2,.nav-justifiedli3").removeClass("nav-justifiedhover")
	}
	
	
	//获得点击标签的名字,并拼接为该标签链接的div内的iframe的id
	var toFrameId=toPageType+"Frame";

	//如果跳转到的标签是材料清单,那就不需要改变材料清单frame的src,因为没有这个frame
	if(toPageType!="cailiao"){
		//修改切换后标签内iframe src属性,也就是刷新页面
		var url="/price/detail_order?vbelns="+vbeln+"&type="+toPageType+"&now="+new Date()
		           +"&loginUserName="+loginUserName+"&token="+token;//app token
		document.getElementById(toFrameId).src=url;
	}
	
/*	//如果当前的页面是材料清单,那么就不需要提交这个页面的表单保存,因为没有修改
	if(nowFrameName!="cailiaoFrame"){
		//调用当前iframe中页面的js方法_提交表单
		$(window.parent.document).contents().find("#"+nowFrameName)[0].contentWindow.submitForm("/price/saveModifyNums");
	}*/
	//切换显示的iframe的id为跳转后的iframeid,先提交后修改
	nowFrameName=toFrameId;
	
	
}


//复核提交
function doReshenhe(vbeln,speQiStatus){
	//检查发货日程是否完整
	var bdarts=document.getElementsByName("bdarts");
	var unfull=false;
	for(var i=0; i<bdarts.length; i++) {
		var checkBdart=bdarts[i].value;
		if(!checkBdart || checkBdart==""){
			unfull=true;
			bdarts[i].style.backgroundColor="yellow"; 
		}else{
			bdarts[i].style.backgroundColor="white"; 
			
		}
	}
	
	if(unfull){
		alert("发货日程不完整!");
		return false;
	}
	
	var posnrs=document.getElementsByName("posnrs");
	var nums=document.getElementsByName("nums");
	var lfimgs=document.getElementsByName("lfimgs");
	var posnrStr="[";
	var ifAlert=false;
	for(var i=0; i<nums.length; i++) {
		if(lfimgs[i].value < nums[i].value){
			posnrStr += posnrs[i].value +",";
			nums[i].style.backgroundColor="yellow"; 
			ifAlert=true;
		}else{
			nums[i].style.backgroundColor="white";
			
		}
	}
	posnrStr=posnrStr.substring(0,posnrStr.length-1);
	posnrStr += "]";
	if(ifAlert){
		alert("行号为"+posnrStr+"的sku的复核数量超过预估数量!");
		return false;
	}
	
	
	if(confirm("确定要审核通过复核数量吗？")){
	    $("#editform").attr("action", "/price/saveModifyNums");
	    $("#editform").submit();	
	}	
}

//文本框只能输入整数和小数的js方法
function clearNoNum(obj){
   obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符
   obj.value = obj.value.replace(/^\./g,"");  //验证第一个字符是数字而不是.
   obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的.
   obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
}	
	
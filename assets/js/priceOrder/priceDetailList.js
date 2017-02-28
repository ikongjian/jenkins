function toogleTr(obj){
	var colNum=obj.value;
	if(obj.checked){
		$('table tr').find('td:eq('+colNum+')').show();
		$('table tr').find('th:eq('+colNum+')').show();
	}else{
		$('table tr').find('td:eq('+colNum+')').hide();
		$('table tr').find('th:eq('+colNum+')').hide();
	}	
}
function fillSku(matnrs,nums,type){
	var werks=$("#werks").val();
	var vkorg=$("#vkorg").val();
	var inco1=$("#inco1").val();
	var params = {werks:werks,vkorg:vkorg,inco1:inco1,matnr:matnrs,num:nums};
    
    $.post("/price/selectMaraInfoByMatnr", params,function (data, textStatus){
        $.each(data,function(i,item){
        	var talcan=null;
        	if (item.kzumw=='A'){talcan="套餐内";}
        	if (item.kzumw=='B'){talcan="个性化";}
        	
        	var richeng=null;
			if(item.bdart=="10"){richeng="主材第一次(开工第6天)";}
			if(item.bdart=="20"){richeng="主材第二次(开通第11天)";}
			if(item.bdart=="30"){richeng="辅料第一次(开工前1天)";}
			if(item.bdart=="40"){richeng="辅料第二次";}
			if(item.bdart=="50"){richeng="木作";}
			if(item.bdart=="60"){richeng="主材补货";}
			if(item.bdart=="70"){richeng="辅料补货";}
			if(item.bdart=="80"){richeng="木作补货";}
			if(item.bdart=="100"){richeng="直送特单";}
			if(item.bdart=="110"){richeng="工地自采";}
			if(item.bdart=="120"){richeng="直配特单";}
			
			var td0=document.getElementById("selectTd0").checked==true?"":" style='display:none;' ";
			var td1=document.getElementById("selectTd1").checked==true?"":" style='display:none;' ";
			var td9=document.getElementById("selectTd9").checked==true?"":" style='display:none;' ";
			var td10=document.getElementById("selectTd10").checked==true?"":" style='display:none;' ";
			var td11=document.getElementById("selectTd11").checked==true?"":" style='display:none;' ";
			var td12=document.getElementById("selectTd12").checked==true?"":" style='display:none;' ";
			
/*			alert(
					"0:"+td0+"\r\n"+
					"1:"+td1+"\r\n"+
					"9:"+td9+"\r\n"+
					"10:"+td10+"\r\n"+
					"11:"+td11+"\r\n"+
					"12:"+td12+"\r\n"
			);*/
			
			var html="";
			//辅材添加行
			html="<tr>"+
			"<td width=''><button type='button' class='btn-orange button_orange' onclick='delSku(this);'>删除</button></td>"+
			"<td "+td0+" width=''>" +
				"<input type='hidden' name='newProdhs' value='"+toStr(item.prodh)+"' class='input_160'/>" +
				"<input type='hidden' name='newMatkl' value='"+toStr(item.matkl)+"' class='input_160'/>" +
				"<input type='hidden' name='newKzumw' value='"+toStr(item.kzumw)+"' class='input_160'/>" +
				"<input type='hidden' name='newNetpr' value='"+toStr(item.netpr)+"' class='input_160'/>" +
				"<input type='hidden' name='newNetwr' value='"+toStr(item.netwr)+"' class='input_160'/>" +
				"<input type='hidden' name='newMeins' value='"+toStr(item.meinh)+"' class='input_160'/>" +
				"<input type='hidden' name='newMatnrs' value='"+item.matnr +"' class='input_160'/>" +
				"<input type='hidden' name='newBdarts' value='"+toStr(item.bdart)+"' class='input_160'/>"+
			"</td>"+
			"<td "+td1+" width=''>"+richeng+"</td>"+
			"<td width=''>"+item.matnr +"<input type='hidden' name='matnrs' value='"+item.matnr +"' class='input_160'/></td>"+
			"<td width='' style='text-align: left;' title='"+item.maktg +"'>"+item.maktg +"</td>"+
			"<td width=''><input type='text' style='width: 45px;' name='newLfimgs' value='"+item.lfimg +"' readonly='readonly'  class='input_asText'></td>"+
			"<td width=''><input type='text' style='width: 45px;' value='"+item.lfimg +"' name='newNums' onKeyUp='clearNoNum(this)' onafterpaste='clearNoNum(this)'  class='input_center'></td>"+
			"<td width=''>"+toStr(item.meinh) +"</td>"+
			"<td width=''>"+toStr(item.zcolor) +"</td>"+
			"<td width=''>"+toStr(item.brandName) +"</td>"+
			"<td "+td9+" width=''>"+formatNum(item.netpr) +"</td>"+
			"<td "+td10+" width=''>"+formatNum(item.netwr) +"</td>"+
			"<td "+td11+" width=''>"+toStr(item.objko) +"</td>"+
			"<td "+td12+" width=''><input type='text' style='width: 60px;height: 20px' name='newSumbd' class='input_center'></td>"+
			"</tr>"; 
        	$("#detailList").append(html);
        });  
        //div滚动到底部
        $('#detail_list_body').scrollTop( $('#detail_list_body')[0].scrollHeight );
    }, "json");
}

function toStr(obj){
	return obj==null?"":obj;
}
function formatNum(obj){
	return obj.toFixed(2);
}

//删除行
function delSku(obj){
	$(obj).parent("td").parent("tr").remove(); 
}

//添加sku,查询可添加sku列表,并弹出窗口
function addSku(type,werks){
	
	var matnrs="";//用来拼接列表中已经有的商品编码,用来排除
	var i=0;
	$("input[name='matnrs']").each(function(){
		matnrs += $(this).val()+","
		i++
	});	
	matnrs=matnrs.substring(0, matnrs.length-2);//去掉最后的逗号
	
	//查询辅材列表
	var params={matnrs:matnrs,type:type,werks:werks};
	$.post("/price/selectMaraList", params,function (data, textStatus){
		window.parent.emptyMaraList();
		var html="";//用来拼接要添加的行
        $.each(data,function(i,mara){
        	var zpdo=mara.zpdo==null?"":mara.zpdo;
        	var zpdt=mara.zpdt==null?"":mara.zpdt;
        	html+="<tr>"+
					"<td><input type='checkbox' name='matnrCheck' value='"+mara.matnr+"' ></td>"+
					"<td>"+(i+1)+"</td>"+	
					"<td>"+mara.matnr+"</td>"+	
					"<td style='text-align:left;'>"+mara.maktg+"</td>"+	
					"<td><input type='text' name='skuNum' onKeyUp='clearNoNum(this)' style='width:60px' onafterpaste='clearNoNum(this)'></td>"+	
					"<td>"+zpdo+"</td>"+	
					"<td>"+zpdt+"</td>"+	
				"</tr>";
        });
        window.parent.fillMaraList(html);
	}, "json");	
	window.parent.addRows("addDiv","请选择需要添加的sku(已经添加的非个性化sku将不显示在列表中)",type);
	
//$("#detailList").append(str);
//$('#detail_list_body').scrollTop( $('#detail_list_body')[0].scrollHeight );
}


function submitForm(action){
	$("#editForm").attr("action",action);
	$("#editForm").submit();		
}

//文本框只能输入整数和小数的js方法
function clearNoNum(obj){
   obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符
   obj.value = obj.value.replace(/^\./g,"");  //验证第一个字符是数字而不是.
   obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的.
   obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
   obj.value = obj.value.replace(".","");
   if(!obj.value || obj.value==""){
	   obj.value="0";
   }
}

var nameAry=new Array("nums","kannr","speAlternate","umref","newNums","newKannr","newSpeAlternate","newUmref");

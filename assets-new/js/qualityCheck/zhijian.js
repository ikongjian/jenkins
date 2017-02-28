// JavaScript Document
$(document).ready(function(){
	//获取浏览器窗口高度
	var height = $(window).height()
	//body高度
	var text = $("body").height()
	//头部高度
	var head = $("header").height()
	//窗口高度减去头部高度
	var mapheight = height - head
	
	//登录
	$(".login").click(function(e) {
		e.stopPropagation();
        $(".login_show").toggle()
    });
	
	//签到
	$(".map").height(mapheight -1 )
	//报告
	$(".report_color,.report_colorhover").click(function(e) {
		$(this).parent().find(".report_color,.report_colorhover").toggle()
        $(this).parent().parent().find(".report_xq").toggle()
    });
	//检查
	$(".j_switch ul").height(text)
	$(".j_switch_tab").click(function(e) {
		$(this).hide()
		$(".j_switch_bat").show()
        $(this).parent().find("ul").toggle()
		$("body").css("overflow","hidden")
    });
	$(".j_switch_bat").click(function(e) {
		$(this).hide()
		$(".j_switch_tab").show()
        $(this).parent().find("ul").toggle()
		$("body").css("overflow","auto")
    });
    // //选择质检
    // $(".j_Choice_term h5").click(function(e) {
		// $(this).toggleClass("arrow")
    //     $(this).parent().find("ul").toggle()
    // });

    //质检项目列表展开
    $(".j_Choice_term li .fold").click(function () {
        var thisLi = $(this).parents("li");
        $(this).toggleClass("unfold");
        thisLi.find("dl").slideToggle(300);
        thisLi.siblings("li").find("dl").slideUp(300);
    })

    var imgNum = 0;
    var onloadNum = 0;
	//上传图片  
	$("input[name=imgfile]").on("change", function(){
		var img = $(this).val()
		var checkId = $("input[name=checkId]").val();
		
		// var file = this.files[0];
		imgNum = this.files.length;
		var data = new FormData()
		data.append('checkId',checkId)

		
		for(var i = 0; i < this.files.length; i++){
            var file = this.files[i];

            //filereader读取文件
			var fileReader = new FileReader();
			fileReader.readAsDataURL(file);				//fileReader.readAsDataURL  自身属性result中将包含一个data: URL格式的字符串以表示所读取文件的内容.
			fileReader.onload = function (event) {    //fileReader当读取操作成功完成时调用onload  	事件可以带个参数event用于表示这个事件本身
				var url = event.target.result;		//event.target 返回事件触发者元素对象本身  IE貌似不支持

				//创建image对象加载图片文件    实际上就是<img>标签
				var image = new Image();
                image.onload = function(){
                	var cvs = document.createElement("canvas")  //h5画布
                	var scale = 1;  //缩放比例
					if(this.width > 800 || this.height > 800){
                       if(this.width > this.height){
                            scale = 800 / this.width;
                        }else{
                            scale = 800 / this.height;
                        }
                    }

                    cvs.width = this.width * scale;
					cvs.height = this.height * scale;
					var context = cvs.getContext('2d');
					context.drawImage(this, 0, 0, cvs.width, cvs.height);

                    /* return base64 格式的数据  canvas.toDataURL(type, encoderOptions);
					 * type: default type is image/png.
					 * encoderOptions : 0-1 之间的数字 表示品质 default: 0.92
                     */
					var dataURL = cvs.toDataURL(file.type, 0.8);
                    data.append('imgfile', dataURItoBlob(dataURL), file.name);
                    onloadNum ++;

                    //onload事件 不同步  所以上传只能放在onload内部
                    if(imgNum == onloadNum){
                        $.ajax({
                            type:"post",
                            url:"/qualityCheck/uploadImage",
                            data: data,
                            contentType: false, //必须
                            processData: false, //必须
                            dataType: "json",
                            async: true,
                            success:function(result){
                                var num = result.num;
                                $("#span_imgNum").html(num);
                                $("input[name=imgfile]").val("");
                                onloadNum = 0;
                                alert("图片上传成功");
                            }
                        });
                    }

                }
                image.src = url;	//onload这种追加事件要写在触发事件之前，否则多次触发会不执行
            }

            // data.append('imgfile', this.files[i], this.files[i].name);
        }

		// //上传突变改为异步处理  并且接收反馈修改照片数量
		// $.ajax({
		//     type:"post",
		//     url:"/qualityCheck/uploadImage",
		//     data: data,
		//     contentType: false, //必须
		//     processData: false, //必须
		//     dataType: "json",
		// 	success:function(result){
		// 		var num = result.num;
		// 		$("#span_imgNum").html(num);
		// 		$("input[name=imgfile]").val("");
		//
		// 		alert("图片上传成功");
		//     }
		// });

		
	});

	//dataURI 转换Blob 方便file上传
    function dataURItoBlob(dataURI) {
        var byteString = atob(dataURI.split(',')[1]);
        var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
        var ab = new ArrayBuffer(byteString.length);
        var ia = new Uint8Array(ab);
        for (var i = 0; i < byteString.length; i++) {
            ia[i] = byteString.charCodeAt(i);
        }
        return new Blob([ia], {type: mimeString});
    }



	//质检详情
	$(".photo").click(function(e) {
        $(this).parent().find("input").click()
    });
	$(".j_inputok").click(function(e) {
        $(this).parent().parent().find(".j_projectcl").hide()
    });
	$(".j_input").click(function(e) {
        $(this).parent().parent().find(".j_projectcl").show()
    });
	$(".pop_close").click(function(e) {
        $(".pop_project").hide();
        $("#showphoto").hide();
		$("body").css("overflow","auto")
    });
	$(".pop_an").click(function(e){
		 var checkId = $(this).parent().find("input[name=checkId]").val()
		 var detailId = $(this).parent().find("input[name=detailId]").val()

		 var checkTypeFor = $(this).parent().find("label[id=checkType][class='checked']").attr("for")
		 var checkType = $(this).parent().find("input[id="+checkTypeFor+"]").val()
		 var limitTime = $(this).parent().find("input[name=limitTime]").val()
		 var disposeMoney = $(this).parent().find("input[name=disposeMoney]").val()
		 var checkDescription = $(this).parent().find("textarea[name=desp]").val()
		 
		 
        var disposeWarning
        if($(this).parent().find("label[id=disposeWarninglabel]").hasClass("checked")){
        	disposeWarning = 1
        }
		var disposeRectificationNow
        if($(this).parent().find("label[id=disposeRectificationNowlabel]").hasClass("checked")){
        	disposeRectificationNow = 1
        }
		var disposeRectificationDelay
        if($(this).parent().find("label[id=disposeRectificationDelaylabel]").hasClass("checked")){
        	disposeRectificationDelay = 1
        }
		var disposeFine
        if($(this).parent().find("label[id=disposeFinelabel]").hasClass("checked")){
        	disposeFine = 1
        }
		
		 
		 
		 if(disposeWarning != 1 && disposeRectificationNow != 1 && disposeRectificationDelay != 1 && disposeFine != 1){
			 alert("请至少选择一种处理方式")
			 return ;
		 }
		 
		 //进行检查   限期整改   必须要有时间和方式
		 if(disposeRectificationDelay == 1 && (limitTime == "" || checkType == undefined)){
			 alert("必须填写整改限期时间和复检方式")
			 return ;
		 }
		 if(disposeRectificationDelay != 1){
			 limitTime="";
			 checkType="";
		 }
		 
		 
		 //进行检查   限期整改   必须要有时间和方式
		 if(disposeFine == 1 && disposeMoney == ""){
			 alert("必须填写罚款金额")
			 return ;
		 }
		 if(disposeFine != 1){ //如果没有勾选  去掉罚款金额数据
			 disposeMoney="";
		 }
		 
		 
		 //进行日期格式转换 转换成yyyy-MM-dd
		 var limitTimelong
		 if(limitTime != ""){
			 limitTimelong = new Date(limitTime).getTime();
		 }
		 
		 
		 $.post( "/qualityCheck/updateDispose", { checkId: checkId, detailId: detailId, //disposeType: disposeType, 
			 checkType: checkType, limitTimelong: limitTimelong, disposeMoney: disposeMoney, description: checkDescription,
			 disposeWarning:disposeWarning, disposeRectificationNow:disposeRectificationNow,
			 disposeRectificationDelay:disposeRectificationDelay, disposeFine:disposeFine} );
		 $(".pop_project").hide()
	     $("body").css("overflow","auto")
	     
	     
	     var index = $(this).parent().find("input[name=index]").val()
	     
	     $(".j_projectcl span[data-index=" + index + "]").html("已处理");
	     $(".j_projectcl span[data-index=" + index + "]").parent().find("input[id=desp" + index + "]").val(checkDescription);
		 $(".j_projectcl span[data-index=" + index + "]").parent().find("input[id=ltm" + index + "]").val(limitTimelong);
		 $(".j_projectcl span[data-index=" + index + "]").parent().find("input[id=ctp" + index + "]").val(checkType);
		 $(".j_projectcl span[data-index=" + index + "]").parent().find("input[id=dsm" + index + "]").val(disposeMoney);
		 
		 $(".j_projectcl span[data-index=" + index + "]").parent().find("input[id=disposeWarning" + index + "]").val(disposeWarning);
		 $(".j_projectcl span[data-index=" + index + "]").parent().find("input[id=disposeRectificationNow" + index + "]").val(disposeRectificationNow);
		 $(".j_projectcl span[data-index=" + index + "]").parent().find("input[id=disposeRectificationDelay" + index + "]").val(disposeRectificationDelay);
		 $(".j_projectcl span[data-index=" + index + "]").parent().find("input[id=disposeFine" + index + "]").val(disposeFine);
	});
	$(".j_input").click(function(e) {
		
		var index = $(this).parent().parent().find(".j_projectcl span").attr("data-index");
		
		$(".pop_project").find("textarea[name=desp]").val($(this).parent().parent().find("input[id=desp" + index + "]").val())
		$(".pop_project").find("input[name=detailId]").val($(this).parent().parent().find("input[id=detailId" + index + "]").val())
		$(".pop_project").find("input[name=index]").val(index)
		
		$(".pop_project").find('label').removeAttr("class")
		$(".pop_project").find('input[name=limitTime]').removeAttr("value")
		$(".pop_project").find('input[name=disposeMoney]').removeAttr("value")
		$(".pop_project").find('.zhenggai').hide()
		$(".pop_project").find('.rmb').hide()
        $(".pop_project").show()
    
        var disposeWarning = $(this).parent().parent().find("#disposeWarning" + index + "").val();
		var disposeRectificationNow = $(this).parent().parent().find("#disposeRectificationNow" + index + "").val();
		var disposeRectificationDelay = $(this).parent().parent().find("#disposeRectificationDelay" + index + "").val();
		var disposeFine = $(this).parent().parent().find("#disposeFine" + index + "").val();
        
        if(disposeWarning == 1){
        	$("label[for=punished1_1]").attr("class","hover").attr("class", "checked")
        	$("input[id=punished1_1]").attr("checked","checked")
        }
        if(disposeRectificationNow == 1){
        	$("label[for=punished1_2]").attr("class","hover").attr("class", "checked")
        	$("input[id=punished1_2]").attr("checked","checked")
        }
        if(disposeRectificationDelay == 1){
        	$("label[for=punished1_3]").attr("class","hover").attr("class", "checked")
        	$("input[id=punished1_3]").attr("checked","checked")
        }
        if(disposeFine == 1){
        	$("label[for=punished1_4]").attr("class","hover").attr("class", "checked")
        	$("input[id=punished1_4]").attr("checked","checked")
        }
       
        var checkType = $(this).parent().parent().find("input[id=ctp" + index + "]").val()
        var ltm = $(this).parent().parent().find("input[id=ltm" + index + "]").val()

        //整改信息注入并显示
        if(disposeRectificationDelay == 1){
        	$("label[for=change"+checkType+"]").attr('class', 'hover').attr("class", "checked")
        	$("#change"+checkType).attr("checked", "checked");
        	
        	$(".pop_project").find("input[name=limitTime]").val(new Date(Number(ltm)).Format("yyyy-MM-dd"))
        	$(".zhenggai").show()
        }
        
		//罚金信息注入
        var dsm = $(this).parent().parent().find("input[id=dsm" + index + "]").val()
        $(".pop_project").find("input[name=disposeMoney]").val(dsm)
        if(disposeFine == 1){
        	$(".rmb").show()
        }
        
        var popheight = $(".pop_projectc").height()
		var poptop = (height-popheight-200)/2
		$(".pop_projectc").css("margin-top",poptop)
		$("body").css("overflow","hidden")
    });
	
	
	$("#punished1_3").click(function(e) {
		if(!$(this).parent().find("label[for=punished1_3]").hasClass("checked")){
	        $(".zhenggai").show()
		}else{
			$(".zhenggai").hide()
			$(".zhenggai input").removeAttr("checked");
//			$(".zhenggai input").val("")
//			$(".zhenggai label").removeClass("checked")
		}
    });
	$("#punished1_4").click(function(e) {
		if(!$(this).parent().find("label[for=punished1_4]").hasClass("checked")){
			$(".rmb").show()
		}else{
			$(".rmb").hide()
//			$(".rmb input").val("")
		}
	});
	//选择按钮
	$('input').customInput();
	$('.toggle').each(function(){
	$('div:first',this).addClass('first');
	$('div:last',this).addClass('last');
	});
})


//个人信息弹出框消失
$(document).click(function(){
	$(".login_show").hide();
});



//格式转换
Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

//选择按钮
jQuery.fn.customInput = function(){
	return $(this).each(function(){	
		if($(this).is('[type=checkbox],[type=radio]')){
			var input = $(this);
			var label = $('label[for='+input.attr('id')+']');
			input.add(label).wrapAll('<div class="custom-'+ input.attr('type') +'"></div>');
			label.hover(
				function(){ $(this).addClass('hover'); },
				function(){ $(this).removeClass('hover'); }
			);			
			input.bind('updateState', function(){	
				input.is(':checked') ? label.addClass('checked') : label.removeClass('checked checkedHover checkedFocus'); 
			})
			.trigger('updateState')
			.click(function(){ 
				$('input[name='+ $(this).attr('name') +']').trigger('updateState'); 
			})
			.focus(function(){ 
				label.addClass('focus'); 
				if(input.is(':checked')){  $(this).addClass('checkedFocus'); } 
			})
			.blur(function(){ label.removeClass('focus checkedFocus'); });
		}
	});
};
//全选，全不选
function selectAll(qx_name,input_name){
	
		$("input[name = " + input_name + "]").each(function(){
			if($(this).attr("disabled")=="disabled"){
				
			}else{
				if(document.getElementById(qx_name).checked){
					$(this).attr("checked","checked");
				}else{
					$(this).removeAttr("checked"); 
				}
			}
		});
}

//巡检   约检  复检  切换
$(".j_tab").find("p").live("click",function(){
	var id = $(this).attr("data-id");
	if(id == 0){
		window.location = "/qualityCheck/xjlist";
	}
	if(id == 1){
		window.location = "/qualityCheck/inviteList";
	}
	if(id == 2){
		window.location = "/qualityCheck/rechecklist";
	}
});
$(".j_tab").find("p").click(function(){
	var id = $(this).attr("data-id");
	if(id == 0){
		window.location = "/qualityCheck/xjlist";
	}
	if(id == 1){
		window.location = "/qualityCheck/inviteList";
	}
	if(id == 2){
		window.location = "/qualityCheck/rechecklist";
	}
});



/*kenan 2016 05 12 记录操作日志
 * 10：代办事项，20：进入质检项，21：暂存，22：提交报告，23：约检验收，24查看报告，25约检验收
 */
function operationLog(type){
	$.ajax({
		cache: true,
        type: "POST",
        url:"/func/click",
        data:{type:type},
        async: false
	});
}


//kenan 比较日期大小
function compareDate(date1, date2){
	var num1 = new Date(date1).getTime();
	var num2 = new Date(date2).getTime();
	if(num1 > num2){
		return 1;
	}else if(num1 == num2){
		return 0;
	}else{
		return -1;
	}
}
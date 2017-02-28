<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>密码修改</title>

<style type="text/css">
.order_ul_li100 li{margin-left: 280px;margin-top: 10px;}

.ywz_zhucexiaobo{padding-bottom:10px;padding-top:5px;}
.ywz_zhuce_youjian{float:left;width:100px;margin: 5px 0 0 0;font-size:14px;text-align:right;}
.ywz_zhuce_xiaoxiaobao{float:left;width:226px;}
.ywz_zhuce_kuangzi{float:left;width:226px;height:38px;color:#171717;}
.ywz_zhuce_huixian{float:left;background:#d6d3d3;width:62px;height:4px;margin-top:5px;_margin-top:0px;margin-left:5px;_height:2px;font-size:0px;}
.ywz_zhuce_hongxianwenzi{float:left;width:62px;margin-left:5px;text-align:center;color:#b0adad;font-size:12px;}

.ywz_zhuce_kuangwenzi1{float:left;color:#3e3e3e;width:210px;height:40px;line-height:35px;padding-left:7px;_padding-left:20px;outline:medium;}/*框*/

.ywz_zhuce_hongxian{float:left;background:#ff3300;width:62px;height:4px;margin-top:5px;margin-left:5px;_margin-top:0px;_height:2px;font-size:0px;}
.ywz_zhuce_hongxian2{float:left;background: #099;width:62px;height:4px;margin-top:5px;margin-left:5px;_margin-top:0px;_height:2px;font-size:0px;}
.ywz_zhuce_hongxian3{float:left;background: #060;width:62px;height:4px;margin-top:5px;margin-left:5px;_margin-top:0px;_height:2px;font-size:0px;}

.ywz_zhuce_yongyu1{float:left;color: #C00;font-size:12px;padding-left:10px;margin-top:10px;_padding-left:0px;}/*后面的文字*/
.ywz_zhuce_yongyu1 a{ color:#C00;text-decoration:none;}
.ywz_zhuce_yongyu1 a:hover{ color:#C00;}
</style>
<script type="text/javascript">
	$(function() {
		$('#newPwd').focus(function () {
			$('#pwdLevel_1').attr('class', 'ywz_zhuce_hongxian');
			$('#newPwd').keyup();
		});

		$('#newPwd').keyup(function () {
			var __th = $(this);

			if (!__th.val()) {
				$('#pwd_tip').hide();
				$('#pwd_err').show();
				Primary();
				return;
			}
			if (__th.val().length < 6) {
				$('#pwd_tip').hide();
				$('#pwd_err').show();
				Weak();
				return;
			}
			var _r = checkPassword(__th);
			if (_r < 1) {
				$('#pwd_tip').hide();
				$('#pwd_err').show();
				Primary();
				return;
			}

			if (_r > 0 && _r < 2) {
				Weak();
			} else if (_r >= 2 && _r < 4) {
				Medium();
			} else if (_r >= 4) {
				Tough();
			}

			$('#pwd_tip').hide();
			$('#pwd_err').hide();
		});
		
		$(".input_ok").click(function() {
			var pwd=$("#pwd").val();
			var newPwd=$("#newPwd").val()
			var newPwdAgain=$("#newPwdAgain").val();
			if(pwd==null||pwd.length==0||newPwd==null||newPwd.length==0||
			   newPwdAgain==null||newPwdAgain.length==0) {
				layer.alert("密码不能为空！");
				return false;
			}
			if(newPwd.length<8) {
				layer.alert("密码长度必须是8-20位！");
				return false;
			}
			//是否包含数字和字母
			var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;
			if(!reg.test(newPwd)) {
				layer.alert("密码必须是数字和字母的组合！");
				return false;
			}
			if(pwd == newPwd) {
				layer.alert("新密码不能与原密码一致");
				return false;
			}
			if(newPwd!=newPwdAgain) {
				layer.alert("新密码与确认密码不一致！");
				return false;
			}
			if(newPwd!=null){
                if(checkPassword($("#newPwd"))<2){
                	layer.alert("新密码安全强度太弱！");
    				return false;
                }
        	}
			$.post("/modifyPwd",{pwd:pwd,newPwd:newPwd,newPwdAgain:newPwdAgain},function(data) {
				if(data.statusCode=="success") {
					layer.alert(data.statusCodeInfo,function(){
						selectHref();
					});
				} else {
					layer.alert(data.statusCodeInfo);
				}
			})
		});
	});
	function selectHref() {
		if (token != null && token != '') {
			window.location = "/logoutFromApp";
		} else {
			window.location = "/logout";
		}
	}
	function Primary() {
		$('#pwdLevel_1').attr('class', 'ywz_zhuce_huixian');
		$('#pwdLevel_2').attr('class', 'ywz_zhuce_huixian');
		$('#pwdLevel_3').attr('class', 'ywz_zhuce_huixian');
	}

	function Weak() {
		$('#pwdLevel_1').attr('class', 'ywz_zhuce_hongxian');
		$('#pwdLevel_2').attr('class', 'ywz_zhuce_huixian');
		$('#pwdLevel_3').attr('class', 'ywz_zhuce_huixian');
	}

	function Medium() {
		$('#pwdLevel_1').attr('class', 'ywz_zhuce_hongxian');
		$('#pwdLevel_2').attr('class', 'ywz_zhuce_hongxian2');
		$('#pwdLevel_3').attr('class', 'ywz_zhuce_huixian');
	}

	function Tough() {
		$('#pwdLevel_1').attr('class', 'ywz_zhuce_hongxian');
		$('#pwdLevel_2').attr('class', 'ywz_zhuce_hongxian2');
		$('#pwdLevel_3').attr('class', 'ywz_zhuce_hongxian3');
	}




	function checkPassword(pwdinput) {
		var maths, smalls, bigs, corps, cat, num;
		var str = $(pwdinput).val()
		var len = str.length;

		var cat = /.{16}/g
		if (len == 0) return 1;
		if (len > 16) { $(pwdinput).val(str.match(cat)[0]); }
		cat = /.*[\u4e00-\u9fa5]+.*$/
		if (cat.test(str)) {
			return -1;
		}
		cat = /\d/;
		var maths = cat.test(str);
		cat = /[a-z]/;
		var smalls = cat.test(str);
		cat = /[A-Z]/;
		var bigs = cat.test(str);
		var corps = corpses(pwdinput);
		var num = maths + smalls + bigs + corps;

		if (len < 6) { return 1; }

		if (len >= 6 && len <= 8) {
			if (num == 1) return 1;
			if (num == 2 || num == 3) return 2;
			if (num == 4) return 3;
		}

		if (len > 8 && len <= 11) {
			if (num == 1) return 2;
			if (num == 2) return 3;
			if (num == 3) return 4;
			if (num == 4) return 5;
		}

		if (len > 11) {
			if (num == 1) return 3;
			if (num == 2) return 4;
			if (num > 2) return 5;
		}
	}

	function corpses(pwdinput) {
		var cat = /./g
		var str = $(pwdinput).val();
		var sz = str.match(cat)
		for (var i = 0; i < sz.length; i++) {
			cat = /\d/;
			maths_01 = cat.test(sz[i]);
			cat = /[a-z]/;
			smalls_01 = cat.test(sz[i]);
			cat = /[A-Z]/;
			bigs_01 = cat.test(sz[i]);
			if (!maths_01 && !smalls_01 && !bigs_01) { return true; }
		}
		return false;
	}
</script>
</head>

<body>
    <!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>密码修改</h6>
        </header>
        <div class="content">
            <!--某某人-->
            <div class="text_center"></div>
        	<!--查看【竣工申请】进程-->
            <div class="order">
            	<h2 class="title_h2"></h2>
                <ul class="order_ul_li100">
                	<li style="margin-left: 280px;">
                    	<span>当前密码：</span>
                        <b><input type="password" id="pwd" placeholder="请输入当前密码"></b>
                    </li>
                    <li style="margin-left: 280px;">
                    	<span>新密码：</span>
                        <b>
                          <div class="ywz_zhucexiaobo">
                        	<div class="ywz_zhuce_xiaoxiaobao">
								<div class="ywz_zhuce_kuangzi">
									<!-- <input name="tbPassword" type="password" id="tbPassword" class="ywz_zhuce_kuangwenzi1"> -->
									<input class="ywz_zhuce_kuangwenzi1" type="password" id="newPwd" placeholder="请输入新密码">
								</div>
								<div class="ywz_zhuce_huixian" id="pwdLevel_1"> </div>
								<div class="ywz_zhuce_huixian" id="pwdLevel_2"> </div>
								<div class="ywz_zhuce_huixian" id="pwdLevel_3"> </div>
								<div class="ywz_zhuce_hongxianwenzi"> 弱</div>
								<div class="ywz_zhuce_hongxianwenzi"> 中</div>
								<div class="ywz_zhuce_hongxianwenzi"> 强</div>
							</div>
							<div class="ywz_zhuce_yongyu1">
								<span id="pwd_tip" style="color: rgb(137, 137, 137); display: none;">
								<font style="color: #F00">*</font>6-16位，由字母（区分大小写）、数字、符号组成</span>
							</div>
						   </div>
                        </b>
                    </li>
                    <li style="margin-left: 280px;">
                    	<span>新密码确认：</span>
                        <b>
                        	<input type="password" id="newPwdAgain" placeholder="请再次输入新密码">
                        </b>
                    </li>
                    <li style="margin-left: 140px;"><input class="input_ok" type="button" value=确定></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>

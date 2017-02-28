/*if (window.WebViewJavascriptBridge) {
	WebViewJavascriptBridge.callHandler('login');
} else {

}*/
/*function videoPause() {
	$("#video_cont").get(0).pause();
}*/
function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}
var token = "";
var loginUserName = "";
$(document).ready(function() {
	token = GetQueryString("token");
	loginUserName = GetQueryString("loginUserName");
	var ua = navigator.userAgent.toLowerCase(); 
	if (ua.indexOf("workerpad") >= 0) {
		$.each($("a"), function(n, value) {
			if($(value).prop("href").indexOf("tel:")!=0){
				if($(value).prop("href").indexOf("?") >= 0){
					$(value).prop("href", $(value).prop("href") + "&token=" + token + "&loginUserName="+loginUserName);
				}else{
					$(value).prop("href", $(value).prop("href") + "?token=" + token + "&loginUserName="+loginUserName);
				}
			}
		});
		$.each($("form"), function(n, value) {
			if($(value).prop("action").indexOf("?") >= 0){
				$(value).prop("action", $(value).prop("action") + "&token=" + token + "&loginUserName="+loginUserName);
			}else{
				$(value).prop("action", $(value).prop("action") + "?token=" + token + "&loginUserName="+loginUserName);
			}
		});
	}
})

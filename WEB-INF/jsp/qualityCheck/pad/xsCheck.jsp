<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>复检申请-线上</title>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<style type="text/css">
    .fill_broadcast {
        width: 95%;
        margin: 0 auto;
        padding-top: 1%;
    }
    .fill_broadcast p {
        min-height: 2.4rem;
        line-height: 2.4rem;
        width: 100%;
        overflow: hidden;
        margin-bottom: 0.7rem;
        position: relative;
    }
    .fill_broadcast p strong em {
        width: 32%;
        margin: 0 0.5%;
        float: left;
        font-style: normal;
        font-weight: normal;
    }
    .fill_broadcast p strong em i.shangchuan {
        background: url(/assets-new/img/shouhuo.jpg) no-repeat center center;
    }
    .fill_broadcast p strong em i {
        width: 100%;
        height: 15rem;
        display: block;
        overflow: hidden;
    }
    .fill_broadcast p strong em a {
        display: block;
        border: 0.1rem solid #a2a2a2;
        border-radius: 0.5rem;
        text-align: center;
        color: #656565;
        height: 2.4rem;
        line-height: 2.4rem;
        width: 9rem;
        margin: 1rem auto;
    }
    .fill_broadcast p strong em a {
        display: block;
        border: 0.1rem solid #a2a2a2;
        border-radius: 0.5rem;
        text-align: center;
        color: #656565;
        height: 2.4rem;
        line-height: 2.4rem;
        width: 9rem;
        margin: 1rem auto;
    }
    .fill_broadcast p strong em i img {
        width: 100%;
        height: 100%;
    }
</style>
<script type="text/javascript">
    $(function() {
        $(".goods_zk").click(function(e) {
            $(this).parent().parent().parent().find(".table_goods").toggle();
            $(this).parent().find("a").toggle()
        });
        $(".pictureEM").click(function() {
            var fileInput=$(this).find(".photo_input")[0];
            if(fileInput) {
                fileInput.click();
                fileInput.onchange=function(event) {
                    var files=event.target.files;
                    var checkId=$("input[name='checkId']").val();
                    var formData=new FormData();
                    formData.append("checkId",checkId);
                    if(files&&files.length>0) {
                        for(var i=0;i<files.length;i++) {
                            formData.append("imgFile",files[i],files[i].name);
                            var file=files[i];
                            try {
                                var fileReader=new FileReader();
                                fileReader.readAsDataURL(file);
                                fileReader.onload=function(event) {
                                    var img=new Image();
                                    img.src=event.target.result;
                                    $.ajax({
                                        type:"post",
                                        url:"/fujian/check/uploadImage",
                                        data:formData,
                                        contentType:false,
                                        processData:false,
                                        dataType:"json",
                                        success:function(result) {
                                            $(".imgUpload").prepend("<em><i><img src="+img.src+"></img></i><a href='javascript:void(0);' class='del_img' data-url='"+result.imgUrl+"'>删除</a></em>");
                                        }
                                    });
                                 };
                            } catch(e) {
                                layer.alert("您的浏览器不支持图片预览！",{icon:5});
                            }
                        }
                    }
                };
            }
        });
        $("body").delegate(".del_img","click",function(e) {
            e.stopPropagation();
            $(this).parents("em").remove();
            var imgUrl=$(this).data("url");
            var checkId=$("input[name='checkId']").val();
            $.ajax({
                type:"post",
                url:"/fujian/check/deleteImage",
                data:{imgUrl:imgUrl,checkId:checkId},
                dataType:"json",
                async:false,
                cache:false,
                success:function(result) {}
            });
        });
        $("#xsUpdateForm").submit(function() {
            var imgSize=$(".imgUpload img").size();
            if(imgSize==0) {
                layer.alert("请上传施工照片！",{icon:2});
                return false;
            } else {
                return true;
            }
        });
    });
</script>
<div class="content" style="width:100%;">
    <div class="title">
        <h2>复检申请-线上</h2>
        <a href="javascript:void(0);" onclick="window.history.go(-1);"><img src="/assets-new/img/esc.png"></a>
    </div>
    <hr class="content_hr">
    <div class="zcheck_text">
        <ul>
            <c:forEach items="${details}" var="item" varStatus="status">
                <li>
                    <div class="zchenck_px">
                        <p class="zchenck_p1">${status.index+1}</p>
                        <p class="zchenck_p2">${item.checkName}</p>
                        <p class="zchenck_p3">不合格</p>
                        <p class="zchenck_p4">
                            <a class="goods_zk goods_zk1">详细</a>
                            <a class="goods_zk goods_zk2">收起</a>
                        </p>
                    </div>
                    <div class="zchenck_nr table_goods">
                        <p><span>违规形式：</span>${item.checkDescription}</p>
                        <p>
                            <span>处理方式：</span>
                            <c:if test="${item.disposeWarning==1}">警告&nbsp;&nbsp;</c:if>
                            <c:if test="${item.disposeRectificationNow==1}">现场整改&nbsp;&nbsp;</c:if>
                            <c:if test="${item.disposeRectificationDelay==1}">限期整改：
                                <fmt:formatDate value="${item.limitTime}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;
                                <c:if test="${item.checkType==1}">线上复检</c:if>
                                <c:if test="${item.checkType==2}">现场复检</c:if>&nbsp;&nbsp;</c:if>
                            <c:if test="${item.disposeFine==1}">罚款：${item.disposeMoney}元</c:if>
                        </p>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div class="formDetail">
        <h4>请上传整改后的施工照片</h4>
        <div class="fill_broadcast">
            <p>
                <strong class="imgUpload">
                    <em class="pictureEM">
                        <i class="shangchuan photo_pai"></i>
                        <input class="photo_input none" accept="image/*" name="imgFile" type="file">
                    </em>
                </strong>
            </p>
        </div>
    </div>
    <div class="projectForm">
        <form action="/fujian/check/xsUpdate" method="post" id="xsUpdateForm">
            <input type="hidden" name="checkId" value="${checkId}">
            <input type="hidden" name="orginCheckId" value="${orginCheckId}">
            <div class="submitWrap"><input type="submit" value="确定"></div>
        </form>
    </div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>材料申请</title>
    <style type="text/css">
        .content_soso {height:10.8rem;}
        .content_soso p span{ width:10rem;}
        .content_soso p.soso_td {width:48%;}
        .content_soso p.soso_gys {width:44%;}
        .content_soso select{
            width:50%;
            border: 0.1rem solid #dddee3;
            color: #999;
            height: 2.25rem;
            padding: 0 0.5rem;
            background:url("/assets-new/4th/img/select.png") no-repeat right center / 2.25rem;
        }
        .table_list tr td input.J_num {
            width:40%;
        }
        .table_list tr td span.Jian,
        .table_list tr td span.Jia {
            width:30%;
        }
    </style>
</head>
<body>
    <form action="/sand/apply" method="post" id="saveForm">
        <input type="hidden" name="werks" value="${werks}">
        <input type="hidden" name="orderNo" value="${orderNo}">
        <input type="hidden" name="nowDate">
        <input type="hidden" name="spetype">
        <div class="content">
            <div class="title">
                <h2>材料申请</h2>
                <a href="javascript:void(0);" onclick="window.history.go(-1);"><img src="/assets-new/4th/img/esc.png"></a>
            </div>
            <hr class="content_hr">
            <div class="content_soso">
                <p class="soso_date">
                    <span>期望送货日期：</span>
                    <input class="taskInputdate" type="date" name="webaz">
                </p>
                <p class="soso_name">
                    <span>备注：</span>
                    <input type="text" name="zgname" value="${zgname}">
                </p>
                <p class="soso_td">
                    <span>特单类型：</span>
                    <select class="select_td" name="bsart">
                        <c:forEach items="${maters}" var="mater">
                            <option value="${mater.bsart}" <c:if test="${mater.spetype=='1'}">selected</c:if> data-spetype="${mater.spetype}">
                                <c:if test="${mater.spetype=='1'}">直送特单-沙子水泥</c:if>
                                <c:if test="${mater.spetype=='2'}">直送特单-自流平</c:if>
                            </option>
                        </c:forEach>
                    </select>
                </p>
                <p class="soso_gys">
                    <span>供应商：</span>
                    <select class="select_gys" name="lifnr">
                        <c:forEach items="${supplyers}" var="supplyer">
                            <option value="${supplyer.lifnr}" <c:if test="${erpLfa1.lifnr==supplyer.lifnr}">selected</c:if>>${supplyer.name1}</option>
                        </c:forEach>
                    </select>
                </p>
            </div>
            <table class="table_list" border="0" cellspacing="0" cellpadding="0">
                <thead>
                    <tr class="table_listTr">
                        <th width="10%">序号</th>
                        <th width="17%">商品名称</th>
                        <th width="12%">品牌</th>
                        <th width="10%">单位</th>
                        <th width="17%">预计数量</th>
                        <th width="12%" class="j_price">单价</th>
                        <th width="12%" class="j_total_price">总价</th>
                    </tr>
                </thead>
                <tbody class="good_detail">
                    <c:forEach items="${details}" var="detail" varStatus="status">
                        <tr>
                            <td>${status.index+1}</td>
                            <td>${detail.goodsDescribe}</td>
                            <td>${detail.brandName}</td>
                            <td>${detail.meins}</td>
                            <td>
                                <span class="Jian">-</span>
                                <input type="hidden" name="matnr" value="${detail.goodsNo}">
                                <input type="text" name="menge" class="J_num" value="0">
                                <span class="Jia">+</span>
                            </td>
                            <td class="j_price">${detail.price}</td>
                            <td class="j_total_price">0</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <input class="buttom_1" type="button" value="确定">
        </div>
    </form>
</body>
</html>
<script type="text/javascript">
    $(function() {
        $(".nav").css("left","-16%");
        $(".nav").removeClass("animate");
        $(".content,.title").css("width","100%");
        $("body").delegate(".Jian","click",function() {
            var iNum=parseFloat($(this).parent("td").find(".J_num").eq(0).val().trim());
            iNum--;
            if(iNum>=0) {
                $(this).parent("td").find(".J_num").eq(0).val(iNum);
                var price=$(this).parents("tr").find(".j_price").eq(0).html().trim();
                $(this).parents("tr").find(".j_total_price").eq(0).html((iNum*parseFloat(price)).toFixed(2));
            }
        });
        $("body").delegate(".Jia","click",function() {
            var iNum=parseFloat($(this).parent("td").find(".J_num").eq(0).val().trim());
            iNum++;
            $(this).parent("td").find(".J_num").eq(0).val(iNum);
            var price=$(this).parents("tr").find(".j_price").eq(0).html().trim();
            $(this).parents("tr").find(".j_total_price").eq(0).html((iNum*parseFloat(price)).toFixed(2));
        });
        $("body").delegate(".J_num","blur",function() {
            var numReg=/^\d+(\.\d{1})?$/;
            if(!numReg.exec($(this).val().trim())) {
                $(this).val("0");
                $(this).parents("tr").find(".j_total_price").eq(0).html("0");
            } else {
                var iNum=parseFloat($(this).val().trim());
                var price=$(this).parents("tr").find(".j_price").eq(0).html().trim();
                $(this).parents("tr").find(".j_total_price").eq(0).html((iNum*parseFloat(price)).toFixed(2));
            }
        });
        $(".select_td").change(function() {
            var spetype=$(".select_td option:selected").data("spetype");
            $.ajax({
                url:"/sand/getSupplyer",
                type:"post",
                dataType:"json",
                data:{spetype:spetype},
                async:false,
                cache:false,
                success:function(result) {
                    $(".select_gys").empty();
                    if(result!=null&&result.length>0) {
                        for(var i=0;i<result.length;i++) {
                            if(i==0) {
                                $(".select_gys").append("<option value='"+result[i].lifnr+"' selected>"+result[i].name1+"</option>");
                            } else {
                                $(".select_gys").append("<option value='"+result[i].lifnr+"'>"+result[i].name1+"</option>");
                            }
                        }
                    }
                    var supplyNo=$(".select_gys option:selected").val();
                    $.ajax({
                        url:"/sand/getGood",
                        type:"post",
                        dataType:"json",
                        data:{spetype:spetype,supplyNo:supplyNo},
                        async:false,
                        cache:false,
                        success:function(data) {
                            $(".good_detail").empty();
                            if(data!=null&&data.length>0) {
                                for(var j=0;j<data.length;j++) {
                                    if(spetype=="1") {
                                        $(".j_price").show();
                                        $(".j_total_price").show();
                                        $(".good_detail").append("<tr><td>"+(j+1)+"</td><td>"+data[j].goodsDescribe+"</td><td>"+data[j].brandName+"</td><td>"+data[j].meins+"</td>"+
                                                "<td><span class='Jian'>-</span><input type='hidden' name='matnr' value='"+data[j].goodsNo+"'>"+
                                                "<input type='text' name='menge' class='J_num' value='0'><span class='Jia'>+</span></td>"+
                                                "<td class='j_price'>"+data[j].price+"</td><td class='j_total_price'>0</td></tr>");
                                    }
                                    if(spetype=="2") {
                                        $(".j_price").hide();
                                        $(".j_total_price").hide();
                                        $(".good_detail").append("<tr><td>"+(j+1)+"</td><td>"+data[j].goodsDescribe+"</td><td>"+data[j].brandName+"</td><td>"+data[j].meins+"</td>"+
                                                "<td><span class='Jian'>-</span><input type='hidden' name='matnr' value='"+data[j].goodsNo+"'>"+
                                                "<input type='text' name='menge' class='J_num' value='0'><span class='Jia'>+</span></td></tr>");
                                    }
                                }
                            }
                        }
                    });
                }
            });
        });
        $(".select_gys").change(function() {
            var spetype=$(".select_td option:selected").data("spetype");
            var supplyNo=$(".select_gys option:selected").val();
            $.ajax({
                url:"/sand/getGood",
                type:"post",
                dataType:"json",
                data:{spetype:spetype,supplyNo:supplyNo},
                async:false,
                cache:false,
                success:function(data) {
                    $(".good_detail").empty();
                    if(data!=null&&data.length>0) {
                        for(var j=0;j<data.length;j++) {
                            if(spetype=="1") {
                                $(".j_price").show();
                                $(".j_total_price").show();
                                $(".good_detail").append("<tr><td>"+(j+1)+"</td><td>"+data[j].goodsDescribe+"</td><td>"+data[j].brandName+"</td><td>"+data[j].meins+"</td>"+
                                        "<td><span class='Jian'>-</span><input type='hidden' name='matnr' value='"+data[j].goodsNo+"'>"+
                                        "<input type='text' name='menge' class='J_num' value='0'><span class='Jia'>+</span></td>"+
                                        "<td class='j_price'>"+data[j].price+"</td><td class='j_total_price'>0</td></tr>");
                            }
                            if(spetype=="2") {
                                $(".j_price").hide();
                                $(".j_total_price").hide();
                                $(".good_detail").append("<tr><td>"+(j+1)+"</td><td>"+data[j].goodsDescribe+"</td><td>"+data[j].brandName+"</td><td>"+data[j].meins+"</td>"+
                                        "<td><span class='Jian'>-</span><input type='hidden' name='matnr' value='"+data[j].goodsNo+"'>"+
                                        "<input type='text' name='menge' class='J_num' value='0'><span class='Jia'>+</span></td></tr>");
                            }
                        }
                    }
                }
            });
        });
        $(".buttom_1").click(function() {
            var totalNum=0;
            $(".J_num").each(function() {
                totalNum+=parseFloat($(this).val());
            });
            if(parseFloat(totalNum)<=0) {
                layer.alert("请输入预计数量",{icon:2});
                return false;
            }
            var werks=$("input[name='werks']").val();
            var sendDate=$("input[name='webaz']").val().trim();
            if(sendDate==null||sendDate=="") {
                layer.alert("请选择期望送货日期",{icon:2});
                return false;
            } else {
                $.ajax({
                    url:"/stuffAccept/validDate",
                    type:"post",
                    dataType:"json",
                    async:false,
                    cache:false,
                    success:function(result) {
                        $("input[name='nowDate']").val(result.nowDate);
                    }
                });
                var nowDate=$("input[name='nowDate']").val().trim();
                var date=new Date(Date.parse(sendDate.replace(/-/g,"/")));
                var todayDate;
                if(nowDate!=null&&nowDate!="") {
                    todayDate=new Date(Date.parse(nowDate.replace(/-/g,"/")));
                } else {
                    todayDate=new Date();
                }
                if(werks=="101"||werks=="404") {
                    var todayDateHour=todayDate.getHours();
                    if(todayDateHour>=12) {
                        todayDate.setDate(todayDate.getDate()+2);
                    } else {
                        todayDate.setDate(todayDate.getDate()+1);
                    }
                    var year=todayDate.getFullYear();
                    var month=(todayDate.getMonth()+1)>=10?(todayDate.getMonth()+1):"0"+(todayDate.getMonth()+1);
                    var day=todayDate.getDate()>=10?todayDate.getDate():"0"+todayDate.getDate();
                    var targetDayStr=year+"-"+month+"-"+day;
                    var targetDay=new Date(Date.parse(targetDayStr.replace(/-/g,"/")));
                    if(date<targetDay) {
                        layer.alert("选择的期望送货日期必须为："+targetDayStr+"（含）日之后的时间",{icon:2});
                        return false;
                    } else {
                        $(".buttom_1").attr("disabled",true);
                        $("input[name='spetype']").val($(".select_td option:selected").data("spetype"));
                        layer.msg('提交中，请稍候',{icon:16,time:5000,shade:0.1});
                        $("#saveForm").submit();
                    }
                } else {
                    var year=todayDate.getFullYear();
                    var month=(todayDate.getMonth()+1)>=10?(todayDate.getMonth()+1):"0"+(todayDate.getMonth()+1);
                    var day=todayDate.getDate()>=10?todayDate.getDate():"0"+todayDate.getDate();
                    var targetDayStr=year+"-"+month+"-"+day;
                    var targetDay=new Date(Date.parse(targetDayStr.replace(/-/g,"/")));
                    if(date<targetDay) {
                        layer.alert("选择的期望送货日期必须为："+targetDayStr+"（含）日之后的时间",{icon:2});
                        return false;
                    } else {
                        $(".buttom_1").attr("disabled",true);
                        $("input[name='spetype']").val($(".select_td option:selected").data("spetype"));
                        layer.msg('提交中，请稍候',{icon:16,time:5000,shade:0.1});
                        $("#saveForm").submit();
                    }
                }
            }
        });
    });
</script>
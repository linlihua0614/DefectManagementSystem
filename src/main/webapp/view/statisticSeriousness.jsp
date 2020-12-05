<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/css/listpage.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/echart/echarts.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>

  <script type="text/javascript">

    window.onload = function (){
        var projId = $("#projId").val();
        var handler = $("#handler").val();
        var startTime = $("#startTime").val();
        var endTime = $("#endTime").val();
        if(projId != null && projId != undefined && projId != ""){
            $.ajax({
                url: "/statis/getSeriousness?v="+Math.random(),    //请求的url地址
                data:{"projId":projId,"handler":handler,"startTime":startTime,"endTime":endTime},
                async:false,
                dataType: "json",   //返回格式为json
                type: "POST",   //请求方式
                success: function(data) {

                    if(data.ret==1){
                        var myChart = echarts.init(document.getElementById('main'));
                        option = {
                            title:{
                                text:'缺陷严重性数量统计',
                                left:'center'
                            },
                            legend: {
                                top:'15%'
                            },
                            tooltip: {},
                            dataset: {
                                dimensions: ['product', '已完成', '未完成'],
                                source: [
                                    {product: '非常严重', '已完成': data.fcyz_ed, '未完成': data.fcyz_ing},
                                    {product: '比较严重', '已完成': data.bjyz_ed, '未完成': data.bjyz_ing},
                                    {product: '一般', '已完成': data.yb_ed, '未完成':data.yb_ing},
                                    {product: '轻微', '已完成': data.qw_ed, '未完成': data.qw_ing}
                                ]
                            },
                            xAxis: {type: 'category'},
                            yAxis: {},
                            // Declare several bar series, each will be mapped
                            // to a column of dataset.source by default.
                            series: [
                                {type: 'bar'},
                                {type: 'bar'}
                            ],
                            grid:{top:'25%'}
                        };

                        myChart.setOption(option);


                        var myChart1 = echarts.init(document.getElementById('main1'));
                        //立即解决、高优先级、正常处理、低优先级
                        // 指定图表的配置项和数据
                        option1 = {
                            tooltip: {
                                trigger: 'item',
                                formatter: '{a} <br/>{b}: {c} ({d}%)'
                            },
                            title:{
                                text:'未完成缺陷严重性占比',
                                left:'center'
                            },
                            legend: {
                                orient: 'vertical',
                                left: 10,
                                top:'15%',
                                data: ['非常严重', '比较严重', '一般', '轻微']
                            },
                            series: [
                                {
                                    name: '严重性统计',
                                    type: 'pie',
                                    radius: ['50%', '70%'],
                                    avoidLabelOverlap: false,
                                    label: {
                                        show: false,
                                        position: 'center'
                                    },
                                    emphasis: {
                                        label: {
                                            show: true,
                                            fontSize: '30',
                                            fontWeight: 'bold'
                                        }
                                    },
                                    labelLine: {
                                        show: false
                                    },
                                    data: [
                                        {value: data.fcyz_ing, name: '非常严重'},
                                        {value: data.bjyz_ing, name: '比较严重'},
                                        {value: data.yb_ing, name: '一般'},
                                        {value: data.qw_ing, name: '轻微'}
                                    ]
                                }
                            ]
                        };

                        myChart1.setOption(option1);


                    }else{
                        alert("未查询到数据！");
                        return;
                    }

                },
                error: function(e) {
                    alert("系统异常，请联系管理员处理！");
                    return;
                }
            });
        }
    }

    function search() {
        var projId = $("#projId").val();
        if(projId==null || projId==undefined || projId==""){
            alert("必须选择查询项目");
        }else{
            $("#form1").submit();
        }
    }

  </script>
</head>
<body>
<div class="div">
    <form id="form1" action="${pageContext.request.contextPath}/statis/getSeriousnessInit" method="post" >
        <table>
            <tr>
                <td><span class="span">项目:</span></td>
                <td colspan="3">
                    <select id="projId" name="projId" value="${projId}"  class="select" style="width: 400px;">
                        <c:forEach items="${projs}" var="p">
                            <option value="${p.id}"  <c:if test="${p.id eq projId}">selected</c:if>>${p.projName}</option>
                        </c:forEach>
                    </select>
                </td>


            </tr>
            <tr>
                <td><span class="span">开始时间:</span></td>
                <td>
                    <input type="text" class="inp01 fl" name="startTime" id="startTime"
                           onFocus="WdatePicker({isShowClear:false,dateFmt:'yyyy-MM-dd'})"
                           value="${startTime}"/>
                </td>
                <td><span class="span">结束时间:</span></td>
                <td><input type="text" class="inp01 fl" name="endTime" id="endTime"
                           onFocus="WdatePicker({isShowClear:false,dateFmt:'yyyy-MM-dd'})"
                           value="${endTime}"/>
                </td>
            </tr>
            <tr>
                <td><span class="span">当前处理人:</span></td>
                <td colspan="2"><input id="handler" type="text" name="handler" value="${handler}"  class="input"/></td>
                <td align="right">
                    <input type="button"  value="查询" onclick="search();"  class="button"/>
                </td>
            </tr>
        </table>

    </form>
</div>

<div id="outerdiv" style="margin-top: 30px;width:900px;height:330px;float:left">
    <div id="main" style="width: 450px;height:300px;float:left"></div>
    <div id="main1" style="width: 450px;height:300px;float:left"></div>
</div>

</body>
</html>

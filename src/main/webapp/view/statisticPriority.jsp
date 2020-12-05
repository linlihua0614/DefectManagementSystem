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
          url: "/statis/getPriority?v="+Math.random(),    //请求的url地址
          data:{"projId":projId,"handler":handler,"startTime":startTime,"endTime":endTime},
          async:false,
          dataType: "json",   //返回格式为json
          type: "POST",   //请求方式
          success: function(data) {
            if(data.ret==1){
              var myChart = echarts.init(document.getElementById('main'));
              option = {
                title:{
                  text:'缺陷优先级数量统计',
                  left:'center'
                },
                legend: {
                  top:'15%'
                },
                tooltip: {},
                dataset: {
                  dimensions: ['product', '已完成', '未完成'],
                  source: [
                    {product: '立即解决', '已完成': data.lj_ed, '未完成': data.lj_ing},
                    {product: '高优先级', '已完成': data.gy_ed, '未完成': data.gy_ing},
                    {product: '正常处理', '已完成': data.zc_ed, '未完成':data.zc_ing},
                    {product: '低优先级', '已完成': data.dy_ed, '未完成': data.dy_ing}
                  ]
                },
                xAxis: {type: 'category'},
                yAxis: {},
                series: [
                  {type: 'bar'},
                  {type: 'bar'}
                ],
                grid:{top:'25%'}
              };

              myChart.setOption(option);


              var myChart1 = echarts.init(document.getElementById('main1'));
              option1 = {
                tooltip: {
                  trigger: 'item',
                  formatter: '{a} <br/>{b}: {c} ({d}%)'
                },
                title:{
                  text:'未完成缺陷优先级占比',
                  left:'center'
                },
                legend: {
                  orient: 'vertical',
                  left: 10,
                  top:'15%',
                  data: ['立即解决', '高优先级', '正常处理', '低优先级']
                },
                series: [
                  {
                    name: '优先级统计',
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
                      {value: data.lj_ing, name: '立即解决'},
                      {value: data.gy_ing, name: '高优先级'},
                      {value: data.zc_ing, name: '正常处理'},
                      {value: data.dy_ing, name: '低优先级'}
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
  <form id="form1" action="${pageContext.request.contextPath}/statis/getPriorityInit" method="post" >
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

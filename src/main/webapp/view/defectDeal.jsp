<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/css/dealpage.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/check.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/img.js"></script>
  <style>
    .div1{
      width: 111px;
      height: 70px;
      border:none;
    }

    .div2{
      width:111px;
      height:60px;
      border:none;
    }

    .div3{
      width:111px;
      height:10px;
      border:none;
      font: 1em sans-serif;
      font-size: 6px;
    }

  </style>
  <script>

    function dealDefect(){
      var remark = $("#remark").val();
      if(!is_empty(remark)){
        if(!is_allow_length(remark,100)){
          alert("备注不能超过100个字符！");
          return;
        }
      }

      var newState = $("#newState").val();
      if(newState=='assigned' || newState=='reopen'){
        var nextUser = $("#nextUser").val();
        if(is_empty(nextUser)){
          alert("必须制定下一步处理人！");
          return;
        }
        if(!is_allow_length(nextUser,15)){
          alert("下一步处理人不能超过15个字节！");
          return;
        }
      }
      if(newState=='assigned'){
        $.ajax({
          url: "/defect/checkNextUser?v="+Math.random(),    //请求的url地址
          data:{"userName":nextUser,"nextState":"assigned"},
          async:false,
          dataType: "text",   //返回格式为json
          type: "GET",   //请求方式
          success: function(ret) {
            if(ret=='1'){
              $("#form1").submit();
            }else{
              alert("请确认下一步处理人是否存在，且角色只能为缺陷解决人员！");
              return;
            }

          },
          error: function() {
            alert("系统异常，请联系管理员处理！");
            return;
          }
        });
      }

      if(newState=='reopen'){
        $.ajax({
          url: "/defect/checkNextUser?v="+Math.random(),    //请求的url地址
          data:{"userName":nextUser,"nextState":"reopen"},
          async:false,
          dataType: "text",   //返回格式为json
          type: "GET",   //请求方式
          success: function(ret) {
            if(ret=='1'){
              $("#form1").submit();
            }else{
              alert("请确认下一步处理人是否存在，且角色只能为缺陷确认人员或者缺陷解决人员！");
              return;
            }

          },
          error: function() {
            alert("系统异常，请联系管理员处理！");
            return;
          }
        });
      }
      if(newState=='fixed' || newState=='rejectd' || newState=='deferred' ||newState=='closed'){
        $("#form1").submit();
      }
    }
    <%--缺陷状态：new：新建、open：打开、assigned：已指派、fixed：已修复、rejectd:拒绝、deferred:延期、reopen：从新打开、closed：关闭--%>
    function optChange(){
      var newState = $("#newState").val();
      if(newState=='assigned' || newState=='reopen'){
        $("#nextUser").show();
      }else{
        $("#nextUser").hide();
      }
    }
  </script>
</head>
<body>
<div class="div">
  <table class="data2">

    <tr>
      <td style="width: 10%;"><label>项目:</label></td>
      <td style="width:30%;"><span>${defect.projName}</span></td>
      <td style="width:10%;"><label>缺陷状态:</label></td>
      <td style="width: 30%;"><span>${defect.stateStr}</span></td>
    </tr>
    <tr>
      <td style="width:10%;"><label>项目所处阶段:</label></td>
      <td style="width:30%;"><span>${defect.atProjStateStr}</span></td>
      <td style="width:10%;"><label>模块:</label></td>
      <td style="width: 30%;"><span>${defect.module}</span></td>
    </tr>

    <tr>
      <td><label>缺陷类型:</label></td>
      <td><span>${defect.typeStr}</span></td>
      <td><label>复现率:</label></td>
      <td><span>${defect.recurrenceRateStr}</span></td>
    </tr>

    <tr>
      <td><label>重要性:</label></td>
      <td><span>${defect.seriousnessStr}</span></td>
      <td><label>优先级:</label></td>
      <td><span>${defect.priorityStr}</span></td>
    </tr>

    <tr>
      <td><label>创建人:</label></td>
      <td><span>${defect.tester}</span></td>
      <td><label>当前处理人:</label></td>
      <td><span>${defect.handler}</span></td>
    </tr>

    <tr>
      <td><label>操作步骤:</label></td>
      <td colspan="3"><span>${defect.step}</span></td>
    </tr>

    <tr>
      <td><label>实际结果:</label></td>
      <td colspan="3"><span>${defect.actualResult}</span></td>
    </tr>

    <tr>
      <td><label>预期结果:</label></td>
      <td colspan="3"><span>${defect.expectResult}</span></td>
    </tr>

    <tr>
      <td><label>备注:</label></td>
      <td colspan="3"><span>${defect.remark}</span></td>
    </tr>
  </table>

  <table>
    <tr>&nbsp;</tr>
    <tr>
      <td><label class="label">截图:</label></td>

      <td>
        <div class="div1">
          <div class="div2">
            <img id="img1" onclick="imgShow('1');"  height="60" width="60" src="/defect/imgGetFromDB?defectId=${defect.id}&imgId=img1"/>
          </div>
          <div class="div3"><a href="/defect/imgDown?defectId=${defect.id}&imgId=img1">下载</a></div>
        </div>
      </td>

      <td>
        <div class="div1">
          <div class="div2">
            <img id="img2" onclick="imgShow('2');" height="60" width="60" src="/defect/imgGetFromDB?defectId=${defect.id}&imgId=img2"/>
          </div>
          <div class="div3"><a href="/defect/imgDown?defectId=${defect.id}&imgId=img2">下载</a></div>
        </div>
      </td>
      <td>
        <div class="div1">
          <div class="div2">
            <img id="img3" onclick="imgShow('3');"  height="60" width="60" src="/defect/imgGetFromDB?defectId=${defect.id}&imgId=img3"/>
          </div>
          <div class="div3"><a href="/defect/imgDown?defectId=${defect.id}&imgId=img3">下载</a></div>
        </div>
      </td>
      <td>
        <div class="div1">
          <div class="div2">
            <img id="img4" onclick="imgShow('4');" height="60" width="60" src="/defect/imgGetFromDB?defectId=${defect.id}&imgId=img4"/>
          </div>
          <div class="div3"><a href="/defect/imgDown?defectId=${defect.id}&imgId=img4">下载</a></div>
        </div>
      </td>
      <td>
        <div class="div1">
          <div class="div2">
            <img id="img5" onclick="imgShow('5');" height="60" width="60" src="/defect/imgGetFromDB?defectId=${defect.id}&imgId=img5"/>
          </div>
          <div class="div3"><a href="/defect/imgDown?defectId=${defect.id}&imgId=img5">下载</a></div>
        </div>
      </td>
      <td>
        <div class="div1">
          <div class="div2">
            <img id="img6" onclick="imgShow('6');"  height="60" width="60" src="/defect/imgGetFromDB?defectId=${defect.id}&imgId=img6"/>
          </div>
          <div class="div3"><a href="/defect/imgDown?defectId=${defect.id}&imgId=img6">下载</a></div>
        </div>
      </td>
    </tr>
    <tr>&nbsp;</tr>
  </table>

  <table class="data1">
    <tr>
      <th><span style="font-size: 12px;">处理人</span></th>
      <th><span style="font-size: 12px;">角色</span></th>
      <th><span style="font-size: 12px;">操作前状态</span></th>
      <th><span style="font-size: 12px;">操作后状态</span></th>
      <th><span style="font-size: 12px;">处理时间</span></th>
      <th><span style="font-size: 12px;">下一步处理人</span></th>
      <th><span style="font-size: 12px;">备注</span></th>
    </tr>
    <c:forEach items="${defectDeals}" var="p">
      <tr>
        <td>${p.dealUser}</td>
        <td>${p.roleStr}</td>
        <td>${p.oldStateStr}</td>
        <td>${p.newStateStr}</td>
        <td><fmt:formatDate value="${p.dealTime }" type="date" pattern="yyyy-MM-dd HH:mm"/></td>
        <td>${p.nextUser}</td>
        <td>${p.remark}</td>
      </tr>
    </c:forEach>
  </table>
</div>



<div class="div" style="margin-top: 9px;">
  <form id="form1" action="${pageContext.request.contextPath}/defect/deal" method="post">
    <input id="defectId"  type="hidden" name="defectId" value="${defect.id}" class="input"/>
    <input id="oldState"  type="hidden" name="oldState" value="${defect.state}" class="input"/>
  <table>
    <%--缺陷状态：new：新建、open：打开、assigned：已指派、fixed：已修复、rejectd:拒绝、deferred:延期、reopen：从新打开、closed：关闭--%>
    <tr>
      <td><label class="label">操作：</label></td>
      <td>
        <select id="newState" name="newState" class="select" style="width: 150px;" onchange="optChange();">
          <c:if test="${'open' eq defect.state}">
            <option value="rejectd" selected>拒绝</option>
            <option value="deferred">延期</option>
            <option value="assigned">指派</option>
          </c:if>
          <c:if test="${'assigned' eq defect.state}">
            <option value="fixed"  selected>已修复</option>
            <option value="rejectd">拒绝</option>
          </c:if>
          <c:if test="${'fixed' eq defect.state}">
            <option value="reopen">再次打开</option>
            <option value="closed"  selected>关闭</option>
          </c:if>
          <c:if test="${'rejectd' eq defect.state}">
            <option value="reopen">再次打开</option>
            <option value="closed"  selected>关闭</option>
          </c:if>
          <c:if test="${'deferred' eq defect.state}">
            <option value="reopen">再次打开</option>
            <option value="closed"  selected>关闭</option>
          </c:if>
          <c:if test="${role eq 1 && 'reopen' eq defect.state}">
            <option value="fixed"  selected>已修复</option>
            <option value="rejectd">拒绝</option>
          </c:if>
          <c:if test="${role eq 3 && 'reopen' eq defect.state}">
            <option value="rejectd"  selected>拒绝</option>
            <option value="deferred">延期</option>
            <option value="assigned">指派</option>
          </c:if>
        </select>
      </td>
      <td><input id="nextUser" type="text" name="nextUser" class="input" style="display: none;width: 150px;" placeholder="指定下一步处理人"/></td>
    </tr>

      <tr>
        <td><label class="label">备注:</label></td>
        <td colspan="3"><textarea id="remark" name="remark" class="textarea" style="height: 3em"></textarea></td>
      </tr>
    <tr>
      <td colspan="3" align="center" >
        <input type="button"  onclick="dealDefect();"  value="确定" class="button"/>
      </td>
    </tr>

  </table>
 </form>
</div>

<div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
  <div id="innerdiv" style="position:absolute;">
    <img id="bigimg" style="border:5px solid #fff;" src="" />
  </div>
</div>
</body>
</html>

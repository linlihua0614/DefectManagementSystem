<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link type="text/css" rel="stylesheet"  href="${pageContext.request.contextPath}/css/dealpage.css">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script>
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
    function returnList(){
      window.history.go(-1); //返回上一页
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
      <td style="width:10%;;"><label>项目所处阶段:</label></td>
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
  <table width="90%">
    <tr>&nbsp;</tr>
    <tr>
      <td align="center" >
        <input type="button"  onclick="returnList();"  value="返回" class="button"/>
      </td>
    </tr>
  </table>
</div>


<div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
  <div id="innerdiv" style="position:absolute;">
    <img id="bigimg" style="border:5px solid #fff;" src="" />
  </div>
</div>
</body>
</html>
